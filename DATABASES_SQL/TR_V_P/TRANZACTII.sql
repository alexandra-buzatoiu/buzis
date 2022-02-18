--CREATI O TRANZACTIE CARE INCEARCA SA INTRODUCA UN NOU CLIENT SI PUNETI IN EVIDENTA MECANISMUL DE TRATARE A ERORILOR
BEGIN TRY
BEGIN TRAN;
SET IDENTITY_INSERT Comenzi OFF;
SET IDENTITY_INSERT Clienti OFF;
SET IDENTITY_INSERT Influenceri OFF;
SET IDENTITY_INSERT Angajati OFF;
SET IDENTITY_INSERT Facturi OFF;
SET IDENTITY_INSERT FirmeCurierat OFF
SET IDENTITY_INSERT Clienti ON;


INSERT INTO Clienti(IdClient,NumeClient,PrenumeClient, Adresa, Oras, IdJudet, Mail, Telefon, DataNastere)
VALUES(1,'Wild' , 'Ioana' , 'Strada Teilor 7' , 'Campina' , 31, 'wild_ioana@gmail.com', '0723457722' , '2003-12-04');
SET IDENTITY_INSERT Clienti OFF;
COMMIT TRAN;
END TRY
BEGIN CATCH
IF ERROR_NUMBER() = 2627 -- Duplicate key violation
BEGIN
PRINT 'Primary Key violation';
END
ELSE IF ERROR_NUMBER() = 547 -- Constraint violations
BEGIN
PRINT 'Constraint violation';
END
ELSE
BEGIN
PRINT 'Unhandled error';
END;
--SELECT ERROR_NUMBER()
IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
END CATCH;


select*from clienti



--CREATI O TRANZACTIE CARE INCEARCA SA INTRODUCA UN NOU INFLUENCER SI PUNETI IN EVIDENTA MECANISMUL DE TRATARE A ERORILOR
BEGIN TRY
BEGIN TRAN;
SET IDENTITY_INSERT Comenzi OFF;
SET IDENTITY_INSERT Clienti OFF;
SET IDENTITY_INSERT Influenceri OFF;
SET IDENTITY_INSERT Angajati OFF;
SET IDENTITY_INSERT Facturi OFF;
SET IDENTITY_INSERT FirmeCurierat OFF
SET IDENTITY_INSERT Influenceri ON;
INSERT INTO Influenceri (IdInfluencer,NumeInfluencer, PrenumeInfluencer, DataNastere, Adresa, Oras, IdJudet, NumarUrmaritoriInstagram)
VALUES (2,'Iacob' , 'Sanziana' , '1994-10-09' , 'Strada Florilor 156B' , 'Bucuresti' , 42, 256098);
SET IDENTITY_INSERT Influenceri OFF;
COMMIT TRAN;
END TRY
BEGIN CATCH
IF ERROR_NUMBER() = 2627 -- Duplicate key violation
BEGIN
PRINT 'Primary Key violation';
END
ELSE IF ERROR_NUMBER() = 547 -- Constraint violations
BEGIN
PRINT 'Constraint violation';
END
ELSE
BEGIN
PRINT 'Unhandled error';
END;
IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
END CATCH;




--CREATI O TRANZACTIE CARE INCEARCA SA INTRODUCA O FACTURA NOUA SI PUNETI IN EVIDENTA MECANISMUL DE TRATARE A ERORILOR
BEGIN TRY
BEGIN TRAN;
SET IDENTITY_INSERT Comenzi OFF;
SET IDENTITY_INSERT Clienti OFF;
SET IDENTITY_INSERT Influenceri OFF;
SET IDENTITY_INSERT Angajati OFF;
SET IDENTITY_INSERT Facturi OFF;
SET IDENTITY_INSERT FirmeCurierat OFF
SET IDENTITY_INSERT Facturi ON;
INSERT INTO Facturi(IdFactura, IdComanda, IdProdus, Cantitate, PretUnitar)
VALUES(1,1, 4, 2, 140);
SET IDENTITY_INSERT Facturi OFF;
COMMIT TRAN;
END TRY
BEGIN CATCH
IF ERROR_NUMBER() = 2627 -- Duplicate key violation
BEGIN
PRINT 'Primary Key violation';
END
ELSE IF ERROR_NUMBER() = 547 -- Constraint violations
BEGIN
PRINT 'Constraint violation';
END
ELSE
BEGIN
PRINT 'Unhandled error';
END;
IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
END CATCH;

select*from Curieri


