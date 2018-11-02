USE LSV;
GO
CREATE PROCEDURE Bacterial_Ecology_Outpatient
AS
DECLARE @Sta3n smallint = 612

-- SPatient Info
SELECT 
	 SPatient.PatientSID
	,SPatient.Sta3n
	,SPatient.PatientSSN
	,SPatient.PatientName
	,SAddress.Zip AS PatientZip
	,SAddress.GISPatientAddressLongitude AS PatientLON
	,SAddress.GISPatientAddressLatitude AS PatientLAT
	,SAddress.GISFIPSCode AS PatientFIPS
INTO
	#Temp_BEO_0
FROM
	CDWWork.SPatient.SPatient AS SPatient
	INNER JOIN CDWWork.SPatient.SPatientAddress AS SAddress
		ON SPatient.PatientSID = SAddress.PatientSID
WHERE
	SPatient.Sta3n =  @Sta3n
	AND SAddress.Sta3n =  @Sta3n
	AND SPatient.TestPatientFlag IS NULL
	AND SAddress.RelationshipToPatient = 'SELF'
	AND SAddress.AddressType = 'PATIENT'

-- Visits
SELECT
	 tbl0.PatientSID
	,tbl0.Sta3n
	,tbl0.PatientSSN
	,tbl0.PatientName
	,tbl0.PatientZip
	,tbl0.PatientLON
	,tbl0.PatientLAT
	,tbl0.PatientFIPS
	,OutpatVisit.VisitSID
	,CAST(OutpatVisit.VisitDateTime AS DATE) AS VisitDate
	,OutpatVisit.LocationSID AS OutpatLocationSID
	,DimICD10.ICD10Description
INTO
	#Temp_BEO_1
FROM
	#Temp_BEO_0 as tbl0
	INNER JOIN CDWWork.BISL_R1VX.AR3Y_Outpat_Visit AS OutpatVisit
		ON tbl0.PatientSID = OutpatVisit.PatientSID
	LEFT JOIN CDWWork.BISL_R1VX.AR3Y_Outpat_VDiagnosis AS OutpatVDiagnosis
		ON OutpatVisit.VisitSID = OutpatVDiagnosis.VisitSID
	LEFT JOIN CDWWork.Dim.ICD10DescriptionVersion AS DimICD10
		ON OutpatVDiagnosis.ICD10SID = DimICD10.ICD10SID
WHERE
	OutpatVisit.Sta3n =  @Sta3n
	AND OutpatVisit.VisitDateTime >= CAST(DATEADD(month, -6, GETDATE()) AS DATE)

-- Microbiome
SELECT
	 tbl1.PatientSID
	,tbl1.Sta3n
	,tbl1.PatientSSN
	,tbl1.PatientName
	,tbl1.PatientZip
	,tbl1.PatientLON
	,tbl1.PatientLAT
	,tbl1.PatientFIPS
	,tbl1.VisitSID
	,tbl1.VisitDate
	,tbl1.OutpatLocationSID
	,tbl1.ICD10Description
	--,Microbiology.MicrobiologySID
	,CAST(Microbiology.SpecimenTakenDateTime AS DATE) AS SpecimenTakenDate
	--,Microbiology.SpecimenComment
	,DimCollectionSample.CollectionSample
	,AntibioticSensitivity.OrganismQuantity
	,AntibioticSensitivity.AntibioticSensitivityValue
	,DimAntibiotic.Antibiotic
	--,DimAntibiotic.AntibioticDisplayComment
	,DimOrganism.Organism
INTO
	#Temp_BEO_2
FROM
	#Temp_BEO_1 AS tbl1
	LEFT JOIN CDWWork.Micro.Microbiology AS Microbiology
		ON tbl1.PatientSID = Microbiology.PatientSID
	LEFT JOIN CDWWork.Dim.CollectionSample AS DimCollectionSample
		ON Microbiology.CollectionSampleSID = DimCollectionSample.CollectionSampleSID 
	LEFT JOIN CDWWork.Micro.AntibioticSensitivity AS AntibioticSensitivity
		ON Microbiology.MicrobiologySID = AntibioticSensitivity.MicrobiologySID 
	LEFT JOIN CDWWork.Dim.Antibiotic AS DimAntibiotic
		ON AntibioticSensitivity.AntibioticSID = DimAntibiotic.AntibioticSID
	LEFT JOIN CDWWork.Dim.Organism AS DimOrganism
		ON AntibioticSensitivity.OrganismSID = DimOrganism.OrganismSID
