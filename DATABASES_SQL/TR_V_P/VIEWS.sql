--CREATI O VEDERE CARE SA CONTINA NUMARUL TOTAL DE PRODUSE VANDUTE IN FIECARE LUNA A ANULUI CURENT
IF OBJECT_ID('View_Nr_Produse_pe_Luna', 'V') IS NOT NULL
	DROP VIEW View_Nr_Produse_pe_Luna
GO
	CREATE VIEW View_Nr_Produse_pe_Luna
	AS
	SELECT  MONTH(C.DataPlasare) AS LUNA, SUM(F.Cantitate) AS NR_PRODUSE
	FROM Comenzi AS C
	INNER JOIN Facturi AS F
	ON F.IdComanda = C.IdComanda
	WHERE YEAR(C.DataPlasare) = YEAR(GETDATE())
	GROUP BY MONTH(C.DataPlasare) 
	
	SELECT*FROM View_Nr_Produse_pe_Luna


--CREATI O VEDERE CARE SA AFISEZE TOTI CLIENTII CARE AU CUMPARAT PRODUSE DE LA BRANDUL VERSACE
IF OBJECT_ID('View_Clienti_Versace', 'V') IS NOT NULL
	DROP VIEW View_Clienti_Versace
GO
CREATE VIEW View_Clienti_Versace AS
	SELECT C.NumeClient, C.PrenumeClient, c.Adresa, P.Id_Produs, P.DenumireProdus, B.NumeBrand
	FROM Clienti AS C INNER JOIN Comenzi AS O
	ON O.IdClient = C.IdClient
	INNER JOIN Facturi AS F
	ON F.IdComanda = O.IdComanda
	INNER JOIN Produse AS P
	ON P.Id_Produs = F.IdProdus
	INNER JOIN Branduri AS B
	ON B.IdBrand = P.IdBrand
	WHERE B.NumeBrand LIKE 'Versace'
	SELECT*FROM View_Clienti_Versace 


--CREATI O VEDERE CARE SA AFISEZE TOATE COMENZILE DIN REGIUNEA DE SUD-EST A TARII
IF OBJECT_ID('View_Comenzi_SudEst', 'V') IS NOT NULL
	DROP VIEW View_Comenzi_SudEst
GO
CREATE VIEW  View_Comenzi_SudEst AS
	SELECT DISTINCT C.IdComanda, c.IdClient, c.IdAngajatPrelucrare, c.IdCod, c.AdresaLivrare,c.DataPlasare,c.DataLimita
	FROM Comenzi AS C
	INNER JOIN JudeteRegiuni AS JR
	ON C.IdJudetLivrare = JR.IdRegiune
	INNER JOIN Regiuni AS R
	ON R.IdRegiune = JR.IdRegiune
	WHERE R.NumeRegiune LIKE 'Sud-Est'
	SELECT*FROM View_Comenzi_SudEst


	--CREATI O VEDERE IN CARE SA AVEM FIECARE ANGAJAT CU NUMARUL DE COMENZI PRELUCRATE
IF OBJECT_ID('View_Angajati_Nr_Comenzi', 'V') IS NOT NULL
	DROP VIEW View_Angajati_Nr_Comenzi
GO
CREATE VIEW View_Angajati_Nr_Comenzi AS
	SELECT A.NumeAngajat, A.PrenumeAngajat, COUNT(C.IdComanda) AS COMENZI_PRELUCRATE
	FROM Angajati AS A
	INNER JOIN Comenzi AS C
	ON C.IdAngajatPrelucrare = A.Id_Angajat
	GROUP BY A.NumeAngajat, A.PrenumeAngajat
	SELECT*FROM View_Angajati_Nr_Comenzi


	--CREATI UN VIEW IN CARE SA AVEM FIECARE ANGAJAT CU SALARIUL SAU NET
IF OBJECT_ID('View_Angajati_Salariu_NET', 'V') IS NOT NULL
	DROP VIEW View_Angajati_Salariu_NET
