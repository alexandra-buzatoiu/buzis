--Afisati toti angajatii cu functia de sales representative angajati dupa anul 2001
SELECT A.Id_Angajat, A.NumeAngajat, A.PrenumeAngajat, A.DataNastere, A.DataAngajare
FROM Angajati AS A
WHERE (YEAR(A.DataAngajare) > 2001) AND (A.Functie = 'Sales Representative')



--Afisati cui se subordoneaza direct fiecare angajat
SELECT A.NumeAngajat AS 'SUBORDONAT',  B.NumeAngajat AS 'SEF DIRECT'
FROM Angajati AS A INNER JOIN Angajati AS B
ON A.SefDirect = B.Id_Angajat



--AFISATI cate comenzi au fost plasate utilizand codul de reducere al Ioanei Grama
--SE POATE FARA CTE CU SUBINTEROGARE SELECT IN SELECT
WITH H AS
(SELECT CR.IdCod
FROM CoduriReducere AS CR INNER JOIN Influenceri AS I
ON CR.IdInfluencer=I.IdInfluencer
WHERE I.NumeInfluencer='Grama' AND PrenumeInfluencer = 'Ioana')
SELECT COUNT(*) AS 'Numar comenzi plasate'
FROM Comenzi AS C INNER JOIN H
ON H.IdCod=C.IdCod

--Afisati intr-un tabel numele fiecarui curier, numele regiunii geografice in care activeaza si firma pentru care lucreaza

WITH
X AS
(SELECT C.NumeCurier, C.PrenumeCurier, JR.IdRegiune, C.IdFirmaCurierat
FROM Curieri AS C INNER JOIN JudeteRegiuni AS JR
ON C.IdJudetLivrare = JR.IdJudet),
Y AS
(SELECT X.NumeCurier, X.PrenumeCurier, R.NumeRegiune, X.IdFirmaCurierat
FROM Regiuni AS R INNER JOIN X
ON R.IdRegiune = X.IdRegiune)
SELECT Y.NumeCurier, Y.PrenumeCurier, Y.NumeRegiune, F.NumeFirma
FROM Y INNER JOIN FirmeCurierat AS F
ON Y.IdFirmaCurierat=F.IdFirmaCurierat

SELECT * FROM Curieri

--Afisati salariul net al angajatului cu id 1 
WITH 
S AS
(SELECT A.SalariuBrut AS 'Salariu brut', A.Id_Angajat
FROM Angajati AS A
WHERE A.Id_Angajat=1),
Z AS
(SELECT S.Id_Angajat, S.[Salariu brut], IA.IdImpozit
FROM S INNER JOIN ImpoziteAngajati AS IA
ON S.Id_Angajat=IA.IdAngajat
WHERE S.Id_Angajat=IA.IdAngajat),
Q AS
(SELECT Z.Id_Angajat, SUM(Z.[Salariu brut]*I.ProcentImpozit/100) AS STATULUI, Z.[Salariu brut]
FROM Z INNER JOIN Impozite AS I
ON Z.IdImpozit=I.IdImpozit
GROUP BY Z.Id_Angajat, Z.[Salariu brut])
SELECT Q.[Salariu brut]-Q.STATULUI AS 'Salariu NET' , Q.Id_Angajat
FROM Q
GROUP BY Q.Id_Angajat, Q.[Salariu brut], Q.STATULUI


--Afisati ce curier a livrat comanda clientului Buzatoiu Alexandra
WITH Z AS
(SELECT C.IdClient, M.IdCurier, C.NumeClient, C.PrenumeClient
FROM Clienti AS C INNER JOIN Comenzi AS M
ON C.IdClient=M.IdClient)
SELECT C.NumeCurier, C.PrenumeCurier
FROM Z INNER JOIN Curieri AS C
ON Z.IdCurier = C.IdCurier
WHERE Z.NumeClient = 'Buzatoiu' AND Z.PrenumeClient = 'Alexandra'

