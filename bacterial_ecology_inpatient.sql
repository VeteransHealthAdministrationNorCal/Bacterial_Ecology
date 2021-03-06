DECLARE @Sta3n smallint = 612

-- Drugs ~1,000 lines

SELECT DISTINCT *
INTO #Temp_BEI_1
FROM (
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
	,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Aminoglycosides' AS SubCategory
	,'AMIKACIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%AMIKACIN%' 
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Penicillins' AS Subcategory
	,'AMOXICILLIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem 
	WHERE PharmacyOrderableItem LIKE '%AMOXICILLIN%' AND NOT(PharmacyOrderableItem LIKE '%CLAVULAN%') 
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Penicillins' AS Subcategory
	,'AMOXICILLIN/CLAVULANATE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%AMOXICILLIN%CLAVU%' 
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Penicillins' AS Subcategory
	,'AMPICILLIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%AMPICILLIN%' AND NOT(PharmacyOrderableItem LIKE '%SULB%')
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Penicillins' AS Subcategory
	,'AMPICILLIN/SULBACTAM' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%AMPICILLIN/SULB%' 
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Macrolides' AS Subcategory
	,'AZITHROMYCIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%AZITHROMYCIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Monobactams' AS Subcategory
	,'AZTREONAM' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%AZTREONAM%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporins' AS Subcategory
	,'CEFACLOR' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEFACLOR%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporins' AS Subcategory
	,'CEFADROXIL' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEFADROXIL%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporins' AS Subcategory
	,'CEFAZOLIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEFAZOLIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporins' AS Subcategory
	,'CEFDINIR' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEFDINIR%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporins' AS Subcategory
	,'CEFEPIME' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEFEPIME%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporins' AS Subcategory
	,'CEFIXIME' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEFIXIME%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporin' AS Subcategory
	,'CEFOTAXIME' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEFOTAXIME%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporins' AS Subcategory
	,'CEFOTETAN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEFOTETAN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporins' AS Subcategory
	,'CEFOXITIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEFOXITIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporins' AS Subcategory
	,'CEFPODOXIME' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEFPODOXIME%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporins' AS Subcategory
	,'CEFTAROLINE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEFTAROLINE%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporins' AS Subcategory
	,'CEFTAZIDIME' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEFTAZIDIME%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporins' AS Subcategory
	,'CEFTIBUTEN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEFTIBUTEN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporins' AS Subcategory
	,'CEFTRIAXONE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEFTRIAXONE%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporins' AS Subcategory
	,'CEFUROXIME' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEFUROXIME%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Cephalosporins' AS Subcategory
	,'CEPHALEXIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CEPHALEXIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Phenicols' AS Subcategory
	,'CHLORAMPHENICOL' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CHLORAMPHENICOL%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Carbapenems' AS Subcategory
	,'IMIPENEM/CILASTATIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CILASTATIN/IMIPENEM%' 
		OR (PharmacyOrderableItem LIKE '%imipenem/cilastin%') 
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Fluoroquinolones' AS Subcategory
	,'CIPROFLOXACIN'  AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CIPROFLOXACIN%' 
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Macrolides' AS Subcategory
	,'CLARITHROMYCIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CLARITHROMYCIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Lincosamides' AS Subcategory
	,'CLINDAMYCIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CLINDAMYCIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Polymyxins' AS Subcategory
	,'COLISTIMETHATE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%COLISTIMETHATE%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Glycopeptides' AS Subcategory
	,'DALBAVANCIN'AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%DALBAVANCIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Streptogramins' AS Subcategory
	,'QUINUPRISTIN/DALFOPRISTIN'AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%DALFOPRISTIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Folate pathway inhibitors' AS Subcategory
	,'DAPSONE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%DAPSONE%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Lipopeptides' AS Subcategory
	,'DAPTOMYCIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%DAPTOMYCIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Tetracyclines' AS Subcategory
	,'DEMECLOCYCLINE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%DEMECLOCYCLINE%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Penicillins' AS Subcategory
	,'DICLOXACILLIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%DICLOXACILLIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Carbapenems' AS Subcategory
	,'DORIPENEM' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%DORIPENEM%' 
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Tetracyclines' AS Subcategory
	,'DOXYCYCLINE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%DOXYCYCLINE%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Carbapenems' AS Subcategory
	,'ERTAPENEM' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%ERTAPENEM%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Macrolides' AS Subcategory
	,'ERYTHROMYCIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%ERYTHROMYCIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Macrocyclic' AS Subcategory
	,'FIDAXOMICIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%FIDAXOMICIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Fosfomycins' AS Subcategory
	,'FOSFOMYCIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%FOSFOMYCIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Aminoglycosides' AS Subcategory
	,'GENTAMICIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%GENTAMICIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Aminoglycosides' AS Subcategory
	,'KANAMYCIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%KANAMYCIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Fluoroquinolones' AS Subcategory
	,'LEVOFLOXACIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%LEVOFLOXACIN%' 
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Oxazolidinones' AS Subcategory
	,'LINEZOLID' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%LINEZOLID%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Carbapenems' AS Subcategory
	,'MEROPENEM' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%MEROPENEM%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Other' AS Subcategory
	,'METHENAMINE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%METHENAMINE%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Nitroimidazoles' AS Subcategory
	,'METRONIDAZOLE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%METRONIDAZOLE%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Tetracyclines' AS Subcategory
	,'MINOCYCLINE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%MINOCYCLINE%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Fluoroquinolones' AS Subcategory
	,'MOXIFLOXACIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%MOXIFLOXACIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Penicillins' AS Subcategory
	,'NAFCILLIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%NAFCILLIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Aminoglycosides' AS Subcategory
	,'NEOMYCIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%NEOMYCIN%' AND NOT(PharmacyOrderableItem LIKE '%POLY%'
		OR PharmacyOrderableItem LIKE '%BACITRACIN%' OR PharmacyOrderableItem LIKE '%DEXAMETHASONE%'
		OR PharmacyOrderableItem LIKE'%GRAMICIDIN%' OR PharmacyOrderableItem LIKE'%HYDROCORTISONE%'
		OR PharmacyOrderableItem LIKE'%FLU%' OR PharmacyOrderableItem LIKE'%COLISTIN%' )
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Nitrofurans' AS Subcategory
	,'NITROFURANTOIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%NITROFURANTOIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Penicillins' AS Subcategory
	,'OXACILLIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE 'OXACILLIN%' AND NOT(PharmacyOrderableItem LIKE 'Cloxacillin%')
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Penicillins' AS Subcategory
	,'PENICILLIN V' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE 'PENICILLIN V%' OR (pharmacyorderableitem LIKE 'PENICILLIN') 
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Penicillins' AS Subcategory
	,'PENICILLIN G' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%PENICILLIN%' AND NOT(PharmacyOrderableItem LIKE 'Penicillin v%'
		OR PharmacyOrderableItem LIKE 'Penicillin') 
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Penicillins' AS Subcategory
	,'PIPERACILLIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%PIPERACILLIN%' AND NOT(PharmacyOrderableItem LIKE '%TAZO%')
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Penicillins' AS Subcategory
	,'PIPERACILLIN/TAZOBACTAM' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%PIPERA%TAZO%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Polymyxins' AS Subcategory
	,'POLYMYXIN dimIVAdditiveIngredient' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%POLYMIXIN%' AND NOT(PharmacyOrderableItem LIKE '%BACITRACIN%'
		OR PharmacyOrderableItem LIKE '%NEOMYCIN%')   
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Rifamycins' AS Subcategory
	,'RIFABUTIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%RIFABUTIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Rifamycins' AS Subcategory
	,'RIFAXIMIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%RIFAXIMIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Aminoglycosides' AS Subcategory
	,'STREPTOMYCIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%STREPTOMYCIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Folate pathway inhibitors' AS Subcategory
	,'SULFADIAZINE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%SULFADIAZINE%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Folate pathway inhibitors' AS Subcategory
	,'SULFAMETHOXAZOLE/TRIMETHOPRIM' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%SULFAMETHOX%' OR (PharmacyOrderableItem LIKE '%TRIMOXAZOLE%')
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Oxazolidinone' AS Subcategory
	,'TEDIZOLID' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%TEDIZOLID%'											
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Tetracyclines' AS Subcategory
	,'TETRACYCLINE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%TETRACYCLINE%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Penicillins' AS Subcategory
	,'TICARCILLIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%TICARCILLIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Glycylcyclines' AS Subcategory
	,'TIGECYCLINE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%TIGECYCLINE%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Aminoglycosides' AS Subcategory
	,'TOBRAMYCIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%TOBRAMYCIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Folate pathway inhibitors' AS Subcategory
	,'TRIMETHOPRIM' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE 'TRIMETHOPRIM'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antibacterial' AS Category
	,'Glycopeptides' AS Subcategory
	,'VANCOMYCIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%VANCOMYCIN%'
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antifungal' AS Category
	,'Polyenes' AS Subcategory
	,'AMPHOTERICIN dimIVAdditiveIngredient' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%AMPHOTERICIN%' AND NOT(PharmacyOrderableItem LIKE '%LIP%'
		OR PharmacyOrderableItem LIKE '%mouth%' OR PharmacyOrderableItem LIKE '%Choles%') 
