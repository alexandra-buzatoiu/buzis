--DIN NEFERICIRE, ANGAJATA Popa Alina a suferit un accident. Se incadreaza, de acum, la categoria persoane cu dizabilitati
--ea va fi scutita de impozitul pe venit

BEGIN TRAN
	DELETE IA
	FROM Angajati AS A INNER JOIN ImpoziteAngajati AS IA
	ON A.Id_Angajat = IA.IdAngajat
	INNER JOIN Impozite AS I 
	ON IA.IdImpozit=I.IdImpozit
	WHERE I.NumeImpozit LIKE 'Impozit%' AND A.NumeAngajat LIKE 'Popa' AND A.PrenumeAngajat LIKE 'Alina'
	
	SELECT IA.IdAngajat, IA.IdImpozit
	FROM Angajati AS A INNER JOIN ImpoziteAngajati AS IA
	ON A.Id_Angajat = IA.IdAngajat
	INNER JOIN Impozite AS I 
	ON IA.IdImpozit=I.IdImpozit
	WHERE I.NumeImpozit LIKE 'Impozit%' AND A.NumeAngajat LIKE 'Popa' AND A.PrenumeAngajat LIKE 'Alina'
ROLLBACK


--STERGETI CONTINUTUL COMENZILOR PLASATE DE CLIENTII DIN REGIUNEA CENTRU
BEGIN TRAN
DELETE F
FROM Facturi AS F
INNER JOIN Comenzi AS C
ON C.IdComanda = F.IdComanda
INNER JOIN Clienti AS CL
ON CL.IdClient=C.IdClient
INNER JOIN JudeteRegiuni AS JR ON
CL.IdJudet = JR.IdJudet
INNER JOIN Regiuni AS R
ON R.IdRegiune = JR.IdRegiune
WHERE R.NumeRegiune = 'Centru'

SELECT F.IdFactura, F.IdComanda, F.IdProdus, F.Cantitate,F.PretUnitar
FROM Facturi AS F
INNER JOIN Comenzi AS C
ON C.IdComanda = F.IdComanda
INNER JOIN Clienti AS CL
ON CL.IdClient=C.IdClient
INNER JOIN JudeteRegiuni AS JR ON
CL.IdJudet = JR.IdJudet
INNER JOIN Regiuni AS R
ON R.IdRegiune = JR.IdRegiune
WHERE R.NumeRegiune = 'Centru'
ROLLBACK


--STERGETI ANGAJATII FIRMEI DE CURIERAT CU FAN CURIER

BEGIN TRAN
	ALTER TABLE Comenzi
	DROP CONSTRAINT FK_Comenzi_Curieri
	DELETE C
	FROM Curieri AS C INNER JOIN FirmeCurierat AS F
	ON C.IdFirmaCurierat = F.IdFirmaCurierat
	WHERE F.NumeFirma LIKE 'Fan Curier'

	SELECT *
	FROM Curieri AS C INNER JOIN FirmeCurierat AS F
	ON C.IdFirmaCurierat = F.IdFirmaCurierat
	WHERE F.NumeFirma LIKE 'Fan Curier'

	--ALTER TABLE Comenzi
	--ADD CONSTRAINT FK_Comenzi_Curieri
	--FOREIGN KEY (IdCurier)
	--REFERENCES Curieri(IdCurier)
ROLLBACK


--STERGETI CONTINUTUL COMENZII CU ID UL 4
BEGIN TRAN
	DELETE FROM Facturi
	WHERE IdComanda = 4

	SELECT* FROM Facturi
ROLLBACK


--STERGETI CODUL DE REDUCERE CORESPUNZATOR influencerului Laura Giurcanu
BEGIN TRAN
	ALTER TABLE Comenzi
	DROP CONSTRAINT FK_Comenzi_CoduriReducere
	DELETE C
	FROM CoduriReducere AS C INNER JOIN Influenceri AS I
	ON C.IdInfluencer=I.IdInfluencer
	WHERE I.NumeInfluencer = 'Giurcanu' AND I.PrenumeInfluencer = 'Laura'

	SELECT *
	FROM CoduriReducere AS C INNER JOIN Influenceri AS I
	ON C.IdInfluencer=I.IdInfluencer
	WHERE I.NumeInfluencer = 'Giurcanu' AND I.PrenumeInfluencer = 'Laura'
ROLLBACK





--STERGETI CONTINUTUL COMENZILOR PLASATE DE CLIENTII DIN Judetul Alba
BEGIN TRAN
DELETE F
FROM Facturi AS F
INNER JOIN Comenzi AS C
ON C.IdComanda = F.IdComanda
INNER JOIN Clienti AS CL
ON CL.IdClient=C.IdClient
INNER JOIN Judete AS J
ON J.IdJudet = CL.IdJudet
WHERE J.NumeJudet = 'Alba'

