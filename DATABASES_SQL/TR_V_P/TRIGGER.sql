--CREATI UN TRIGGER CARE SA NU VA PERMITA SA INSERATI ACEEASI CATEGORIE DE PRODUSE DE 2 ORI
IF OBJECT_ID('tr_Categorii', 'TR') IS NOT NULL
	DROP TRIGGER tr_Categorii
GO
CREATE TRIGGER tr_Categorii
ON CategoriiProduse
AFTER INSERT, UPDATE
AS
	BEGIN
	IF @@ROWCOUNT = 0 RETURN;
	SET NOCOUNT ON;
	IF EXISTS (SELECT COUNT(*)
		FROM Inserted AS I
		JOIN CategoriiProduse AS C
		ON I.NumeCategorie = C.NumeCategorie
		GROUP BY I.NumeCategorie
		HAVING COUNT(*) > 1 )
			BEGIN
				THROW 50000, 'CATEGORIA EXISTA DEJA! NU SE MAI POATE INSERA', 0;
			END
	END

INSERT INTO CategoriiProduse
VALUES ('Sport', 'Fii cool cand transpiri')
select*from CategoriiProduse



--CREATI UN TRIGGER AFTER UN UPDATE IN TABELA CLIENTI CARE SA NE SPUNA CA MODIFICARILE AU FOST EFECTUATE CU SUCCES
IF OBJECT_ID('UpdateClienti', 'TR') IS NOT NULL
	DROP TRIGGER UpdateClienti
GO
create trigger UpdateClienti
on Clienti
after update
as
print 'Modificarile pe tabela Clienti au fost efectuate cu succes!'
select*from Clienti

UPDATE Clienti
SET PrenumeClient = 'Viviana' where NumeClient = 'Nanu'


--CREATI UN TRIGGER CARE SA RETURNEZE NUMARUL DE RANDURI DIN TABELELE TEMPORARE INSERTED SI DELETED CARE SE CREEAZA CAND OPERAM ASTEFL DE 
--INSTRUCTIUNI PE TABELA CategoriiProduse
IF OBJECT_ID('tr_CategP', 'TR') IS NOT NULL
DROP TRIGGER tr_CategP;
GO
CREATE TRIGGER tr_CategP
ON CategoriiProduse
AFTER DELETE, INSERT, UPDATE
AS
BEGIN
IF @@ROWCOUNT = 0 RETURN; -- Trebuie să fie prima instrucțiune
SET NOCOUNT ON; -- server-ul nu mai afiseaza numarul de randuri afectate
SELECT COUNT(*) AS InsertedCount FROM Inserted;
SELECT COUNT(*) AS DeletedCount FROM Deleted
END

SELECT*FROM CategoriiProduse
INSERT INTO CategoriiProduse
VALUES('Incaltaminteee' , 'Lipa lipa talpa mica')


--CREATI UN TRIGGER PE TABELA BARNDURI CARE SA NU PERMITA EXISTENTA A 2 BRANDURI CU ACELASI NUME

IF OBJECT_ID('tr_BRAND_UNIQ', 'TR') IS NOT NULL
DROP TRIGGER tr_BRAND_UNIQ;
GO
CREATE TRIGGER tr_BRAND_UNIQ
ON Branduri
AFTER INSERT
AS
	BEGIN
		IF @@ROWCOUNT = 0 RETURN;
			SET NOCOUNT ON;
		IF EXISTS (SELECT COUNT(*)
					FROM Inserted AS I
					JOIN Branduri AS C
					ON I.NumeBrand = C.NumeBrand
					GROUP BY I.NumeBrand
					HAVING COUNT(*) >= 1 )
		BEGIN
			THROW 50000, 'Brandul cu acest nume deja exista nu primim fake-uri!!', 0;
		END
		--ELSE
		--	BEGIN
		--		INSERT Branduri (NumeBrand, Oras, Tara, PersoanaContact, TelefonContact)
		--		SELECT NumeBrand, Oras, Tara, PersoanaContact, TelefonContact FROM Inserted;
		--	END
		END;