GO
CREATE VIEW View_Angajati_Salariu_NET AS
	WITH M AS
	(SELECT A.Id_Angajat, A.NumeAngajat, A.PrenumeAngajat, SUM(A.SalariuBrut * IMP.ProcentImpozit/100) AS LA_STAT, A.SalariuBrut
	FROM Angajati AS A INNER JOIN ImpoziteAngajati AS I
	ON A.Id_Angajat = I.IdAngajat
	INNER JOIN Impozite AS IMP
	ON IMP.IdImpozit = I.IdImpozit
	GROUP BY A.Id_Angajat, A.NumeAngajat, A.PrenumeAngajat, A.SalariuBrut)
	SELECT M.Id_Angajat, M.NumeAngajat, M.PrenumeAngajat, M.SalariuBrut-M.LA_STAT AS SALARIU_NET
	FROM M
	WHERE M.SalariuBrut - M.LA_STAT >0
	SELECT*FROM View_Angajati_Salariu_NET


--CREATI UN VIEW CARE SA AFISEZE SUMA PE CARE O DEPUNE LUNAR LA SANATATE FIECARE ANGAJAT
IF OBJECT_ID('View_Angajati_CASS', 'V') IS NOT NULL
	DROP VIEW View_Angajati_CASS
GO
CREATE VIEW View_Angajati_CASS 
AS
	SELECT A.NumeAngajat, A.PrenumeAngajat, A.SalariuBrut * I.ProcentImpozit/100 AS TO_CASS
	FROM Angajati AS A INNER JOIN ImpoziteAngajati AS IA
	ON A.Id_Angajat = IA.IdAngajat
	INNER JOIN Impozite AS I
	ON IA.IdImpozit = I.IdImpozit
	WHERE I.NumeImpozit LIKE 'CASS'
	SELECT*FROM View_Angajati_CASS


--CREATI O VEDERE CARE SA AFISEZE PENTRU Fiecare COMANDA, NUMELE SI PRENUMELE ANGAJATULUI CARE A PRELUCRAT-O, NUMELE, PRENUMELE SI FIRMA DE CURIERAT PENTRU CURIER SI
--NUMELE SI PRENUMELE CLIENTULUI

IF OBJECT_ID('View_Comanda_Indivizi', 'V') IS NOT NULL
	DROP VIEW View_Comanda_Indivizi
GO
CREATE VIEW View_Comanda_Indivizi AS
	SELECT A.Id_Angajat, A.NumeAngajat, A.PrenumeAngajat,
			R.NumeCurier, R.PrenumeCurier, F.NumeFirma,
			CL.NumeClient, CL.PrenumeClient
	FROM Comenzi AS C
	INNER JOIN Angajati AS A
	ON C.IdAngajatPrelucrare = A.Id_Angajat
	INNER JOIN Clienti AS CL
	ON CL.IdClient = C.IdClient
	INNER JOIN Curieri AS R
	ON R.IdCurier = C.IdCurier
	INNER JOIN FirmeCurierat AS F
	ON F.IdFirmaCurierat = R.IdFirmaCurierat
	SELECT*FROM View_Comanda_Indivizi


--CREATI O VEDERE CARE SA INDICE PROFITUL OBTINUT DE FIECARE INFLUENCER
IF OBJECT_ID('View_Influenceri_Profit', 'V') IS NOT NULL
	DROP VIEW View_Influenceri_Profit
GO
CREATE VIEW View_Influenceri_Profit AS 
	SELECT I.NumeInfluencer, I.PrenumeInfluencer, SUM(F.Cantitate*F.PretUnitar*COD.ProcentReducere/100) AS ProfitInfluencer
	FROM CoduriReducere AS COD
	INNER JOIN Comenzi AS C
	ON C.IdCod = COD.IdCod
	INNER JOIN Influenceri AS I
	ON I.IdInfluencer = COD.IdInfluencer
	INNER JOIN Facturi AS F
	ON F.IdComanda = C.IdComanda
	GROUP BY I.NumeInfluencer, I.PrenumeInfluencer

	SELECT*FROM View_Influenceri_Profit


--CREATI UN VIEW CARE SA INDICE, PENTRU FIECARE REGIUNE A TARII, CARE ESTE FIRMA DE CURIERAT CEA MAI POPULARA
IF OBJECT_ID('View_Regiuni_FirmeCurieri', 'V') IS NOT NULL
	DROP VIEW View_Regiuni_FirmeCurieri
