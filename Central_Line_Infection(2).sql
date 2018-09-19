;WITH Patient AS ( -- Patients w/ central line healthfactors
SELECT DISTINCT
  SPat.PatientSSN
  ,SPat.PatientSID
  ,SPat.PatientName
  ,HF.HealthFactorDateTime
  ,HFT.HealthFactorType
  ,HFT.HealthFactorCategory
FROM
  LSV.Dim.HealthFactorType AS HFT
  INNER JOIN LSV.BISL_R1VX.AR3Y_HF_HealthFactor AS HF
    ON HF.HEalthFactorTypeSID = HFT.HealthfactorTypeSID
	AND HF.Sta3n = '612'
  INNER JOIN LSV.BISL_R1VX.AR3Y_SPatient_SPatient AS SPat
    ON SPat.PatientSID = HF.PatientSID
	AND SPat.Sta3n = '612'
WHERE
  HFT.Sta3n = '612'
  AND (
    HFT.HealthFactorType LIKE '%LOC%'
    OR HFT.HealthFactorType LIKE '%TYPE%'
	OR HFT.HealthFactorType LIKE '%NEW%'
	OR HFT.HealthFactorType LIKE '%STATUS%'
  )
  AND HFT.HealthFactorCategory LIKE 'CENTRAL%'
  AND HF.HealthFactorDateTime >= DATEADD(DAY, -90, GETDATE())
),
Visit AS (
SELECT DISTINCT
  SPat.PatientSID
  ,Outpat.VisitDateTime
  ,Loc.LocationName
FROM
  LSV.Dim.HealthFactorType AS HFT
  INNER JOIN LSV.BISL_R1VX.AR3Y_HF_HealthFactor AS HF
    ON HFT.HEalthFactorTypeSID = HF.HealthfactorTypeSID
	AND HF.Sta3n = '612'
  INNER JOIN LSV.BISL_R1VX.AR3Y_SPatient_SPatient AS SPat
    ON HF.PatientSID = SPat.PatientSID
	AND SPat.Sta3n = '612'
  INNER JOIN LSV.BISL_R1VX.AR3Y_Outpat_Visit AS Outpat
    ON SPat.PatientSID = Outpat.PatientSID
	AND Outpat.Sta3n = '612'
  LEFT JOIN LSV.Dim.Location AS Loc
    ON Outpat.LocationSID = Loc.LocationSID
	AND Loc.Sta3n = '612'
WHERE
  HFT.Sta3n = '612'
  AND (
    HFT.HealthFactorType LIKE '%LOC%'
    OR HFT.HealthFactorType LIKE '%TYPE%'
	OR HFT.HealthFactorType LIKE '%NEW%'
	OR HFT.HealthFactorType LIKE '%STATUS%'
  )
  AND HFT.HealthFactorCategory LIKE 'CENTRAL%'
  AND HF.HealthFactorDateTime >= DATEADD(DAY, -90, GETDATE())
  AND Outpat.VisitSID = HF.VisitSID
),
AdmitTo AS (
SELECT DISTINCT
  SPat.PatientSID
  ,Inpat.InpatientSID
  ,Inpat.AdmitDateTime
  --,Inpat.DischargeDateTime
  ,AdmitTo.WardLocationName AS AdmitToWardLocation
  ,AdmitTo.DivisionName AS AdmitToDivisionName
FROM
  LSV.Dim.HealthFactorType AS HFT
  INNER JOIN LSV.BISL_R1VX.AR3Y_HF_HealthFactor AS HF
    ON HFT.HEalthFactorTypeSID = HF.HealthfactorTypeSID
	AND HF.Sta3n = '612'
  INNER JOIN LSV.BISL_R1VX.AR3Y_SPatient_SPatient AS SPat
    ON HF.PatientSID = SPat.PatientSID
	AND SPat.Sta3n = '612'
  INNER JOIN LSV.BISL_R1VX.AR3Y_Inpat_Inpatient AS Inpat
    ON SPat.PatientSID = Inpat.PatientSID
	AND Inpat.Sta3n = '612'
  LEFT JOIN LSV.Dim.WardLocation AS AdmitTo
    ON Inpat.AdmitWardLocationSID = AdmitTo.WardLocationSID
	AND AdmitTo.Sta3n = '612'
WHERE
  HFT.Sta3n = '612'
  AND (
    HFT.HealthFactorType LIKE '%LOC%'
    OR HFT.HealthFactorType LIKE '%TYPE%'
	OR HFT.HealthFactorType LIKE '%NEW%'
	OR HFT.HealthFactorType LIKE '%STATUS%'
  )
  AND HFT.HealthFactorCategory LIKE 'CENTRAL%'
  AND HF.HealthFactorDateTime >= DATEADD(DAY, -90, GETDATE())
),
DischargeFrom AS (
SELECT DISTINCT
  SPat.PatientSID
  ,Inpat.InpatientSID
  --,Inpat.AdmitDateTime
  ,Inpat.DischargeDateTime
  ,DischargeFrom.WardLocationName AS DischargeToWardLocation
  ,DischargeFrom.DivisionName AS DischargeToDivisionName
FROM
  LSV.Dim.HealthFactorType AS HFT
  INNER JOIN LSV.BISL_R1VX.AR3Y_HF_HealthFactor AS HF
    ON HFT.HEalthFactorTypeSID = HF.HealthfactorTypeSID
	AND HF.Sta3n = '612'
  INNER JOIN LSV.BISL_R1VX.AR3Y_SPatient_SPatient AS SPat
    ON HF.PatientSID = SPat.PatientSID
	AND SPat.Sta3n = '612'
  INNER JOIN LSV.BISL_R1VX.AR3Y_Inpat_Inpatient AS Inpat
    ON SPat.PatientSID = Inpat.PatientSID
	AND Inpat.Sta3n = '612'
  LEFT JOIN LSV.Dim.WardLocation AS DischargeFrom
    ON Inpat.DischargeWardLocationSID = DischargeFrom.WardLocationSID
	AND DischargeFrom.Sta3n = '612'
WHERE
  HFT.Sta3n = '612'
  AND (
    HFT.HealthFactorType LIKE '%LOC%'
    OR HFT.HealthFactorType LIKE '%TYPE%'
	OR HFT.HealthFactorType LIKE '%NEW%'
	OR HFT.HealthFactorType LIKE '%STATUS%'
  )
  AND HFT.HealthFactorCategory LIKE 'CENTRAL%'
  AND HF.HealthFactorDateTime >= DATEADD(DAY, -90, GETDATE())
)
  