WHERE
	Microbiology.Sta3n =  @Sta3n
	AND Microbiology.SpecimenTakenDateTime BETWEEN tbl1.VisitDate AND CAST(DATEADD(day, +3, tbl1.VisitDate) AS DATE)

DROP TABLE IF EXISTS #Temp_BEO_1 

CREATE CLUSTERED COLUMNSTORE INDEX ccsi_temp_beo_2
	ON #Temp_BEO_2

-- RxOutpat -- This is where the slow down is...
SELECT
	 tbl2.PatientSID
	,tbl2.Sta3n
	,tbl2.PatientSSN
	,tbl2.PatientName
	,tbl2.PatientZip
	,tbl2.PatientLON
	,tbl2.PatientLAT
	,tbl2.PatientFIPS
	,tbl2.VisitSID
	,tbl2.VisitDate
	,tbl2.OutpatLocationSID
	,tbl2.ICD10Description
	--,tbl2.MicrobiologySID
	,tbl2.SpecimenTakenDate
	--,tbl2.SpecimenComment
	,tbl2.CollectionSample
	,tbl2.OrganismQuantity
	,tbl2.AntibioticSensitivityValue
	,tbl2.Antibiotic
	--,tbl2.AntibioticDisplayComment
	,tbl2.Organism
	--,RxOutpat.RxOutpatSID
	,RxOutpat.IssueDate
	--,RxOutpat.ProviderSID
	--,RxOutpat.PharmacyOrderableItemSID
	,RxOutpat.LocationSID AS RxOutpatLocationSID
	,RxOutpatFill.LocalDrugNameWithDose
	,RxOutpatFill.LocalDrugSID
	,RxOutpatFill.Qty
	,RxOutpatFill.NationalDrugSID
	,RxOutpatFill.FillRemarks
	,DimLocalDrug.DrugClassSID
INTO
	#Temp_BEO_3
FROM
	#Temp_BEO_2 AS tbl2
	LEFT JOIN CDWWork.BISL_R1VX.AR3Y_RxOut_RxOutpat AS RxOutpat
		ON tbl2.PatientSID = RxOutpat.PatientSID
	LEFT JOIN CDWWork.BISL_R1VX.AR3Y_RxOut_RxOutpatfill AS RxOutpatFill
		ON RxOutpat.RxOutpatSID = RxOutpatFill.RxOutpatSID
	LEFT JOIN CDWWork.Dim.LocalDrug AS DimLocalDrug
		ON RxOutpatFill.localdrugsid = DimLocalDrug.localdrugsid
WHERE
	RxOutpat.Sta3n = @Sta3n -- @Sta3n
	AND RxOutpat.IssueDate >= CAST(DATEADD(MONTH, -6, GETDATE()) AS DATE)
	AND DimLocalDrug.DrugClassSID in ('800010973', '800010982', '800010983', '800010984', '800011263') 

DROP TABLE IF EXISTS D05_VISN21Sites.MAC.Temp_BEO_2