--Afisati brandurile care incep cu litera P si au fost COMANDATE in luna aprilie a anului 2021

WITH
H AS
(SELECT C.DataPlasare, F.IdProdus
FROM Comenzi AS C INNER JOIN Facturi AS F
ON C.IdComanda=F.IdComanda
WHERE YEAR(C.DataPlasare) = 2021 AND MONTH(C.DataPlasare) = 4),
Q AS
(SELECT P.Id_Produs, P.IdBrand
FROM Produse AS P INNER JOIN H
ON P.Id_Produs=H.IdProdus)
SELECT DISTINCT B.NumeBrand
FROM Q INNER JOIN Branduri AS B
ON Q.IdBrand=B.IdBrand
WHERE B.NumeBrand LIKE 'P%'


--Sa se afiseze intreg lantul de superiori pana la seful suprem plecand de la un anumit angajat(hardcodat)
WITH Recursiv AS
(
SELECT A.Id_Angajat, A.SefDirect AS ManagerID, A.NumeAngajat, A.PrenumeAngajat, 0 AS Distance
FROM Angajati AS A
WHERE A.Id_Angajat = 3
UNION ALL
SELECT M.Id_Angajat, M.SefDirect, M.NumeAngajat, M.PrenumeAngajat,
S.Distance + 1 AS Distance
FROM Recursiv AS S
JOIN Angajati AS M
ON S.ManagerID = M.Id_Angajat
)
SELECT Id_Angajat, ManagerID, NumeAngajat,PrenumeAngajat, Distance
FROM Recursiv;




--CAT PLATESTE FIRMA LA SANATATE??
SELECT SUM (A.SalariuBrut * IMP.ProcentImpozit /100) AS LaCAS
FROM Angajati AS A INNER JOIN ImpoziteAngajati AS I
ON A.Id_Angajat = I.IdAngajat
INNER JOIN Impozite AS IMP
ON I.IdImpozit = IMP.IdImpozit
WHERE IMP.NumeImpozit LIKE 'CAS'


--SA SE AFISEZE PENTRU FIECARE ANGAJAT IN PARTE SALARIUL NET

WITH M AS
(SELECT A.NumeAngajat, A.PrenumeAngajat, SUM(A.SalariuBrut * IMP.ProcentImpozit/100) AS LA_STAT, A.SalariuBrut
FROM Angajati AS A INNER JOIN ImpoziteAngajati AS I
ON A.Id_Angajat = I.IdAngajat
INNER JOIN Impozite AS IMP
ON IMP.IdImpozit = I.IdImpozit
GROUP BY A.NumeAngajat, A.PrenumeAngajat, A.SalariuBrut)
SELECT M.NumeAngajat, M.PrenumeAngajat, M.SalariuBrut-M.LA_STAT AS SALARIU_NET
FROM M
WHERE M.SalariuBrut - M.LA_STAT >0



--SA SE AFISEZE CATI DINTRE CLIENTI AU DORIT SA LE FIE LIVRATA COMANDA LA DOMICILIUL LOR 
SELECT COUNT(*)
FROM CLIENTI AS CL INNER JOIN Comenzi AS CO
ON CL.IdClient = CO.IdClient
WHERE CL.Adresa = CO.AdresaLivrare

--AFISATI TOTI ANGAJATII CARE AU SALARIUL BRUT MAI MARE DE 6000 DE LEI SI AL CARUI NUME DE FAMILIE SE TERMINA IN LITERA "u"
SELECT*
FROM Angajati AS A
WHERE A.NumeAngajat LIKE '%u' AND A.SalariuBrut>6000


--SA SE AFISEZE CEA MAI BINE PLATITA FUNCTIE DIN COMPANIE 
SELECT A.Functie
FROM Angajati AS A
WHERE A.SalariuBrut = (SELECT MAX(SalariuBrut) AS MAXIM FROM Angajati)


SELECT*FROM Angajati
select*from Produse
select*from CategoriiProduse