SELECT DISTINCT
  Patient.PatientSSN
  ,Patient.PatientName
  ,Patient.HealthFactorDateTime
  ,Patient.HealthFactorType
  ,Patient.HealthFactorCategory
  --,Visit.VisitDateTime
  ,Visit.LocationName AS VisitLocationName
  ,AdmitTo.InpatientSID
  ,AdmitTo.AdmitDateTime
  ,AdmitTo.AdmitToWardLocation
  ,AdmitTo.AdmitToDivisionName
  ,DischargeFrom.DischargeDateTime
  ,DischargeFrom.DischargeToWardLocation
  ,DischargeFrom.DischargeToDivisionName
FROM
  Patient
  LEFT JOIN Visit
    ON Patient.PatientSID = Visit.PatientSID
  LEFT JOIN AdmitTo
    ON Visit.PatientSID = AdmitTo.PatientSID
  LEFT JOIN DischargeFrom
    ON AdmitTo.InpatientSID = DischargeFrom.InPatientSID
WHERE
  (
    --AdmitTo.AdmitDateTime >= DATEADD(DAY, -90, GETDATE())
	--OR 
	Visit.VisitDateTime >= DATEADD(DAY, -90, GETDATE())
  )
  AND (
    Patient.healthfactorDateTime BETWEEN AdmitTo.AdmitDateTime AND DischargeFrom.DischargeDateTime
	OR CAST(Patient.HealthFactorDateTime AS DATE) = CAST(Visit.VisitDateTime AS DATE)
  )
ORDER BY
  Patient.PatientSSN
  ,AdmitTo.InpatientSID
  ,AdmitTo.AdmitDateTime
  ,Patient.HealthFactorDateTime
  ,Visit.LocationName