-- Locations, Primary Stop
SELECT
	 tbl3.PatientSID
	,tbl3.Sta3n
	,tbl3.PatientSSN
	,tbl3.PatientName
	,tbl3.PatientZip
	,tbl3.PatientLON
	,tbl3.PatientLAT
	,tbl3.PatientFIPS
	--,tbl3.VisitSID
	,tbl3.VisitDate
	,tbl3.OutpatLocationSID
	,OutpatDimLocation.LocationName AS OutpatLocationName
	,OutpatDimLocation.PrimaryStopCodeSID AS OutpatPrimaryStopCodeSID
	,OutpatDimStopCode1.StopCode AS OutpatPrimaryStopCode
	,OutpatDimStopCode1.StopCodeName AS OutpatPrimaryStopCodeName
	,tbl3.ICD10Description
	--,tbl3.RxOutpatSID
	,tbl3.IssueDate
	--,tbl3.ProviderSID
	--,tbl3.PharmacyOrderableItemSID
	,tbl3.RxOutpatLocationSID
	,RxOutpatDimLocation.LocationName AS RxOutpatLocationName
	,RxOutpatDimLocation.PrimaryStopCodeSID AS RxOutpatPrimaryStopCodeSID
	,RxOutpatDimStopCode1.StopCode AS RxOutpatPrimaryStopCode
	,RxOutpatDimStopCode1.StopCodeName AS RxOutpatPrimaryStopCodeName
	,tbl3.LocalDrugNameWithDose
	--,tbl3.LocalDrugSID
	,tbl3.Qty
	--,tbl3.NationalDrugSID
	,tbl3.FillRemarks
	--,tbl3.DrugClassSID
	--,tbl3.MicrobiologySID
	,tbl3.SpecimenTakenDate
	--,tbl3.SpecimenComment
	,tbl3.CollectionSample
	,tbl3.OrganismQuantity
	,tbl3.AntibioticSensitivityValue
	,tbl3.Antibiotic
	--,tbl3.AntibioticDisplayComment
	,tbl3.Organism
INTO
	#Temp_BEO_4
FROM
	#Temp_BEO_3 AS tbl3
	LEFT JOIN CDWWork.Dim.Location AS OutpatDimLocation
		ON tbl3.OutpatLocationSID = OutpatDimLocation.LocationSID
	LEFT JOIN CDWWork.Dim.StopCode AS OutpatDimStopCode1
		ON OutpatDimLocation.PrimaryStopCodeSID = OutpatDimStopCode1.StopCodeSID
	LEFT JOIN CDWWork.Dim.Location AS RxOutpatDimLocation
		ON tbl3.RxOutpatLocationSID = RxOutpatDimLocation.LocationSID
	LEFT JOIN CDWWork.Dim.StopCode AS RxOutpatDimStopCode1
		ON RxOutpatDimLocation.PrimaryStopCodeSID = RxOutpatDimStopCode1.StopCodeSID
WHERE
	OutpatDimLocation.Sta3n =  @Sta3n

DROP TABLE IF EXISTS #Temp_BEO_3

-- Locations, Secondary Stop
SELECT
	 tbl4.PatientSID
	,tbl4.Sta3n
	,tbl4.PatientSSN
	,tbl4.PatientName
	,tbl4.PatientZip
	,tbl4.PatientLON
	,tbl4.PatientLAT
	,tbl4.PatientFIPS
	--,tbl4.VisitSID
	,tbl4.VisitDate
	,tbl4.OutpatLocationSID
	,tbl4.OutpatLocationName
	,tbl4.OutpatPrimaryStopCode
	,tbl4.OutpatPrimaryStopCodeName
	,OutpatDimStopCode2.StopCode AS OutpatSecondaryStopCode
	,OutpatDimStopCode2.StopCodeName AS OutpatSecondaryStopCodeName
	,tbl4.ICD10Description
	--,tbl4.RxOutpatSID
	,tbl4.IssueDate
	--,tbl4.ProviderSID
	--,tbl4.PharmacyOrderableItemSID
	,tbl4.RxOutpatLocationSID
	,tbl4.RxOutpatLocationName
	,tbl4.RxOutpatPrimaryStopCodeSID
	,tbl4.RxOutpatPrimaryStopCode
	,tbl4.RxOutpatPrimaryStopCodeName
	,RxOutpatDimStopCode2.StopCode AS RxOutpatSecondaryStopCode
	,RxOutpatDimStopCode2.StopCodeName AS RxOutpatSecondaryStopCodeName
	,tbl4.LocalDrugNameWithDose
	--,tbl4.LocalDrugSID
	,tbl4.Qty
	--,tbl4.NationalDrugSID
	,tbl4.FillRemarks
	--,tbl4.DrugClassSID
	--,tbl4.MicrobiologySID
	,tbl4.SpecimenTakenDate
	--,tbl4.SpecimenComment
	,tbl4.CollectionSample
	,tbl4.OrganismQuantity
	,tbl4.AntibioticSensitivityValue
	,tbl4.Antibiotic
	--,tbl4.AntibioticDisplayComment
	,tbl4.Organism