INSERT INTO Branduri
VALUES ('Bottega Veneta', 'Milano', 'Italia', 'Donatella Versace', 0788832434)
select*from Branduri

UPDATE Branduri 
SET PersoanaContact = 'GEANINA Botteank'  --
WHERE NumeBrand = 'Bottega Veneta'



--CREATI UN TRIGGER PE TABELA BARNDURI CARE SA NU PERMITA EXISTENTA A 2 FIRME DE CURIERAT CU ACELASI NUME

IF OBJECT_ID('tr_FIRMA_CURIERAT_UNIQ', 'TR') IS NOT NULL
DROP TRIGGER tr_FIRMA_CURIERAT_UNIQ;
GO
CREATE TRIGGER tr_FIRMA_CURIERAT_UNIQ
ON FirmeCurierat
INSTEAD OF INSERT, UPDATE
AS
	BEGIN
		IF @@ROWCOUNT = 0 RETURN;
			SET NOCOUNT ON;
		IF EXISTS (SELECT COUNT(*)
					FROM Inserted AS I
					JOIN FirmeCurierat AS C
					ON I.NumeFirma = C.NumeFirma
					GROUP BY I.NumeFirma
					HAVING COUNT(*) >= 1 )
		BEGIN
			THROW 50000, 'Firma de curierat cu acest nume deja exista nu se poate reinsera!!', 0;
		END
		ELSE
			BEGIN
				INSERT FirmeCurierat(NumeFirma, OrasSediu, AdresaSediu, IdJudetSediu, TelefonSediu )
				SELECT NumeFirma, OrasSediu, AdresaSediu, IdJudetSediu, TelefonSediu FROM Inserted;
			END
		END;

INSERT INTO FirmeCurierat
VALUES ('Nemo Express', 'O adresa la misto', 'Sovata', 30, '0789654311')

DELETE FROM FirmeCurierat
WHERE AdresaSediu LIKE '% misto'

SELECT*FROM FirmeCurierat



--CREATI UN TRIGGER CARE SA NU PERMITA INSERAREA UNUI ANGAJAT MINOR
IF OBJECT_ID('tr_ANGAJATI_MAJORI', 'TR') IS NOT NULL
DROP TRIGGER tr_ANGAJATI_MAJORI;
GO
CREATE TRIGGER tr_ANGAJATI_MAJORI
ON Angajati
AFTER INSERT
AS
	BEGIN
		IF @@ROWCOUNT = 0 RETURN;
			SET NOCOUNT ON;
		IF EXISTS (SELECT COUNT(*)
					FROM Inserted AS I
					WHERE DATEDIFF(YEAR, I.DataNastere, GETDATE()) < 18 
					GROUP BY I.Id_Angajat
					HAVING COUNT(*) >=1)
		BEGIN
			THROW 50000, 'NU SE POATE ANGAJA UN MINOR!!', 0;
		END
		--ELSE
		--	BEGIN
		--		INSERT  Angajati(NumeAngajat, PrenumeAngajat, Functie, DataNastere, DataAngajare, AdresaDomiciliu, Oras, IdJudet, CodPostal, SefDirect, Telefon, SalariuBrut)
		--		SELECT NumeAngajat, PrenumeAngajat, Functie, DataNastere, DataAngajare, AdresaDomiciliu, Oras, IdJudet, CodPostal, SefDirect, Telefon, SalariuBrut FROM Inserted;
		--	END

	END

	INSERT INTO Angajati(NumeAngajat, PrenumeAngajat, Functie, DataNastere, DataAngajare, AdresaDomiciliu, Oras, IdJudet, CodPostal, SefDirect, Telefon, SalariuBrut)
VALUES ('Georgecu' , 'Zenada' , 'Sales Representative' ,'2004-03-07', '2021-01-01', 'Strada Sportului 8', 'Bucuresti', 42, 100004, 3, '0789543788', 5600)




select*from Angajati

