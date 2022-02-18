--sa se creeze o procedura stocata care sa returneze suma de bani redusa prin aplicarea codului de reducere unui influencer dat ca parametru

IF OBJECT_ID('PS_PlataInfluenceri', 'P') IS NOT NULL
	DROP PROC PS_PlataInfluenceri
GO
CREATE PROC PS_PlataInfluenceri
@id_influencer AS int,
@remuneratie AS float OUTPUT
AS
BEGIN
	WITH H AS
		(SELECT SUM(F.PretUnitar) AS VALOARE_COMANDA, C.IdComanda, C.IdCod
		FROM Facturi AS F INNER JOIN Comenzi AS C
		ON F.IdComanda = C.IdComanda
		GROUP BY C.IdComanda, C.IdCod),
	V AS
		(SELECT H.IdComanda, H.VALOARE_COMANDA, COD.ProcentReducere, COD.IdInfluencer
		FROM CoduriReducere AS COD INNER JOIN H
		ON COD.IdCod = H.IdCod)
	SELECT SUM(V.VALOARE_COMANDA) * V.ProcentReducere/100 AS REMUNERATIE
	FROM V
	WHERE V.IdInfluencer = @id_influencer
	GROUP BY V.ProcentReducere
	RETURN;
END

DECLARE @rowsreturned AS FLOAT;
EXEC PlataInfluenceri 1,
 @rowsreturned OUTPUT;


--SA SE CREEZE O PROCEDURA STOCATA CARE SA AFISEZE PRODUSELE CARE AU FOST COMANDATE INTR-O ANUMITA LUNA DATA CA PARAMETRU
IF OBJECT_ID('PS_Produse_Luna', 'P') IS NOT NULL
	DROP PROC PS_Produse_Luna
GO
CREATE PROC PS_Produse_Luna
@luna int
as
select *
from Produse as p inner join Facturi as f
on p.Id_Produs = f.IdProdus
inner join Comenzi as c
on c.IdComanda = f.IdComanda
where MONTH(c.DataPlasare) = @luna
exec PS_Produse_Luna 5


--SA SE CREEZE O PROCEDURA STOCATA CARE SA AFISEZE PROFITUL OBTINUT DE FIRMA INTR-O ANUMITA LUNA DATA CA PARAMETRU
IF OBJECT_ID('PS_PROFIT_LUNA', 'P') IS NOT NULL
	DROP PROC PS_PROFIT_LUNA
GO
CREATE PROC PS_PROFIT_LUNA
@luna int
AS
SELECT SUM(F.PretUnitar  - P.PretUnitar - F.PretUnitar *R.ProcentReducere/100) AS PROFIT_PE_LUNA
FROM Facturi AS F INNER JOIN Comenzi AS C
ON F.IdComanda = C.IdComanda
INNER JOIN CoduriReducere AS R
ON R.IdCod = C.IdCod
INNER JOIN Produse AS P
ON P.Id_Produs = F.IdProdus
WHERE MONTH(C.DataPlasare) = @luna

EXEC PS_PROFIT_LUNA 4


--SA SE CREEZE O PROCEDURA CARE AFISEAZA ANGAJATII CARE AU PRELUCRAT COMENZI MAI MARI DE O SUMA DATA CA PARAMETRU
--!!!!!!!!!!!!!!!!!!!!daca nu numesc functiile agregate AS.. NU MERGEEEEEEEE
IF OBJECT_ID('PS_PRELUCRARE_COMENZI_IN_VALOARE_DE', 'P') IS NOT NULL
	DROP PROC PS_PRELUCRARE_COMENZI_IN_VALOARE_DE
GO
CREATE PROC PS_PRELUCRARE_COMENZI_IN_VALOARE_DE
@suma int
AS
WITH M AS
(SELECT C.IdComanda, SUM(F.PretUnitar) AS SUMA, C.IdAngajatPrelucrare
FROM Comenzi AS C INNER JOIN Facturi AS F
ON C.IdComanda = F.IdComanda
GROUP BY C.IdComanda, C.IdAngajatPrelucrare)
SELECT A.NumeAngajat, A.PrenumeAngajat, M.IdAngajatPrelucrare, M.SUMA
FROM Angajati AS A INNER JOIN M
ON A.Id_Angajat = M.IdAngajatPrelucrare
WHERE M.SUMA > @suma

EXEC PS_PRELUCRARE_COMENZI_IN_VALOARE_DE 2000




--CREATI O PROCEDURA STOCATA CARE SA AFISEZE TOTI CURIERII CARE LIVREAZA PE ZONA DE SUD-MUNTENIA
IF OBJECT_ID('PS_CURIERI_SUD_EST', 'P') IS NOT NULL
	DROP PROC PS_CURIERI_SUD_EST
GO
CREATE PROC PS_CURIERI_SUD_EST
AS
BEGIN
with J AS 
(SELECT  j.IdJudet
FROM Judete AS J
INNER JOIN JudeteRegiuni AS JR
ON J.IdJudet = JR.IdJudet
INNER JOIN Regiuni AS R
ON JR.IdRegiune = R.IdRegiune
WHERE R.NumeRegiune = 'Sud-Muntenia' OR  R.NumeRegiune = 'Bucuresti-Ilfov')
SELECT C.NumeCurier, C.PrenumeCurier, C.TelefonCurier, C.OrasLivrare
FROM Curieri AS C
INNER JOIN J
ON C.IdJudetLivrare = J.IdJudet
END

EXEC PS_CURIERI_SUD_EST