--Afisati toti clientii care au achizitionat o rochie eleganta sau casual, brandul rochiei si pretul de pe factura
SELECT P.DenumireProdus, C.IdCategorie, b.IdBrand, CL.NumeClient, CL.PrenumeClient, F.PretUnitar
FROM Produse AS P INNER JOIN CategoriiProduse AS C
ON P.IdCategorie = C.IdCategorie
INNER JOIN Branduri AS B
ON B.IdBrand = P.IdBrand
INNER JOIN Facturi AS F
ON P.Id_Produs = F.IdProdus
INNER JOIN Comenzi AS K
ON K.IdComanda = F.IdComanda
INNER JOIN CLIENTI AS CL
ON CL.IdClient = K.IdClient
WHERE (P.DenumireProdus LIKE 'Rochie%' OR  P.DenumireProdus LIKE '%rochie%') AND (C.NumeCategorie LIKE 'Elegant' OR C.NumeCategorie LIKE 'Casual')


--Sa se afiseze cel mai cautat brand in zona de Vest a tarii
SELECT TOP 1 count(*) AS NUMAR_PRODUSE,B.NumeBrand
FROM Comenzi AS C INNER JOIN Facturi AS F
ON C.IdComanda = F.IdComanda
INNER JOIN Produse AS P
ON P.Id_Produs = F.IdProdus
INNER JOIN Branduri AS B 
ON B.IdBrand = P.IdBrand
INNER JOIN JudeteRegiuni AS JR
ON JR.IdJudet = C.IdJudetLivrare
INNER JOIN Regiuni AS R
ON JR.IdRegiune = R.IdRegiune
WHERE R.NumeRegiune LIKE 'Vest'
GROUP BY B.NumeBrand
ORDER BY NUMAR_PRODUSE DESC



--SA SE AFISEZE IN CE JUDETE FACE LIVRARI FIRMA Nemo Express
SELECT J.NumeJudet
FROM FirmeCurierat AS F INNER JOIN Curieri AS C
ON F.IdFirmaCurierat = C.IdFirmaCurierat
INNER JOIN Judete AS J
ON J.IdJudet = C.IdJudetLivrare
WHERE F.NumeFirma LIKE 'Nemo Express'



--SA SE AFISEZE CE CURIERI A LIVRAT COMENZILE PRELUCRATE IN LUNA MAI DE ANGAJATUL CU ID - UL 2
SELECT CU.NumeCurier, CU.PrenumeCurier, CU.TelefonCurier
FROM Curieri AS CU
INNER JOIN Comenzi AS C
ON C.IdCurier = CU.IdCurier
WHERE C.IdAngajatPrelucrare = 2 AND MONTH(C.DataPlasare) = 5



--Sa se afiseze judetul si numarul comenzilor care se livreaza intr-un oras care se termina cu litera ‘e’ si contin mai mult de 3 produseSELECT COUNT(*) AS NR_Produse, C.OrasLivrareFROM Comenzi AS CINNER JOIN Facturi AS FON F.IdComanda = C.IdComandaWHERE C.OrasLivrare LIKE '%e'GROUP BY C.OrasLivrareHAVING SUM(F.Cantitate) > 3

--SA SE AFISEZE PENTRU FIECARE INFLUENCER CE SUMA A STRANS PRIN CODUL SAU DE REDUCERE
SELECT SUM(F.PretUnitar * C.ProcentReducere/100) AS SUMA, I.NumeInfluencer, I.PrenumeInfluencer
FROM Influenceri AS I
INNER JOIN CoduriReducere AS C
ON I.IdInfluencer = C.IdInfluencer
INNER JOIN Comenzi AS CMD
ON CMD.IdCod = C.IdCod
INNER JOIN Facturi AS F
ON F.IdComanda = CMD.IdComanda
GROUP BY I.NumeInfluencer, I.PrenumeInfluencer