--CREATI UN TRIGGER CARE SA SETEZE ORASUL UNUI ANGAJAT NOU PE BUCURESTI INDIFERENT DE CE SE INTRODUCE

IF OBJECT_ID('tr_ANGAJATI__SETATJ', 'TR') IS NOT NULL
DROP TRIGGER tr_ANGAJATI__SETATJ;
GO
CREATE TRIGGER tr_ANGAJATI__SETATJ
ON Angajati
AFTER INSERT
AS
	BEGIN
		IF @@ROWCOUNT = 0 RETURN;
			SET NOCOUNT ON;
			DECLARE @ID_INSERTED INT;
			 SELECT @ID_INSERTED = Id_Angajat FROM inserted 
			UPDATE Angajati 
			SET Oras = 'Bucuresti' WHERE Id_Angajat = @ID_INSERTED
			UPDATE Angajati 
			SET IdJudet = 42 WHERE Id_Angajat = @ID_INSERTED

	END

	INSERT INTO Angajati(NumeAngajat, PrenumeAngajat, Functie, DataNastere, DataAngajare, AdresaDomiciliu, Oras, IdJudet, CodPostal, SefDirect, Telefon, SalariuBrut)
VALUES ('Ciobanu' , 'Jumica' , 'Sales Representative' ,'2001-03-07', '2021-01-01', 'Strada Plai Verde 8', 'VALEA LARGA', 12, 100004, 3, '0789993788', 5600)
SELECT*FROM Angajati





--CREATI UN TRIGGER PE TABELA CLIENTI CARE SA VERIFICE CA NUMARUL DE TELEFON INTRODUS ARE EXACT 10 CIFRE

IF OBJECT_ID('tr_CLIENTI_TELEFON', 'TR') IS NOT NULL
DROP TRIGGER tr_CLIENTI_TELEFON;
GO
CREATE TRIGGER tr_CLIENTI_TELEFON
ON Clienti
AFTER INSERT, UPDATE
AS
	BEGIN
		IF @@ROWCOUNT = 0 RETURN;
			SET NOCOUNT ON;
		DECLARE @TEL NVARCHAR(12)
		SELECT @TEL = Telefon FROM inserted
		IF(
			LEN(@TEL) <> 10
		)
		BEGIN
			THROW 50000, 'NUMARUL DE TELEFON NU ARE 10 CIFRE!!', 0;
		END;

		ELSE
			BEGIN
				INSERT  Clienti (NumeClient, PrenumeClient, Adresa, Oras, IdJudet, Mail, Telefon, DataNastere)
				SELECT NumeClient, PrenumeClient, Adresa, Oras, IdJudet, Mail, Telefon, DataNastere FROM INSERTED;
			END

	END



	INSERT INTO Clienti (NumeClient, PrenumeClient, Adresa, Oras, IdJudet, Mail, Telefon, DataNastere)
VALUES ('CIOACA' , 'Alexandra' , 'Strada Plaiului 8' , 'Campina' , 31, 'alexandra_buzatoiu@yahoo.com', '073950507199' , '2000-03-19') 


SELECT*FROM Produse


--SA SE CREEZE UN TRIGGER CARE SA EXECUTE IN INTERIORUL SAU PROCEDURA STOCATA MOVE_ITEM, ASTFEL INCAT, ATUNCI CAND
--UN PRODUS ESTE COMANDAT, SA SCADA NUMARUL DE UNITATI DIN STOCK SI SA CREASCA NUMARUL DE UNITATI LA COMANDA
IF OBJECT_ID('tr_STOCKS_ORD', 'TR') IS NOT NULL
DROP TRIGGER tr_STOCKS_ORD;
GO
CREATE TRIGGER tr_STOCKS_ORD
ON Facturi
AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @ID_PRODUS INT
		DECLARE @QUANTITY INT
		DECLARE @ID_COMANDA INT
		DECLARE @IDFACT INT
		SELECT @ID_COMANDA = IdComanda FROM inserted
		SELECT @QUANTITY = Cantitate FROM inserted
		SELECT @ID_PRODUS = IdProdus FROM inserted
		SELECT @IDFACT = IdFactura FROM inserted
		SELECT*FROM Facturi AS F
		INNER JOIN Produse AS P
		ON F.IdProdus=P.Id_Produs
		WHERE F.IdFactura = @IDFACT
		EXEC PS_STOCKS @ID_PRODUS, @QUANTITY
		SELECT*FROM Facturi AS F
		INNER JOIN Produse AS P
		ON F.IdProdus=P.Id_Produs
		WHERE F.IdFactura = @IDFACT
	END