UNION
	SELECT
	Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antifungal' AS Category
	,'Polyenes' AS Subcategory
	,'AMPHOTERICIN dimIVAdditiveIngredient LIPOSOMAL' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%AMPHOTERICIN%' AND (PharmacyOrderableItem LIKE '%LIP%') 
		AND NOT (PharmacyOrderableItem LIKE '%choles%') 
UNION
	SELECT
	 Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antifungal' AS Category
	,'Polyenes' AS Subcategory
	,'AMPHOTERICIN dimIVAdditiveIngredient LIPID COMPLEX' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%AMPHOTERICIN%' AND (PharmacyOrderableItem LIKE '%CHOL%') 
		AND NOT (PharmacyOrderableItem LIKE '%LIP%')
UNION
	SELECT
	 Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antifungal' AS Category
	,'Echinocandins' AS Subcategory
	,'ANIDULAFUNGIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%ANIDULAFUNGIN%'  
UNION
	SELECT
	 Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antifungal' AS Category
	,'Echinocandins' AS Subcategory
	,'CASPOFUNGIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%CASPOFUNGIN%' 
UNION
	SELECT
	 Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antifungal' AS Category
	,'Echinocandins' AS Subcategory
	,'MICAFUNGIN' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%MICAFUNGIN%' 
UNION
	SELECT
	 Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antifungal' AS Category
	,'Azoles' AS Subcategory
	,'FLUCONAZOLE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%FLUCONAZOLE%' 