GO
CREATE VIEW View_Regiuni_FirmeCurieri AS
	WITH FIRM AS 
		(SELECT R.NumeRegiune, F.NumeFirma, COUNT(C.IdComanda) AS NR_COM_FIRMA
		FROM Regiuni AS R INNER JOIN JudeteRegiuni as jr
		ON R.IdRegiune = JR.IdRegiune
		INNER JOIN Comenzi AS C
		ON C.IdJudetLivrare = JR.IdJudet
		INNER JOIN Curieri AS M
		ON  M.IdCurier= C.IdCurier
		INNER JOIN FirmeCurierat AS F
		ON F.IdFirmaCurierat = M.IdFirmaCurierat
		GROUP BY R.NumeRegiune, F.NumeFirma),
	ALMOST AS
		(SELECT FIRM.NumeFirma, FIRM.NumeRegiune, MAX(FIRM.NR_COM_FIRMA) AS LIVR_MAX
		FROM FIRM
		GROUP BY FIRM.NumeFirma, FIRM.NumeRegiune)
	SELECT NumeRegiune, NumeFirma
	FROM ALMOST
	WHERE LIVR_MAX = (SELECT MAX(LIVR_MAX) FROM ALMOST AS Q WHERE Q.NumeRegiune = ALMOST.NumeRegiune)
	----!!!!!!!!!!!!!!!!!!!!!!!!!!!YEYEYEYEYEYEY
	SELECT*FROM View_Regiuni_FirmeCurieri


	--CREATI O VEDERE CARE SA AFISEZE CE ZODIE ESTE FIECARE CLIENT
IF OBJECT_ID('View_Zodii_Clienti', 'V') IS NOT NULL
	DROP VIEW View_Zodii_Clienti
GO
CREATE VIEW View_Zodii_Clienti AS
	SELECT C.IdClient, C.NumeClient, C.PrenumeClient, CASE
		WHEN (MONTH(C.DataNastere) = 1 AND DAY(C.DataNastere) < 22) OR (MONTH(C.DataNastere) = 12 AND DAY(C.DataNastere) > 21) THEN 'CAPRICORN'
		WHEN (MONTH(C.DataNastere) = 2 AND DAY(C.DataNastere) < 22) OR (MONTH(C.DataNastere) = 1 AND DAY(C.DataNastere) > 21) THEN 'VARSATOR'
		WHEN (MONTH(C.DataNastere) = 3 AND DAY(C.DataNastere) < 22) OR (MONTH(C.DataNastere) = 2 AND DAY(C.DataNastere) > 21) THEN 'PESTI'
		WHEN (MONTH(C.DataNastere) = 4 AND DAY(C.DataNastere) < 22) OR (MONTH(C.DataNastere) = 3 AND DAY(C.DataNastere) > 21) THEN 'BERBEC'
		WHEN (MONTH(C.DataNastere) = 5 AND DAY(C.DataNastere) < 22) OR (MONTH(C.DataNastere) = 4 AND DAY(C.DataNastere) > 21) THEN 'TAUR'
		WHEN (MONTH(C.DataNastere) = 6 AND DAY(C.DataNastere) < 22) OR (MONTH(C.DataNastere) = 5 AND DAY(C.DataNastere) > 21) THEN 'GEMENI'
		WHEN (MONTH(C.DataNastere) = 7 AND DAY(C.DataNastere) < 22) OR (MONTH(C.DataNastere) = 6 AND DAY(C.DataNastere) > 21) THEN 'RAC'
		WHEN (MONTH(C.DataNastere) = 8 AND DAY(C.DataNastere) < 22) OR (MONTH(C.DataNastere) = 7 AND DAY(C.DataNastere) > 21) THEN 'LEU'
		WHEN (MONTH(C.DataNastere) = 9 AND DAY(C.DataNastere) < 22) OR (MONTH(C.DataNastere) = 8 AND DAY(C.DataNastere) > 21) THEN 'FECIOARA'
		WHEN (MONTH(C.DataNastere) = 10 AND DAY(C.DataNastere) < 22) OR (MONTH(C.DataNastere) = 9 AND DAY(C.DataNastere) > 21) THEN 'BALANTA'
		WHEN (MONTH(C.DataNastere) = 11 AND DAY(C.DataNastere) < 22) OR (MONTH(C.DataNastere) = 10 AND DAY(C.DataNastere) > 21) THEN 'SCORPION'
		WHEN (MONTH(C.DataNastere) = 12 AND DAY(C.DataNastere) < 22) OR (MONTH(C.DataNastere) = 11 AND DAY(C.DataNastere) > 21) THEN 'SAGETATOR'
	END AS ZodieClient
	FROM Clienti AS C
	SELECT*FROM View_Zodii_Clienti
	
