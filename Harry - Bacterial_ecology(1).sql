SELECT DISTINCT
  SPatient.PatientSSN
  ,SPatient.PatientName
  ,SPatient.Age
  ,SPatient.Gender
  ,Ward.WardLocationName
  ,Bed.RoomBed
  ,Inpatient.AdmitDateTime
  ,Microbiology.SpecimenTakenDateTime
  ,Inpatient.DischargeDateTime
  ,MicroBiology.RequestingWard
  ,MicroBiology.SpecimenComment
  ,DimCollectionSample.CollectionSample
  ,AntiSens.OrganismQuantity
  ,AntiSens.AntibioticSensitivityValue
  ,AntiSensComm.AntibioticSensitivityComments
  ,DimAntibiotic.Antibiotic
  ,DimAntibiotic.DrugNodeIEN
  ,DimAntibiotic.AntibioticDisplayComment
  ,DimAntibiotic.LabProcedure
  ,DimOrganism.Organism
  ,DimOrganism.OrganismCategory
  ,DimOrganism.GramStain
  ,SAddress.City AS PatientCity
  ,SAddress.County AS PatientCounty
  ,SAddress.State AS PatientState
  ,SAddress.Zip AS PatientZip
  ,SAddress.GISPatientAddressLongitude AS PatientLON
  ,SAddress.GISPatientAddressLatitude AS PatientLAT
  ,SAddress.GISFIPSCode AS PatientFIPS
  ,SAddress.GISMarket AS PatientMarket
  ,SAddress.GISSubmarket AS PatientSubmarket
FROM
  LSV.SPatient.SPatientAddress AS SAddress
  INNER JOIN LSV.BISL_R1VX.AR3Y_SPatient_SPatient AS SPatient
    ON SAddress.PatientSID = SPatient.PatientSID
	AND SPatient.Sta3n = '612'

  INNER JOIN LSV.Micro.Microbiology AS Microbiology
    ON SPatient.PatientSID = Microbiology.PatientSID 
	AND Microbiology.Sta3n = '612'
  LEFT JOIN LSV.Dim.CollectionSample AS DimCollectionSample
    ON Microbiology.CollectionSampleSID = DimCollectionSample.CollectionSampleSID 
	AND DimCollectionSample.Sta3n = '612'
  INNER JOIN LSV.Micro.AntibioticSensitivity AS AntiSens
    ON Microbiology.MicrobiologySID = AntiSens.MicrobiologySID 
	AND AntiSens.Sta3n = '612'
  LEFT JOIN LSV.Micro.AntibioticSensitivityComment AS AntiSensComm
    ON AntiSens.MicroBiologySID = AntiSensComm.MicroBiologySID
	AND AntiSensComm.Sta3n = '612'
  LEFT JOIN LSV.Dim.Antibiotic AS DimAntibiotic
    ON AntiSens.AntibioticSID = DimAntibiotic.AntibioticSID
	AND DimAntibiotic.Sta3n = '612'
  LEFT JOIN LSV.Dim.Organism AS DimOrganism
    ON AntiSens.OrganismSID = DimOrganism.OrganismSID
	AND DimOrganism.Sta3n = '612'

  LEFT JOIN LSV.BISL_R1VX.AR3Y_Inpat_Inpatient AS Inpatient
    ON SPatient.PatientSID = Inpatient.PatientSID
	AND Inpatient.Sta3n = '612'
  LEFT JOIN LSV.Dim.WardLocation AS Ward
    ON Inpatient.AdmitWardLocationSID = Ward.WardLocationSID
    AND Ward.Sta3n = '612'
  LEFT JOIN LSV.Dim.RoomBed AS Bed
    ON Inpatient.AdmitRoomBedSID = Bed.RoomBedSID
    AND Bed.Sta3n = '612'
WHERE
  SAddress.Sta3n = '612'
  AND SAddress.RelationshipToPatient = 'SELF'
  AND SAddress.AddressType = 'PATIENT'
  AND SPatient.TestPatientFlag IS NULL
  AND Microbiology.SpecimenTakenDateTime >= DATEADD(MONTH, -24, GETDATE())