UNION
	SELECT
	 Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antifungal' AS Category
	,'Azoles' AS Subcategory
	,'ITRACONAZOLE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%ITRACONAZOLE%'
UNION
	SELECT
	 Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antifungal' AS Category
	,'Azoles' AS Subcategory
	,'POSACONAZOLE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%POSACONAZOLE%'
UNION
	SELECT
	 Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antifungal' AS Category
	,'Azoles' AS Subcategory
	,'VORICONAZOLE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%VORICONAZOLE%' 
UNION
	SELECT
	 Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antifungal' AS Category
	,'Azoles' AS Subcategory
	,'ISAVUCONAZONIUM' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%ISAVUCONAZONIUM%'
UNION
	SELECT
	 Sta3n
	,PharmacyOrderableItemSID
	,PharmacyOrderableItem
	,DosageForm
    ,'Antimicrobial' AS MajorCategory
	,'Antifungal' AS Category
	,'Nucleoside Analog' AS Subcategory
	,'FLUCYTOSINE' AS Drug
	FROM LSV.dim.PharmacyOrderableItem
	WHERE PharmacyOrderableItem LIKE '%FLUCYTOSINE%'
) AS x
WHERE x.Sta3n = @Sta3n

-- Inpatient
SELECT *
INTO #Temp_BEI_2
FROM (
SELECT
	Spatient.PatientName
	,Spatient.PatientSID
	,Spatient.PatientSSN
	,Inpatient.AdmitDateTime
	,CAST(Inpatient.DischargeDateTime AS DATE) AS DischargeDate
	,BCMAMedicationLog.PatientLocation                        
	,convert(date, BCMAMedicationLog.ActionDateTime) AS AntibioticDate
	,datename(month, BCMAMedicationLog.ActionDateTime) + DATENAME(year, BCMAMedicationLog.ActionDateTime) AS AbxMonth
	,datepart(month, BCMAMedicationLog.ActionDateTime) AS MonthNumber
	,Datepart(year, BCMAMedicationLog.ActionDateTime) AS YearNumber
	,dimIVAdditiveIngredient.IVAdditiveIngredientPrintName
	,dimPharmacyOrderableItem.PharmacyOrderableItemSID
	,dimPharmacyOrderableItem.PharmacyOrderableItem
	,DosageForm
	,MedicationRoute
	,BCMAAdditive.DoseGiven                                   
	,BCMAMedicationLog.OrderDosage
	,BCMAMedicationLog.ActionStatus AS Action
FROM
	LSV.BISL_R1VX.AR3Y_SPatient_SPatient AS SPatient
	INNER JOIN LSV.BISL_R1VX.AR3Y_Inpat_Inpatient AS Inpatient
		ON SPatient.PatientSID = Inpatient.PatientSID
	LEFT JOIN LSV.BCMA.BCMAMedicationLog AS BCMAMedicationLog
		ON Spatient.PatientSID = BCMAMedicationLog.PatientSID
	LEFT JOIN LSV.BCMA.BCMAAdditive AS BCMAAdditive 
		ON BCMAMedicationLog.BCMAMedicationLogSID = BCMAAdditive.BCMAMedicationLogSID
	INNER JOIN LSV.dim.PharmacyOrderableItem AS dimPharmacyOrderableItem
		ON BCMAMedicationLog.PharmacyOrderableItemSID = dimPharmacyOrderableItem.PharmacyOrderableItemSID
	LEFT JOIN LSV.dim.IVAdditiveIngredient AS dimIVAdditiveIngredient 
		ON BCMAAdditive.IVAdditiveIngredientSID = dimIVAdditiveIngredient.IVAdditiveIngredientSID
WHERE
	Spatient.Sta3n = @Sta3n
	AND Inpatient.Sta3n = @Sta3n
	AND BCMAMedicationLog.Sta3n = @Sta3n 
	AND BCMAAdditive.Sta3n = @Sta3n 
	AND dimIVAdditiveIngredient.Sta3n = @Sta3n 
	AND Inpatient.AdmitDateTime >= CAST(DATEADD(month, -6, GETDATE()) AS DATE)
	AND BCMAMedicationLog.ActionDateTime >= CAST(DATEADD(month, -6, GETDATE()) AS DATE)
	AND Spatient.TestPatientFlag IS NULL
) AS y