--CREATI O TRANZACTIE CARE INCEARCA SA INTRODUCA UN NOU ANGAJAT SI PUNETI IN EVIDENTA MECANISMUL DE TRATARE A ERORILOR
BEGIN TRY
BEGIN TRAN;
SET IDENTITY_INSERT Comenzi OFF;
SET IDENTITY_INSERT Clienti OFF;
SET IDENTITY_INSERT Influenceri OFF;
SET IDENTITY_INSERT Angajati OFF;
SET IDENTITY_INSERT Facturi OFF;
SET IDENTITY_INSERT FirmeCurierat OFF
SET IDENTITY_INSERT Angajati ON;
INSERT INTO Angajati(NumeAngajat, PrenumeAngajat, Functie, DataNastere, DataAngajare, AdresaDomiciliu, Oras, IdJudet, CodPostal, SefDirect, Telefon, SalariuBrut)
VALUES ('cineva', 'Zenaida' , 'Sales Representative' ,'2000-03-09', '2021-01-01', 'Strada Sportului 8', 'Bucuresti', 4.2, 100004, 3, '0789543788', 5600);
SET IDENTITY_INSERT Angajati OFF;
COMMIT TRAN;
END TRY
BEGIN CATCH
IF ERROR_NUMBER() = 2627 -- Duplicate key violation
BEGIN
PRINT 'Primary Key violation';
END
ELSE IF ERROR_NUMBER() = 547 -- Constraint violations
BEGIN
PRINT 'Constraint violation';
END
ELSE IF ERROR_NUMBER() = 545 -- Constraint violations
BEGIN
PRINT 'CHECK Constraint violation';
END
ELSE
BEGIN
PRINT 'Unhandled error';
END;
--SELECT ERROR_NUMBER()
IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
END CATCH;



--CREATI O TRANZACTIE CARE INCEARCA SA INTRODUCA O NOUA COMANDA SI PUNETI IN EVIDENTA MECANISMUL DE TRATARE A ERORILOR
BEGIN TRY
BEGIN TRAN;
SET IDENTITY_INSERT Comenzi OFF;
SET IDENTITY_INSERT Clienti OFF;
SET IDENTITY_INSERT Influenceri OFF;
SET IDENTITY_INSERT Angajati OFF;
SET IDENTITY_INSERT Facturi OFF;
SET IDENTITY_INSERT FirmeCurierat OFF
SET IDENTITY_INSERT Comenzi ON;
INSERT INTO Comenzi(IdComanda,IdAngajatPrelucrare, IdClient, DataPlasare, DataLimita, IdCurier, AdresaLivrare, OrasLivrare,IdJudetLivrare, IdCod)
VALUES (1,2, 1, '2021-04-20' , '2021-04-30', 2, 'Strada Principala 17', 'Joia Mare', 2, 1);
SET IDENTITY_INSERT Comenzi OFF;
COMMIT TRAN;
END TRY
BEGIN CATCH
IF ERROR_NUMBER() = 2627 -- Duplicate key violation
BEGIN
PRINT 'Primary Key violation';
END
ELSE IF ERROR_NUMBER() = 547 -- Constraint violations
BEGIN
PRINT 'Constraint violation';
END
ELSE IF ERROR_NUMBER() = 545 -- Constraint violations
BEGIN
PRINT 'CHECK Constraint violation';
END
ELSE
BEGIN
PRINT 'Unhandled error';
END;
--SELECT ERROR_NUMBER()
IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
END CATCH;


select*from FirmeCurierat

--CREATI O TRANZACTIE CARE INCEARCA SA INTRODUCA O NOUA FIRMA DE CURIERAT SI PUNETI IN EVIDENTA MECANISMUL DE TRATARE A ERORILOR
BEGIN TRY
BEGIN TRAN;
SET IDENTITY_INSERT Comenzi OFF;
SET IDENTITY_INSERT Clienti OFF;
SET IDENTITY_INSERT Influenceri OFF;
SET IDENTITY_INSERT Angajati OFF;
SET IDENTITY_INSERT Facturi OFF;
SET IDENTITY_INSERT FirmeCurierat OFF;
SET IDENTITY_INSERT FirmeCurierat ON;
INSERT INTO FirmeCurierat (IdFirmaCurierat,NumeFirma, AdresaSediu, OrasSediu, IdJudetSediu, TelefonSediu)
VALUES (1,'Fan Curierrrr' , 'Strada Take Ionescu 5', 'Arad', 2, '0244374298');
SET IDENTITY_INSERT FirmeCurierat OFF;
COMMIT TRAN;
END TRY
BEGIN CATCH
IF ERROR_NUMBER() = 2627 -- Duplicate key violation
BEGIN
PRINT 'Primary Key violation';
END
ELSE IF ERROR_NUMBER() = 547 -- Constraint violations
BEGIN
PRINT 'Constraint violation';
END
ELSE IF ERROR_NUMBER() = 545 -- Constraint violations
BEGIN
PRINT 'CHECK Constraint violation';
END
ELSE
BEGIN
PRINT 'Unhandled error';
END;
--SELECT ERROR_NUMBER()
IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
END CATCH;


--STERGETI CONTINUTUL COMENZILOR PLASATE DE CLIENTII DIN REGIUNEA Vest
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
WHERE R.NumeRegiune = 'Vest'


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
WHERE R.NumeRegiune = 'Vest'

ROLLBACK




--STERGETI CONTINUTUL COMENZII CU ID UL 33
BEGIN TRAN

	DELETE FROM Facturi
	WHERE IdComanda = 33

	SELECT* FROM Facturi

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