SELECT*FROM Produse
SELECT*FROM Comenzi
SELECT*FROM Facturi

INSERT INTO Facturi(IdComanda, IdProdus, Cantitate, PretUnitar)
VALUES(4, 1, 7, 300)



--CREATI UN TRIGGER CARE SA IMPIEDICE ADAUGAREA IN BAZA DE DATA A UNUI UTILIZATOR INSTAGRAM CARE NU ARE MINIM 10.000 DE URMARITORI PE INSTAGRAM
IF OBJECT_ID('tr_INFLUENCERI_NEPOPULARI', 'TR') IS NOT NULL
DROP TRIGGER tr_INFLUENCERI_NEPOPULARI;
GO
CREATE TRIGGER tr_INFLUENCERI_NEPOPULARI
ON Influenceri
AFTER INSERT, UPDATE
AS
	BEGIN
		IF @@ROWCOUNT = 0 RETURN;
			SET NOCOUNT ON;
		DECLARE @FOLLOWERS INT
		SELECT @FOLLOWERS = NumarUrmaritoriInstagram FROM inserted
		IF @FOLLOWERS < 10000
			BEGIN
				THROW 50000, 'UTILIZATORUL INSTAGRAM NU ESTE CONSIDERAT INFLUENCER DE COMPANIA NOASTRA!!', 0;
			END;
		ELSE
			BEGIN
				INSERT INTO Influenceri (NumeInfluencer, PrenumeInfluencer, DataNastere, Adresa, Oras, IdJudet, NumarUrmaritoriInstagram)
				SELECT NumeInfluencer, PrenumeInfluencer, DataNastere, Adresa, Oras, IdJudet, NumarUrmaritoriInstagram FROM INSERTED
			END;
			
	END

	INSERT INTO Influenceri (NumeInfluencer, PrenumeInfluencer, DataNastere, Adresa, Oras, IdJudet, NumarUrmaritoriInstagram)
VALUES ('Iacob' , 'Sanziana' , '1994-10-09' , 'Strada Florilor 156B' , 'Bucuresti' , 42, 6098)





IF OBJECT_ID('tr_STOCKS_ORD', 'TR') IS NOT NULL
DROP TRIGGER tr_STOCKS_ORD;
GO
CREATE TRIGGER tr_STOCKS_ORD
ON Facturi
AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @ID_PRODUS INT
		DECLARE @QUANTITY INT
		DECLARE @ID_COMANDA INT
		DECLARE @IDFACT INT
		SELECT @ID_COMANDA = IdComanda FROM inserted
		SELECT @QUANTITY = Cantitate FROM inserted
		SELECT @ID_PRODUS = IdProdus FROM inserted
		SELECT @IDFACT = IdFactura FROM inserted
		SELECT*FROM Facturi AS F
		INNER JOIN Produse AS P
		ON F.IdProdus=P.Id_Produs
		WHERE F.IdFactura = @IDFACT
		UPDATE Produse
		SET
		BucatiStock -= @Quantity
		WHERE Id_Produs = @IdProdus
		UPDATE Produse
		SET
		BucatiComanda += @Quantity
		WHERE Id_Produs = @IdProdus
		SELECT*FROM Facturi AS F
		INNER JOIN Produse AS P
		ON F.IdProdus=P.Id_Produs
		WHERE F.IdFactura = @IDFACT
	END


