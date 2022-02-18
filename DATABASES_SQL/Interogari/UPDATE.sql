--SA SE ADAUGE UN DISCOUNT DE 12% TUTROR CLIENTILOR DIN ZONA DE Nord-Est a tarii

BEGIN TRAN
	UPDATE CoduriReducere
	SET ProcentReducere +=12
	FROM Clienti AS C INNER JOIN COMENZI AS CO
	ON CO.IdClient = C.IdClient
	INNER JOIN CoduriReducere AS F
	ON F.IdCod = CO.IdCod
	INNER JOIN JudeteRegiuni AS JR
	ON JR.IdJudet = C.IdJudet
	INNER JOIN Regiuni AS R
	ON R.IdRegiune = JR.IdRegiune
	WHERE R.NumeRegiune = 'Nord-Est'

	SELECT F.ProcentReducere
	FROM Clienti AS C INNER JOIN COMENZI AS CO
	ON CO.IdClient = C.IdClient
	INNER JOIN CoduriReducere AS F
	ON F.IdCod = CO.IdCod
	INNER JOIN JudeteRegiuni AS JR
	ON JR.IdJudet = C.IdJudet
	INNER JOIN Regiuni AS R
	ON R.IdRegiune = JR.IdRegiune
	WHERE R.NumeRegiune = 'Nord-Est'
ROLLBACK








--SA SE MODIFICE FUNCTIA ANGAJATilor CARE Au PRELUCRAT COMENZI CARE S-AU INDREPTAT SPRE JUDETUL PRAHOVA IN MANAGER

BEGIN TRAN
	UPDATE A
	SET A.Functie = 'Manager'
	FROM Angajati AS A INNER JOIN Comenzi AS C
	ON A.Id_Angajat = C.IdAngajatPrelucrare
	INNER JOIN Judete AS J ON J.IdJudet = C.IdJudetLivrare
	WHERE J.NumeJudet = 'Prahova'
	
	SELECT A.Id_Angajat, A.NumeAngajat, A.PrenumeAngajat, A.Functie
	FROM Angajati AS A INNER JOIN Comenzi AS C
	ON A.Id_Angajat = C.IdAngajatPrelucrare
	INNER JOIN Judete AS J ON J.IdJudet = C.IdJudetLivrare
	WHERE J.NumeJudet = 'Prahova'
ROLLBACK



--BRANDUL REEBOK A FOST CUMPARAT DE BRANDUL ADIDAS. MODIFICATI PEROSANA DE CONTACT A BRANDULUI REEBOK CU CEA A BRANDULUI ADIDAS
BEGIN TRAN
	DECLARE @ADIDASTEL NVARCHAR(30)
	DECLARE @ADIDASPERS NVARCHAR(30)
	SELECT @ADIDASTEL =TelefonContact FROM Branduri WHERE NumeBrand = 'Adidas'
	SELECT @ADIDASPERS =PersoanaContact FROM Branduri WHERE NumeBrand = 'Adidas'
	UPDATE Branduri
	SET PersoanaContact = @ADIDASPERS,
		TelefonContact = @ADIDASTEL
	WHERE NumeBrand LIKE 'Reebok'

	SELECT * FROM Branduri
	WHERE NumeBrand LIKE 'Reebok'

ROLLBACK



--ANGAJATII DIN REGIUNEA BUCURESTI-ILFOV VOR BENEFICIA DE O MAJORARE A SALARIULUI BRUT CU 5%
BEGIN TRAN

	UPDATE A
	SET A.SalariuBrut = A.SalariuBrut *105/100
	FROM Angajati AS A
	INNER JOIN JudeteRegiuni AS JR
	ON JR.IdJudet = A.IdJudet
	INNER JOIN Regiuni AS R
	ON R.IdRegiune = JR.IdRegiune
	WHERE R.NumeRegiune LIKE 'Bucuresti-Ilfov'


	SELECT A.Id_Angajat, A.NumeAngajat, A.PrenumeAngajat, A.SalariuBrut
	FROM Angajati AS A
	INNER JOIN JudeteRegiuni AS JR
	ON JR.IdJudet = A.IdJudet
	INNER JOIN Regiuni AS R
	ON R.IdRegiune = JR.IdRegiune
	WHERE R.NumeRegiune LIKE 'Bucuresti-Ilfov'