SELECT F.IdFactura, F.IdComanda, F.IdProdus, F.Cantitate,F.PretUnitar
FROM Facturi AS F
INNER JOIN Comenzi AS C
ON C.IdComanda = F.IdComanda
INNER JOIN Clienti AS CL
ON CL.IdClient=C.IdClient
INNER JOIN Judete AS J
ON J.IdJudet = CL.IdJudet
WHERE J.NumeJudet = 'Alba'
ROLLBACK



--STERGETI CONTINUTUL COMENZILOR PLASATE DE CLIENTII DIN Judetul Buzau
BEGIN TRAN
DELETE F
FROM Facturi AS F
INNER JOIN Comenzi AS C
ON C.IdComanda = F.IdComanda
INNER JOIN Clienti AS CL
ON CL.IdClient=C.IdClient
INNER JOIN Judete AS J
ON J.IdJudet = CL.IdJudet
WHERE J.NumeJudet = 'Buzau'

SELECT F.IdFactura, F.IdComanda, F.IdProdus, F.Cantitate,F.PretUnitar
FROM Facturi AS F
INNER JOIN Comenzi AS C
ON C.IdComanda = F.IdComanda
INNER JOIN Clienti AS CL
ON CL.IdClient=C.IdClient
INNER JOIN Judete AS J
ON J.IdJudet = CL.IdJudet
WHERE J.NumeJudet = 'Buzau'
ROLLBACK


--STERGETI JUDETUL ILFOV DIN ZONA BUCURESTI ILFOV
BEGIN TRAN
	
	DELETE FROM JR
	FROM JudeteRegiuni AS JR
	INNER JOIN Judete AS J
	ON JR.IdJudet = J.IdJudet
	INNER JOIN Regiuni AS R
	ON JR.IdRegiune = R.IdRegiune
	WHERE J.NumeJudet = 'Ilfov' 


	SELECT J.NumeJudet, R.NumeRegiune
	FROM JudeteRegiuni AS JR
	INNER JOIN Judete AS J
	ON JR.IdJudet = J.IdJudet
	INNER JOIN Regiuni AS R
	ON JR.IdRegiune = R.IdRegiune
	WHERE J.NumeJudet = 'Ilfov' 


ROLLBACK



--STERGETI CLIENTUL CU ID 1
BEGIN TRAN
	ALTER TABLE Comenzi
	DROP CONSTRAINT FK_Comenzi_Clienti
	DELETE FROM Clienti
	WHERE IdClient = 1

	SELECT*FROM Clienti
ROLLBACK


--STERGETI CLIENTII CU NUMELE PREOTEASA
BEGIN TRAN
	ALTER TABLE Comenzi
	DROP CONSTRAINT FK_Comenzi_Clienti
	DELETE FROM Clienti
	WHERE NumeClient LIKE 'Preoteasa'

	SELECT*FROM Clienti
ROLLBACK


--STERGETI CLIENTII CAMPINENI
BEGIN TRAN
	ALTER TABLE Comenzi
	DROP CONSTRAINT FK_Comenzi_Clienti
	DELETE FROM Clienti
	WHERE Oras LIKE 'Campina'

	SELECT*FROM Clienti
ROLLBACK


--STERGETI ANGAJATII BUCURESTENI
BEGIN TRAN
	ALTER TABLE Comenzi
	DROP CONSTRAINT FK_Comenzi_Angajati
	ALTER TABLE ImpoziteAngajati
	DROP CONSTRAINT FK_ImpoziteAngajati_Angajati
		ALTER TABLE Angajati
	DROP CONSTRAINT FK_Angajati_Angajati
	DELETE FROM Angajati
	WHERE Oras LIKE 'Bucuresti'

	SELECT*FROM Angajati
ROLLBACK


--STERGETI ANGAJATII CU ID 27,28,29
BEGIN TRAN
	DELETE FROM Angajati
	WHERE Id_Angajat = 27 OR  Id_Angajat = 28  OR  Id_Angajat = 29
ROLLBACK


SELECT*FROM CategoriiProduse
--STERGETI CATEGORIILE DENIM SI KIDS
BEGIN TRAN
	ALTER TABLE Produse
	DROP CONSTRAINT FK_Produse_CategoriiProduse
	DELETE FROM CategoriiProduse
	WHERE NumeCategorie = 'DENIM' OR NumeCategorie = 'Kids'

	SELECT*FROM CategoriiProduse
ROLLBACK


--STERGETI CATEGORIILE DE PRODUSE CARE FOLOSESC IN DESCRIERE CUVANTUL FASHION
BEGIN TRAN
	ALTER TABLE Produse
	DROP CONSTRAINT FK_Produse_CategoriiProduse
	DELETE FROM CategoriiProduse
	WHERE DescriereCategorie LIKE 'Fashion' OR DescriereCategorie LIKE '%fashion%' OR DescriereCategorie LIKE '%fashion'

	SELECT*FROM CategoriiProduse
ROLLBACK