INTO
	#Temp_BEO_5
FROM
	#Temp_BEO_4 AS tbl4
	LEFT JOIN CDWWork.Dim.Location AS OutpatDimLocation
		ON tbl4.OutpatLocationSID = OutpatDimLocation.LocationSID
	LEFT JOIN CDWWork.Dim.StopCode AS OutpatDimStopCode2
		ON OutpatDimLocation.SecondaryStopCodeSID = OutpatDimStopCode2.StopCodeSID
	LEFT JOIN CDWWork.Dim.Location AS RxOutpatDimLocation
		ON tbl4.RxOutpatLocationSID = RxOutpatDimLocation.LocationSID
	LEFT JOIN CDWWork.Dim.StopCode AS RxOutpatDimStopCode2
		ON RxOutpatDimLocation.SecondaryStopCodeSID = RxOutpatDimStopCode2.StopCodeSID
WHERE
	OutpatDimLocation.Sta3n = @Sta3n
	
DROP TABLE IF EXISTS #Temp_BEO_4

-- Clean slate
DROP TABLE IF EXISTS D05_VISN21Sites.MAC.Bacterial_Ecology_Outpatient
-- Final table
--USE D05_VISN21Sites
SELECT
	 tbl5.PatientSID
	,tbl5.Sta3n
	,tbl5.PatientSSN
	,tbl5.PatientName
	,tbl5.PatientZip
	,tbl5.PatientLON
	,tbl5.PatientLAT
	,tbl5.PatientFIPS
	,tbl5.VisitDate
	,tbl5.OutpatLocationSID
	,tbl5.OutpatLocationName
	,tbl5.OutpatPrimaryStopCode
	,tbl5.OutpatPrimaryStopCodeName
	,tbl5.OutpatSecondaryStopCode
	,tbl5.OutpatSecondaryStopCodeName
	,tbl5.ICD10Description
	,tbl5.IssueDate
	,tbl5.RxOutpatLocationSID
	,tbl5.RxOutpatLocationName
	,tbl5.RxOutpatPrimaryStopCodeSID
	,tbl5.RxOutpatPrimaryStopCode
	,tbl5.RxOutpatPrimaryStopCodeName
	,tbl5.RxOutpatSecondaryStopCode
	,tbl5.RxOutpatSecondaryStopCodeName
	,tbl5.LocalDrugNameWithDose
	,tbl5.Qty
	,tbl5.SpecimenTakenDate
	,tbl5.CollectionSample
	,tbl5.OrganismQuantity
	,tbl5.AntibioticSensitivityValue
	,tbl5.Antibiotic
	,tbl5.Organism
INTO
	D05_VISN21Sites.MAC.Bacterial_Ecology_Outpatient
FROM
	#Temp_BEO_5 AS tbl5 
WHERE
	(
		SpecimenTakenDate BETWEEN DATEADD(DAY, -1, VisitDate) AND DATEADD(DAY, +5, VisitDate)
		OR SpecimenTakenDate IS NULL
	)
	AND (
		IssueDate BETWEEN DATEADD(DAY, -1, SpecimenTakenDate) AND DATEADD(DAY, +5, SpecimenTakenDate)
		OR IssueDate IS NULL
	)
	AND OutpatLocationName NOT LIKE 'LAB%'

CREATE CLUSTERED COLUMNSTORE INDEX ccsi_Bacterial_Ecology_Outpatient
	ON D05_VISN21Sites.MAC.Bacterial_Ecology_Outpatient

-- Clean up
DROP TABLE IF EXISTS #Temp_BEO_0, #Temp_BEO_2, #Temp_BEO_2, #Temp_BEO_3, #Temp_BEO_4, #Temp_BEO_5
GO