ROLLBACK



--INFLUENCERII AL CAROR COD A FOST MAI MARE DE 20% AU DEVENIT MAI CUNOSCUTI PE INSTAGRAM. NUMARUL LOR DE URMARITORI VA CRESTE CU 1000.
BEGIN TRAN

	UPDATE I
	SET I.NumarUrmaritoriInstagram +=1000
	FROM Influenceri AS I
	INNER JOIN CoduriReducere AS C
	ON C.IdInfluencer = I.IdInfluencer
	WHERE C.ProcentReducere > 20

	SELECT I.NumeInfluencer, I.PrenumeInfluencer, I.NumarUrmaritoriInstagram
	FROM Influenceri AS I
	INNER JOIN CoduriReducere AS C
	ON C.IdInfluencer = I.IdInfluencer
	WHERE C.ProcentReducere > 20
ROLLBACK


--SELECT*FROM FirmeCurierat
--CURIERUL NU NUMELE Vasiliu George S-A MUTAT LA FIRMA FAN CURIER 
--
BEGIN TRAN
	
	DECLARE @IDFAN INT
	SELECT @IDFAN = IdFirmaCurierat FROM FirmeCurierat WHERE NumeFirma = 'Fan Curier'
	UPDATE C
	SET C.IdFirmaCurierat = @IDFAN
	FROM Curieri AS C INNER JOIN FirmeCurierat AS F
	ON C.IdFirmaCurierat = F.IdFirmaCurierat
	WHERE C.NumeCurier LIKE 'Vasiliu' AND C.PrenumeCurier LIKE 'George'

	SELECT C.IdCurier, C.NumeCurier, C.PrenumeCurier, F.NumeFirma
	FROM Curieri AS C INNER JOIN FirmeCurierat AS F
	ON C.IdFirmaCurierat = F.IdFirmaCurierat
	AND C.NumeCurier LIKE 'Vasiliu' AND C.PrenumeCurier LIKE 'George'

ROLLBACK


--MODIFICATI PRETUL DE ACHIZITIE (FIRMA IL CUMPARA DE LA FURNIZOR) AL HALATULUI PUFOS LA 4000 DE LEI
BEGIN TRAN
	
	UPDATE Produse
	SET PretUnitar = 4000
	WHERE DenumireProdus LIKE 'Halat%'

	SELECT DenumireProdus, PretUnitar
	FROM Produse
	WHERE DenumireProdus LIKE 'Halat pufos%'

ROLLBACK



--MODIFICATI DOMICILIUL CLIENTEI BUZATOIU ALEXANDRA
BEGIN TRAN
	
	UPDATE Clienti
		SET Adresa = 'Strada Mere Verzi 7', Oras = 'Bucuresti', IdJudet = 42
		WHERE NumeClient = 'Buzatoiu' AND PrenumeClient = 'Alexandra'

ROLLBACK




--MODIFICATI NUMARUL DE TELEFON AL CURIERULUI Apreotesei
BEGIN TRAN
	
	UPDATE Curieri
		SET TelefonCurier = '0765123899'
		WHERE NumeCurier = 'Apreotesei' 

	SELECT*FROM Curieri
	WHERE NumeCurier = 'Apreotesei' 

ROLLBACK



--MODIFICATI DESCRIEREA CATEGORIEI DE PRODUSE Elegant
BEGIN TRAN
	
	UPDATE CategoriiProduse
		SET DescriereCategorie = 'Am modificat descrierea categoriei elegant' 

	SELECT*FROM CategoriiProduse
	WHERE NumeCategorie = 'Elegant' 

ROLLBACK



--SA SE MAJOREZE IMPOZITUL CASS CU 7%
BEGIN TRAN
	
	UPDATE Impozite
		SET ProcentImpozit += 7
		WHERE NumeImpozit = 'CASS' 

	SELECT*FROM Impozite
	WHERE NumeImpozit = 'CASS' 

ROLLBACK