--SA SE AFISEZE TOATE INCASARILE DIN TRIMESTRUL 2 AL ANULUI CURENT 
SELECT SUM(F.PretUnitar - (F.PretUnitar * CD.ProcentReducere/100)) AS INCASARI
FROM Comenzi AS C INNER JOIN Facturi AS F
ON C.IdComanda = F.IdComanda
INNER JOIN CoduriReducere AS CD
ON CD.IdCod = C.IdCod
WHERE DATEPART(QUARTER,GETDATE()) =2


--SA SE AFISEZE ANGAJATII CARE AU SALARIUL BRUT MAI MARE DE 6000 , DAR MAI MIC DE 12000 DE LEI
SELECT*
FROM ANGAJATI AS A
WHERE A.SalariuBrut > 6000 AND A.SalariuBrut < 12000


--SA SE AFISEZE CAT PLATESTE, IN MEDIE, UN CLIENT PE COMANDA
SELECT AVG(F.Cantitate * F.PretUnitar )
FROM Facturi AS F


--AFISATI FACTURA CORESPONDENTA COMENZII DE VALOARE MAXIMA
SELECT *
FROM FACTURI AS F
WHERE (F.PretUnitar * F.Cantitate = (SELECT(MAX(PretUnitar * Cantitate)) FROM Facturi))


--AFISATI VALOAREA FIECAREI FACTURI INAINTE DE APLICAREA CODULUI DE REDUCERE
SELECT SUM(F.Cantitate*F.PretUnitar) AS Valoare_Comanda, C.IdComanda
FROM Comenzi AS C
INNER JOIN Facturi AS F
ON C.IdComanda = F.IdComanda
GROUP BY C.IdComanda


--AFISATI CLIENTUL CARE A FACUT CEA MAI VALOROASA COMANDA
WITH CO AS
	(SELECT SUM(F.Cantitate*F.PretUnitar) AS Valoare_Comanda, C.IdComanda, C.IdClient
	FROM Comenzi AS C
	INNER JOIN Facturi AS F
	ON C.IdComanda = F.IdComanda
	GROUP BY C.IdComanda, C.IdClient)
SELECT TOP 1 CO.Valoare_Comanda, C.NumeClient, C.PrenumeClient
FROM Clienti AS C INNER JOIN CO
ON C.IdClient = CO.IdClient
ORDER BY CO.Valoare_Comanda DESC


--AFISATI DIN CE ORASE SI JUDETE PROVIN CLIENTII SI ANGAJATII
SELECT A.Oras, J.NumeJudet
FROM Angajati AS A INNER JOIN Judete AS J
ON A.IdJudet = J.IdJudet
UNION
SELECT C.Oras, J.NumeJudet
FROM Clienti AS C INNER JOIN Judete AS J
ON C.IdJudet = J.IdJudet


--AFISATI JUDETELE DIN CARE AVEM CLIENTI, DAR NU AVEM CURIERI SPECIALIZATI
SELECT J.NumeJudet
FROM CLIENTI AS C INNER JOIN Judete AS J
ON C.IdJudet = J.IdJudet
EXCEPT
SELECT J.NumeJudet
FROM Curieri AS C INNER JOIN Judete AS J
ON C.IdJudetLivrare = J.IdJudet


--AFISATI JUDETELE UNDE AVEM ATAT ANGAJATI CAT SI CLIENTI
SELECT A.Oras, J.NumeJudet
FROM Angajati AS A INNER JOIN Judete AS J
ON A.IdJudet = J.IdJudet
INTERSECT
SELECT C.Oras, J.NumeJudet
FROM Clienti AS C INNER JOIN Judete AS J
ON C.IdJudet = J.IdJudet


--AFISATI CATE COMENZI A LIVRAT FIECARE CURIER
SELECT COUNT(*) AS NUMAR_COMENZI, R.NumeCurier, R.PrenumeCurier
FROM Comenzi AS C
INNER JOIN Curieri AS R
ON C.IdCurier = R.IdCurier
GROUP BY R.NumeCurier, R.PrenumeCurier