--SA SE CREEZE O PROCEDURA STOCATA CARE sa se afiseze intreg lantul de superiori pana la seful suprem plecand de la un anumit angajat(PARAMETRU)
--!!!!!!!!procedura stocata cu id dat ca parametru!!!!!

IF OBJECT_ID('PS_LANT_SUPERIORI', 'P') IS NOT NULL
	DROP PROC PS_LANT_SUPERIORI
GO
CREATE PROC PS_LANT_SUPERIORI
@id int
AS
	BEGIN
		WITH Recursiv AS
		(
		SELECT A.Id_Angajat, A.SefDirect AS ManagerID, A.NumeAngajat, A.PrenumeAngajat, 0 AS Distance
		FROM Angajati AS A
		WHERE A.Id_Angajat = @id
		UNION ALL
		SELECT M.Id_Angajat, M.SefDirect, M.NumeAngajat, M.PrenumeAngajat,
		S.Distance + 1 AS Distance
		FROM Recursiv AS S
		JOIN Angajati AS M
		ON S.ManagerID = M.Id_Angajat
		)
		SELECT Id_Angajat, ManagerID, NumeAngajat,PrenumeAngajat, Distance
		FROM Recursiv;
	END

	EXEC PS_LANT_SUPERIORI 3


--CREATI O PROCEDURA STOCATA CARE SA AFISEZE CAT PLATESTE COMPANIA STATULUI PRIN FIECARE IMPOZIT DAT

IF OBJECT_ID('PS_IMPOZITE', 'P') IS NOT NULL
	DROP PROC PS_IMPOZITE
GO
CREATE PROC PS_IMPOZITE AS
	SELECT I.IdImpozit, I.NumeImpozit, I.ProcentImpozit, SUM(A.SalariuBrut*I.ProcentImpozit/100) AS Valoare_Contributie_Lunara
	FROM Impozite AS I
	INNER JOIN ImpoziteAngajati AS IA
	ON I.IdImpozit = IA.IdImpozit
	INNER JOIN Angajati AS A
	ON A.Id_Angajat = IA.IdAngajat
	GROUP BY I.IdImpozit, I.NumeImpozit, I.ProcentImpozit

	EXEC PS_IMPOZITE



--Creati o procedura stocata care sa afiseze clientii care au cumparat produse de la un anumit brand dat ca parametru SI DATA ACHIZITIEI

IF OBJECT_ID('PS_Brand', 'P') IS NOT NULL
	DROP PROC PS_Brand
GO
CREATE PROC PS_Brand 
@brand nvarchar(30)
AS
SELECT C.NumeClient, C.PrenumeClient, O.DataPlasare
FROM Clienti AS C
INNER JOIN Comenzi AS O
ON C.IdClient = O.IdClient
INNER JOIN Facturi AS F
ON F.IdComanda = O.IdComanda
INNER JOIN Produse AS P
ON P.Id_Produs = F.IdProdus
INNER JOIN Branduri AS B
ON B.IdBrand = P.IdBrand
WHERE B.NumeBrand LIKE @brand

EXEC PS_Brand 'Adidas'


--CREATI O PROCEDURA STOCATA CARE SA RETURNEZE NUMARUL CURIERILOR CARE AU LIVRAT COMENZI UNUI ANUME CLIENT AL CARUI ID E DAT CA PARAMETRU
--NUMELE CURIERILOR TREBUIE SA SE TERMINE IN u SAU a

IF OBJECT_ID('PS_Nr_Curieri', 'P') IS NOT NULL
	DROP PROC PS_Nr_Curieri
GO
CREATE PROC PS_Nr_Curieri 

@client AS int, 
@numar int = 0 OUTPUT
AS
BEGIN
	SELECT COUNT(DISTINCT(O.IdCurier)) AS NUMAR_CURIERI
	FROM Curieri AS C
	INNER JOIN Comenzi AS O
	ON C.IdCurier = O.IdCurier
	INNER JOIN Clienti AS L
	ON L.IdClient = O.IdClient
	WHERE O.IdClient = @client

	RETURN
END

DECLARE @REZ AS INT = 0
EXEC PS_Nr_Curieri 2, @REZ OUTPUT


--SA SE REALIZEZE O PROCEDURA STOCATA CARE SA AFISEZE TOTI CLIENTII MINORI
IF OBJECT_ID('PS_CLIENTI_MINORI', 'P') IS NOT NULL
	DROP PROC PS_CLIENTI_MINORI
GO
CREATE PROC PS_CLIENTI_MINORI
AS
	SELECT*
	FROM Clienti AS C
	WHERE  DATEDIFF(YEAR, C.DataNastere,GETDATE()) < 18

EXEC PS_CLIENTI_MINORI



--SA SE CREEZE O PROCEDURA STOCATA CARE SA UPDATEZE STOCURILE DINTR-UN PRODUS ATUNCI CAND ACESTA ESTE FACTURAT
IF OBJECT_ID('PS_STOCKS', 'P') IS NOT NULL
	DROP PROC PS_STOCKS
GO
CREATE PROC PS_STOCKS
	@IdProdus int,
	@Quantity int
AS
	BEGIN
		UPDATE Produse
		SET
		BucatiStock -= @Quantity
		WHERE Id_Produs = @IdProdus
		UPDATE Produse
		SET
		BucatiComanda += @Quantity
		WHERE Id_Produs = @IdProdus
	END



EXEC PS_STOCKS 1,3

--INSERT INTO Facturi(IdComanda, IdProdus, Cantitate, PretUnitar)
--VALUES