--SA SE MODIFICE VALABILITATEA TERMENelor DE VALABILITATE ALE CODURILOR FOLOSITE DE CLIENTA Buzatoiu Alexandra ASTFEL INCAT ELE SA EXPIRE IN ZIUA CURENTA
BEGIN TRAN
	
	UPDATE CoduriReducere
	SET DataSfarsit = '2021-06-01'
	FROM 
	Clienti AS C INNER JOIN COMENZI AS O
	ON O.IdClient = C.IdClient
	INNER JOIN CoduriReducere AS D
	ON D.IdCod = O.IdCod
	WHERE C.NumeClient = 'Buzatoiu' AND C.PrenumeClient = 'Alexandra'

	SELECT D.IdCod, D.DataSfarsit
	FROM 
	Clienti AS C INNER JOIN COMENZI AS O
	ON O.IdClient = C.IdClient
	INNER JOIN CoduriReducere AS D
	ON D.IdCod = O.IdCod
	WHERE C.NumeClient = 'Buzatoiu' AND C.PrenumeClient = 'Alexandra'

ROLLBACK



--MODIFICATI CANTITATEA DE PRODUSE DE PE FACTURA CU ID-UL 1
SELECT*FROM Facturi
BEGIN TRAN
	
	UPDATE Facturi
		SET Cantitate += 2
		WHERE IdFactura = 1

	SELECT*FROM Facturi
	WHERE IdFactura = 1

ROLLBACK



--MODIFICATI VALOAREA CODULUI DE REDUCERE AL INFLUENCERULUI IOANA GRAMA SA FIE 40%
BEGIN TRAN
	
	UPDATE C
	SET C.ProcentReducere = 40
	FROM CoduriReducere AS C INNER JOIN Influenceri AS I
	ON I.IdInfluencer = C.IdInfluencer
	WHERE I.NumeInfluencer = 'Grama' AND I.PrenumeInfluencer = 'Ioana'


	SELECT C.ProcentReducere
	FROM CoduriReducere AS C INNER JOIN Influenceri AS I
	ON I.IdInfluencer = C.IdInfluencer
	WHERE I.NumeInfluencer = 'Grama' AND I.PrenumeInfluencer = 'Ioana'

ROLLBACK


--OFERITI UN DISCOUNT DE 2% TUTROR CLIENTILOR AL CAROR NUME INCEPE CU LITERA R



BEGIN TRAN

	UPDATE D
	SET ProcentReducere +=2
	FROM Clienti AS C INNER JOIN Comenzi AS O
	ON C.IdClient = O.IdClient
	INNER JOIN CoduriReducere AS D
	ON D.IdCod = O.IdCod
	WHERE C.NumeClient LIKE 'R%'

	SELECT C.NumeClient, C.PrenumeClient, D.ProcentReducere
	FROM Clienti AS C INNER JOIN Comenzi AS O
	ON C.IdClient = O.IdClient
	INNER JOIN CoduriReducere AS D
	ON D.IdCod = O.IdCod
	WHERE C.NumeClient LIKE 'R%'


ROLLBACK



--JUDETUL ILFOV A IESIT DIN ZONA BUCURESTI-ILFOV SI A INTRAT IN ZONA MUNTENIA-SUD
BEGIN TRAN
	DECLARE @JJ INT
	SELECT @JJ = IdRegiune FROM Regiuni WHERE NumeRegiune = 'Sud-Muntenia'
	UPDATE JR
	SET JR.IdRegiune = @JJ
	FROM JudeteRegiuni AS JR
	INNER JOIN Judete AS J
	ON JR.IdJudet = J.IdJudet
	INNER JOIN Regiuni AS R
	ON JR.IdRegiune = R.IdRegiune
	WHERE J.NumeJudet = 'Ilfov' AND R.NumeRegiune = 'Bucuresti-Ilfov'

	SELECT J.NumeJudet, R.NumeRegiune
	FROM JudeteRegiuni AS JR
	INNER JOIN Judete AS J
	ON JR.IdJudet = J.IdJudet
	INNER JOIN Regiuni AS R
	ON JR.IdRegiune = R.IdRegiune
	WHERE J.NumeJudet = 'Ilfov' 


ROLLBACK