-- Ne interesează pentru fiecare curier, numărul de comenzi tratate, în câte zile a tratat cel puțin o comandă, prima și ultima zi în care a 
--tratat măcar o comandă, precum și numarul total de produse transportate.SELECT 	C.IdCurier,	C.NumeCurier,	C.PrenumeCurier,	COUNT(*) AS NUMAR_COMENZI,	COUNT(O.DataLimita) ZILE_PRODUCTIVE,	MIN(O.DataLimita) AS PRIMA_ZI,	MAX(O.DataLimita) AS LAST_DAY,	SUM(F.Cantitate) AS NUMAR_PRODUSE_LIVRATEFROM CURIERI AS C INNER JOIN Comenzi AS OON C.IdCurier = O.IdCurierINNER JOIN Facturi AS FON O.IdComanda = F.IdComandaGROUP BY C.IdCurier, C.NumeCurier, C.PrenumeCurier

--AFISATI IN CATE ZILE S-AU FACUT LIVRARI PE FIECARE CURIER IN PARTE
SELECT C.NumeCurier, C.PrenumeCurier, COUNT(DISTINCT(O.DataLimita)) AS NUMAR_ZILE_PE_CURIER
FROM Comenzi AS O INNER JOIN Curieri AS C
ON O.IdCurier = C.IdCurier
GROUP BY C.NumeCurier, C.PrenumeCurier


--AFISATI CATE COMENZI AU FOST LIVRATE DE FIECARE CURIER SI NUMELE COMPANIEI DE CURIERAT LA CARE LUCREAZA ACESTA
SELECT C.NumeCurier, c.PrenumeCurier, COUNT(*) AS Nr_Comenzi, F.NumeFirma
FROM Comenzi AS O INNER JOIN Curieri AS C
ON C.IdCurier = O.IdCurier
INNER JOIN FirmeCurierat AS F
ON F.IdFirmaCurierat = C.IdFirmaCurierat
group by
F.NumeFirma, C.NumeCurier, c.PrenumeCurier


--SA SE AFISEZE NUMARUL DE PRODUSE COMANDATE DE FIECARE CLIENT DIN ZONA DE VEST A TARII
SELECT C.NumeClient, C.PrenumeClient, SUM(F.Cantitate) AS Nr_Produse
FROM CLIENTI AS C INNER JOIN Judete AS J
ON C.IdJudet = J.IdJudet
INNER JOIN JudeteRegiuni AS JR
ON JR.IdJudet = J.IdJudet
INNER JOIN Regiuni AS R
ON R.IdRegiune = JR.IdRegiune
INNER JOIN Comenzi AS O
ON O.IdClient = C.IdClient
INNER JOIN FACTURI AS F
ON F.IdComanda = O.IdComanda
WHERE R.NumeRegiune LIKE 'Vest'
GROUP BY C.NumeClient, C.PrenumeClient


--SA SE AFISEZE PRETUL CEL MAI SCUMP AL UNUI PRODUS DIN FIECARE CATEGORIE
SELECT MAX(F.PretUnitar) AS Pret_Maxim, CAT.NumeCategorie, P.DenumireProdus
FROM CategoriiProduse AS CAT
INNER JOIN Produse AS P
ON P.IdCategorie = CAT.IdCategorie
INNER JOIN Facturi AS F
ON F.IdProdus = P.Id_Produs
GROUP BY CAT.NumeCategorie, P.DenumireProdus




--AVAND IN VEDERE CA PRETURILE POT VARIA DE LA O ZI LA ALTA, IMPLICIT DE LA O COMANDA LA ALTA
--SA SE AFISEZE, PENTRU FIECARE PRODUS, PRETUL MAXIM LA CARE A FOST VANDUT
SELECT P.Id_Produs, P.DenumireProdus,MAX(F.PretUnitar) AS Pret_Maxim_Facturare
FROM Produse AS P
INNER JOIN Facturi AS F
ON P.Id_Produs = F.IdProdus
GROUP BY P.Id_Produs, P.DenumireProdus