-- Microbiology
SELECT *
INTO #Temp_BEI_3
FROM (
SELECT
	Microbiology.PatientSID
	,Microbiology.MicrobiologySID
	,CAST(Microbiology.SpecimenTakenDateTime AS DATE) AS SpecimenTakenDate
	,Microbiology.SpecimenComment
	,DimCollectionSample.CollectionSample
	,AntibioticSensitivity.OrganismQuantity
	,AntibioticSensitivity.AntibioticSensitivityValue
	,DimAntibiotic.Antibiotic
	,DimAntibiotic.AntibioticDisplayComment
	,DimOrganism.Organism
FROM
	LSV.Micro.Microbiology AS Microbiology
	LEFT JOIN LSV.Dim.CollectionSample AS DimCollectionSample
		ON Microbiology.CollectionSampleSID = DimCollectionSample.CollectionSampleSID 
	LEFT JOIN LSV.Micro.AntibioticSensitivity AS AntibioticSensitivity
		ON Microbiology.MicrobiologySID = AntibioticSensitivity.MicrobiologySID 
	LEFT JOIN LSV.Dim.Antibiotic AS DimAntibiotic
		ON AntibioticSensitivity.AntibioticSID = DimAntibiotic.AntibioticSID
	LEFT JOIN LSV.Dim.Organism AS DimOrganism
		ON AntibioticSensitivity.OrganismSID = DimOrganism.OrganismSID
WHERE
	Microbiology.Sta3n = @Sta3n
	AND Microbiology.SpecimenTakenDateTime >= CAST(DATEADD(month, -6, GETDATE()) AS DATE)	
) AS z

-- Clean slate
TRUNCATE TABLE
	MAC.Bacterial_Ecology_Inpatient

-- Final table
INSERT INTO
	MAC.Bacterial_Ecology_Inpatient
SELECT DISTINCT 
	tbl2.PatientSSN
	--tbl2.PatientSID
	,tbl2.PatientName
	,tbl2.AdmitDateTime
	,tbl2.PatientLocation
	,tbl3.SpecimenTakenDate
	,tbl3.CollectionSample
	,tbl3.Organism
	,tbl3.OrganismQuantity
	,tbl3.Antibiotic
	,tbl3.AntibioticSensitivityValue
	,tbl2.AntibioticDate
	,tbl1.Drug
	,tbl2.DoseGiven
	,tbl2.DischargeDate  
--	,tbl2.AbxMonth
--	,tbl2.MonthNumber
--	,tbl2.YearNumber
--	,tbl2.IVAdditiveIngredientPrintName
--	,tbl2.PharmacyOrderableItem
--	,tbl1.MajorCategory
--	,tbl1.Category
--	,tbl1.SubCategory
--	,tbl2.DosageForm
--	,tbl2.MedicationRoute                          
--	,tbl2.OrderDosage
--	,tbl2.Action
--	,tbl3.MicrobiologySID
--	,tbl3.SpecimenComment
--	,tbl3.AntibioticDisplayComment
FROM
	#Temp_BEI_1 AS tbl1
	LEFT JOIN #Temp_BEI_2 AS tbl2
		ON tbl1.pharmacyorderableitemSID = tbl2.pharmacyorderableitemsid
	LEFT JOIN #Temp_BEI_3 AS tbl3
		ON tbl2.PatientSID = tbl3.PatientSID
WHERE
	tbl1.Majorcategory = 'Antimicrobial'
	AND tbl2.Action = 'G'
	AND tbl3.SpecimenTakenDate BETWEEN CAST(DATEADD(hour, +72, tbl2.AdmitDateTime) AS DATETIME2) AND tbl2.DischargeDate
ORDER BY
	PatientName, AdmitDateTime, SpecimenTakenDate, AntibioticDate, DischargeDate
