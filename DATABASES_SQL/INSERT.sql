INSERT INTO Clienti (NumeClient, PrenumeClient, Adresa, Oras, IdJudet, Mail, Telefon, DataNastere)
VALUES ('Buzatoiu' , 'Alexandra' , 'Strada Plaiului 8' , 'Campina' , 31, 'alexandra_buzatoiu@yahoo.com', '0735057199' , '2000-03-19') 
SELECT* FROM Clienti

UPDATE Clienti
SET DataNastere = '2000-03-19'
WHERE PrenumeClient = 'Alexandra'




INSERT INTO Angajati(NumeAngajat, PrenumeAngajat, Functie, DataNastere, DataAngajare, AdresaDomiciliu, Oras, IdJudet, CodPostal, SefDirect, Telefon, SalariuBrut)
VALUES ('Georgescu' , 'Zenaida' , 'Sales Representative' ,'2000-03-07', '2021-01-01', 'Strada Sportului 8', 'Bucuresti', 42, 100004, 3, '0789543788', 5600)
SELECT * FROM Angajati

INSERT INTO Branduri (NumeBrand, Oras, Tara, PersoanaContact, TelefonContact)
VALUES ('Prada' , 'Milano' , 'Italia' , 'Mario Bianco' , '0789653249')
SELECT* FROM Branduri

INSERT INTO CategoriiProduse (NumeCategorie, DescriereCategorie)
Values ('Palarii' , 'Un chapeau sur un chameau')
SELECT * FROM CategoriiProduse

INSERT INTO Influenceri (NumeInfluencer, PrenumeInfluencer, DataNastere, Adresa, Oras, IdJudet, NumarUrmaritoriInstagram)
VALUES ('Grama' , 'Ioana' , '1995-05-02' , 'Strada Cetatii 8' , 'Cluj' , 13, 364000)
SELECT* FROM Influenceri

INSERT INTO CoduriReducere (IdInfluencer, ProcentReducere, DataIntrare, DataSfarsit)
VALUES (1, 15, '2021-05-10', '2021-05-12')
SELECT* FROM CoduriReducere

INSERT INTO Produse (DenumireProdus, IdBrand, IdCategorie, PretUnitar, BucatiStock, BucatiRezervateCos, BucatiComanda)
VALUES ('Rochie tennis', 502, 100, 80, 400, 40, 25)
SELECT*FROM Produse

INSERT INTO Produse (DenumireProdus, IdBrand, IdCategorie, PretUnitar, BucatiStock, BucatiRezervateCos, BucatiComanda)
VALUES ('Colanti biker scurti', 502, 100, 50, 200, 60, 15),
	   ('Rochie bretele backless', 519, 102, 1000, 40, 2, 10),
	   ('Sutien corset costum baie', 507, 103, 65, 100, 23, 19)
SELECT*FROM Produse

INSERT INTO FirmeCurierat (NumeFirma, AdresaSediu, OrasSediu, IdJudetSediu, TelefonSediu)
VALUES ('Fan Curier' , 'Strada Take Ionescu 5', 'Arad', 2, '0244374298'),
		('Urgent Cargus', 'Strada Polona 12' , 'Medias', 28, '0244333032'),
		('Nemo Express' , 'Strada Ioaninei 312' , 'Bucuresti' , 42, '0244356897')
SELECT* FROM FirmeCurierat

INSERT INTO Curieri (NumeCurier, PrenumeCurier, IdFirmaCurierat, OrasLivrare, IdJudetLivrare, TelefonCurier)
VALUES ('Apreotesei', 'Alin', 1, 'Buzau' , 10, '0742567890'),
		('Dascalescu', 'Paulica', 2, 'Focsani', 41, '0765349876')
SELECT* FROM Curieri


INSERT INTO Curieri (NumeCurier, PrenumeCurier, IdFirmaCurierat, OrasLivrare, IdJudetLivrare, TelefonCurier)
VALUES ('Vasiliu', 'George', 3, 'Bucuresti' , 42, '0742567891'),
		('Grigoras', 'Ionel', 2, 'Campina', 31, '0765349823'),
		('Cretulescu', 'Darius', 1, 'Cluj-Napoca', 13, '0765349578'),
		('Ioanide', 'Quentin', 1, 'Arad', 2, '0775349823'),
		('Cubini', 'Dorian', 2, 'Braila', 9, '0765349773'),
		('Sumedrea', 'Sorin', 3, 'Vaslui', 39, '0766349823'),
		('Juncu', 'Petre', 2, 'Tulcea', 38, '0765349823'),
		('Nae', 'Niculae', 2, 'Timisoara', 37, '0765349123'),
		('Grigoras', 'Ionel', 2, 'Campina', 31, '0765349823'),
		('Nordici', 'Gigel', 2, 'Videle', 36, '0762249823'),
		('Ciucas', 'Alin', 2, 'Orsova', 27, '0765879823'),
		('Varbilau', 'Cristi', 2, 'Breb', 26, '0769849823'),
		('Dode', 'Mihail', 2, 'Buftea', 25, '0761249823'),
		('Ciucas', 'Alin', 2, 'Orsova', 27, '07785349823'),
		('Mirunescu', 'Lavinia', 2, 'Iasi', 25, '0764548823'),
		('Sucarov', 'Corina', 2, 'Deva', 22, '0765359823'),
		('Dimache', 'Silviu', 2, 'Resita', 11, '0765349823'),
		('Simuleac', 'Ion', 2, 'Botosani', 7, '0709349823')



SELECT* FROM Curieri



SELECT*FROM Comenzi
INSERT INTO Comenzi(IdAngajatPrelucrare, IdClient, DataPlasare, DataLimita, IdCurier, AdresaLivrare, OrasLivrare,IdJudetLivrare, IdCod)
VALUES (2, 1, '2021-04-20' , '2021-04-30', 2, 'Strada Principala 17', 'Joia Mare', 2, 1)

INSERT INTO Facturi(IdComanda, IdProdus, Cantitate, PretUnitar)
VALUES(1, 4, 2, 140),
	  (1, 1, 1, 130),
	  (1, 6, 1, 259)
SELECT*FROM Facturi

INSERT INTO Impozite(NumeImpozit, ProcentImpozit)
VALUES ('CAS', 25),
		('CASS', 10),
		('Impozit pe venit', 10)
SELECT* FROM Impozite

INSERT INTO ImpoziteAngajati(IdImpozit, IdAngajat)
VALUES(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,8),(1,9),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,8),(2,9),
	(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,8),(3,9)
SELECT* FROM ImpoziteAngajati

INSERT INTO Clienti (NumeClient, PrenumeClient, Adresa, Oras, IdJudet, Mail, Telefon, DataNastere)
VALUES ('Preoteasa' , 'Cristiana' , 'Strada Oituz 12' , 'Arad' , 2, 'preo_cris@gmail.com', '0723456122' , '1999-06-05'),
		('Margaritoiu' , 'Luca' , 'Strada Cisnadie 142' , 'Sibiu' , 34, 'luca_margaritoiu@gmail.com', '0767890543' , '1993-10-29'),
		('Duran' , 'Dominic' , 'Strada Take Ionescu 1' , 'Sinaia' , 31, 'diminiq_duran@gmail.com', '0790897867' , '2001-07-17'),
		('Rauta' , 'Ioana' , 'Strada Maramuresului 8' , 'Campina' , 31, 'ioa_rea@gmail.com', '0749494949' , '2000-10-19'),
		('Biris' , 'Diana' , 'Strada Turnatoriei 15A' , 'Campina' , 31, 'biris_diana@yahoo.com', '0745672314' , '2000-05-08'),
		('Maier' , 'Laura' , 'Strada Stejar Verde 22' , 'Deva' , 22, 'laura_maier@yahoo.com', '0711111113' , '1998-11-14'),
		('Cristache' , 'Bianca' , 'Strada Marasesti 126' , 'Cluj-Napoca' , 13, 'bibi_cris@gmail.com', '0729292929' , '2002-08-02'),
		('Coman' , 'Antonia' , 'Strada Republicii 25' , 'Vaslui' , 39, 'coman_anto9@yahoo.com', '0767890954' , '2001-02-09'),
		('Sambotin' , 'Vlad' , 'Strada Panseluta 78' , 'Foscani' , 41, 'olimpic_bio@gmail.com', '0789542678' , '1998-11-04'),
		('Popescu' , 'Raul' , 'Strada Creanga de Alun 14B' , 'Satu Mare' , 32, 'super_raul@yahoo.com', '0723456122' , '1999-06-05'),
		('Costovici' , 'Milena' , 'Strada Siriu 2A' , 'Nehoiu' , 10, 'inna_tenis@gmail.com', '0720050607' , '1999-09-17'),
		('Brezeanu' , 'Ana' , 'Strada Crima Rece 73' , 'Baia Mare' , 26, 'ana.brezi@gmail.com', '0723456122' , '2000-08-16'),
		('Nanu' , 'Alexandra' , 'Strada Docentilor 33' , 'Buftea' , 25, 'nanu_ursulet@yahoo.com', '0767890954' , '2000-03-15'),
		('Crampita' , 'Claudiu' , 'Strada 1 Mai 7' , 'Drobeta Turnu-Severin' , 27, 'clau_andrei@gmail.com', '0720345612' , '2000-04-28'),
		('Visoiu' , 'Alexia' , 'Strada Pana Filipescu 53' , 'Sfantu Gheorghe' , 15, 'ally_visoiu@gmail.com', '0756432189' , '2001-02-17'),
		('Micu' , 'Judelle' , 'Strada Farin 92' , 'Targoviste' , 16, 'jodelle_m@gmail.com', '0789345612' , '2004-01-04'),
		('Mihalache' , 'Mihail' , 'Strada Malaiesti 27' , 'Videle' , 36, 'mih.mih@gmail.com', '0789453627' , '2004-12-09'),
		('Radu' , 'Petru' , 'Strada Arinului 12' , 'Murighiol' , 38, 'numatindecuvant@gmail.com', '0789674534' , '2001-12-20'),
		('Radu' , 'Ilinca' , 'Strada Teodorovici 67' , 'Resita' , 11, 'rli_ili@gmail.com', '0724567908' , '2008-01-31'),
		('Buzatoiu' , 'Elena' , 'Strada Mihai-Voda 108C' , 'Roman' , 9, 'simona_elena@gmail.com', '0724034789' , '1972-05-21')




INSERT INTO Influenceri (NumeInfluencer, PrenumeInfluencer, DataNastere, Adresa, Oras, IdJudet, NumarUrmaritoriInstagram)
VALUES ('Iacob' , 'Sanziana' , '1994-10-09' , 'Strada Florilor 156B' , 'Bucuresti' , 42, 256098),
		('Giurcanu' , 'Laura' , '1996-01-02' , 'Strada Cristal 20B' , 'Bucuresti' , 42, 889765),
		('Negru' , 'Sanziana' , '1987-04-12' , 'Strada Saniuta 54' , 'Bucuresti' , 42, 300876),
		('Ich' , 'Cristina' , '1990-07-21' , 'Strada Piturca 23' , 'Bucuresti' , 42, 1000289),
		('Dascalu' , 'Anya' , '2001-10-16' , 'Strada Baba-Novac 8' , 'Bucuresti' , 42, 102345),
		('Alexe' , 'Diana' , '2000-07-04' , 'Strada Principala 3' , 'Banesti' , 31, 56831),
		('Anghel' , 'Daiana' , '1973-12-22' , 'Strada Sforii 34A' , 'Brasov' , 8, 202678),
		('Iacob' , 'Sanziana' , '1994-10-09' , 'Strada Florilor 156B' , 'Bucuresti' , 42, 256098),
		('Cristina' , 'Stefania' , '1996-02-23' , 'Bulevardul Primaverii 134' , 'Bucuresti' , 42, 1345908),
		('Irina' , 'Deaconescu' , '1997-10-09' , 'Strada Laleaua Mica 2' , 'Iasi' , 24, 1000987),
		('Ceusan' , 'Alina' , '1989-10-09' , 'Strada Matei Voda 78' , 'Cluj-Napoca' , 13, 956098),
		('Grebenisan' , 'Carmen' , '1992-10-09' , 'Strada Primariei 15' , 'Otopeni' , 25, 686098),
		('Pestritu' , 'Adelina' , '1988-03-31' , 'Strada Berceni 3A' , 'Bucuresti' , 42, 1789006),
		('Morodan' , 'Ana' , '1985-08-12' , 'Strada Calea Mosilor 87' , 'Bucuresti' , 42, 426789),
		('Iacob' , 'Sanziana' , '1994-10-09' , 'Strada Florilor 156B' , 'Bucuresti' , 42, 256098),
		('Ramascanu' , 'Ana-Elena' , '1995-06-18' , 'Strada Emil Racovita 16' , 'Iasi' , 24, 66245)

		

		
SELECT* FROM Clienti


INSERT INTO CoduriReducere (IdInfluencer, ProcentReducere, DataIntrare, DataSfarsit)
VALUES 
		(2, 15, '2021-05-10', '2021-05-12'),
		(3, 15, '2021-05-10', '2021-05-12'),
		(4, 15, '2021-05-10', '2021-05-12'),
		(5, 15, '2021-05-10', '2021-05-12'),
		(6, 15, '2021-05-10', '2021-05-12'),
		(7, 25, '2021-05-10', '2021-05-12'),
		(8, 15, '2021-05-10', '2021-05-12'),
		(9, 15, '2021-05-10', '2021-05-12'),
		(10, 15, '2021-05-10', '2021-05-12'),
		(11, 15, '2021-05-10', '2021-05-12'),
		(12, 15, '2021-05-10', '2021-05-12'),
		(13, 15, '2021-05-10', '2021-05-12'),
		(14, 15, '2021-05-10', '2021-05-12'),
		(15, 15, '2021-05-10', '2021-05-12'),
		(16, 15, '2021-05-10', '2021-05-12'),
		(17, 25, '2021-05-10', '2021-05-12')
SELECT* FROM CoduriReducere

select*from Influenceri


INSERT INTO Produse (DenumireProdus, IdBrand, IdCategorie, PretUnitar, BucatiStock, BucatiRezervateCos, BucatiComanda)
VALUES ('Sandale barete', 525, 102, 1600, 100, 29, 13),
		('Rochie backless', 523, 101, 700, 39, 12, 9),
		('Palarie Multifunctionala', 524, 114, 20, 400, 100, 125),
		('Blugi Rupti Spate', 522, 104, 75, 200, 65, 43),
		('Ceas Curea Piele', 515, 108, 100, 305, 100, 102),
		('Ceas inchidere surub', 519, 108, 400, 50, 40, 4),
		('Adidasi casual', 520, 101, 159, 250, 40, 25),
		('Adidasi upperheel', 516, 100, 210, 600, 400, 100),
		('Fusta brodata', 517, 102 , 100, 100, 60, 25),
		('Tricou decolteu V', 514, 101, 30, 300, 90, 87),
		('Camasa Boss', 518, 112, 120, 200, 60, 12),
		('Sacou CB Catifea', 510, 112, 200, 200, 40, 32),
		('Geanta Plic', 512, 105, 400, 100, 20, 9),
		('Cizme calarie', 508, 105, 500, 50, 10, 6),
		('Camasa Boss', 518, 112, 120, 200, 60, 12),
		('Jacheta blugi', 509, 104, 220, 200, 180, 10),
		('Camasa Boss', 518, 112, 120, 200, 60, 12),
		('Bocanci alpinist', 504, 100, 600, 100, 10, 62),
		('Camasa Boss', 518, 112, 120, 200, 60, 12),
		('Blugi Scarlett', 506, 104, 120, 200, 60, 12),
		('Tricou guler', 507, 101, 90, 200, 60, 12),
		('Ghete track', 503, 100, 220, 100, 50, 32),
		('Costum monkey bikini', 511, 103, 300, 50, 30, 3),
		('Body dantela', 510, 111, 80, 310, 100, 105),
		('Camasa Boss', 518, 112, 120, 200, 60, 12),
		('Sacou cambrat dama', 513, 109, 500, 30, 6, 5),
		('Salopeta kangaroo', 500, 106, 140, 100, 70, 5),
		('Camasa Boss', 518, 112, 120, 200, 60, 12),
		('Air Jordan 10 mini', 500, 107, 80, 200, 40, 122),
		('Camasa Boss', 518, 112, 120, 200, 60, 12),
		('Pantaloni lowwaist men', 524, 113, 790, 200, 160, 82),
		('Camasa Boss', 518, 112, 120, 200, 60, 12),
		('Halat pufos flagship', 523, 110, 700, 20, 2, 14)


INSERT INTO Clienti (NumeClient, PrenumeClient, Adresa, Oras, IdJudet, Mail, Telefon, DataNastere)
VALUES ('Chirila' , 'Tudor' , 'Strada Martisor 87' , 'Bucuresti' , 42, 'vama_veche@gmail.com', '0741234567' , '1987-03-19') 
SELECT* FROM Clienti
		

INSERT INTO Comenzi(IdAngajatPrelucrare, IdClient, DataPlasare, DataLimita, IdCurier, AdresaLivrare, OrasLivrare,IdJudetLivrare, IdCod)
VALUES (2, 2, '2021-05-20' , '2021-05-30', 2, 'Strada Oaste 17', 'Dimieni', 2, 1),
		(6, 4, '2021-05-21' , '2021-05-30', 3, 'Strada Vanatori 115', 'Sibiu', 34, 5),
		(2, 6, '2021-05-01' , '2021-05-15', 1, 'Strada Maramuresului 8', 'Campina', 31, 13)

		select*from Clienti
		

INSERT INTO Comenzi(IdAngajatPrelucrare, IdClient, DataPlasare, DataLimita, IdCurier, AdresaLivrare, OrasLivrare,IdJudetLivrare, IdCod)
VALUES (5, 20, '2021-03-19' , '2021-03-30', 2, 'Strada Vianu 90', 'Alba-Iulia',1 , 2)
INSERT INTO Comenzi(IdAngajatPrelucrare, IdClient, DataPlasare, DataLimita, IdCurier, AdresaLivrare, OrasLivrare,IdJudetLivrare, IdCod)
VALUES
		(6, 1, '2021-05-21' , '2021-05-30', 3, 'Strada Sunatoare 115', 'Arad', 2, 5),
		(1, 2, '2021-04-01' , '2021-04-15', 1, 'Strada Musetel 8', 'Pitesti', 3, 3),
		(2, 3, '2021-01-20' , '2021-01-30', 2, 'Strada Tei 17', 'Bacau', 4, 4)
		INSERT INTO Comenzi(IdAngajatPrelucrare, IdClient, DataPlasare, DataLimita, IdCurier, AdresaLivrare, OrasLivrare,IdJudetLivrare, IdCod)
VALUES
		(3, 4, '2021-02-21' , '2021-02-28', 3, 'Strada Soricel 115', 'Oradea', 5, 5),
		(4, 5, '2021-03-01' , '2021-03-15', 4, 'Strada Paducel 8', 'Botosani', 7, 6),
		(5, 6, '2021-04-20' , '2021-04-30', 5, 'Strada Lalea 17', 'Brasov', 8, 7),
		(6, 7, '2021-05-21' , '2021-05-30', 6, 'Strada Coada Calului 115', 'Buzau', 10, 8),
		(8, 8, '2021-06-01' , '2021-06-15', 7, 'Strada Rodie 8', 'Resita', 11, 9),
		(9, 9, '2021-01-20' , '2021-01-30', 8, 'Strada Zmeura 17', 'Calarasi', 12, 10),
		(1, 10, '2021-02-21' , '2021-02-28', 9, 'Strada Mure 115', 'Cluj', 13, 11),
		(2, 11, '2021-03-01' , '2021-03-15', 10, 'Strada Afile 8', 'Constanta', 14, 12),
		(3, 12, '2021-04-20' , '2021-04-30', 11, 'Strada Capsuni 17', 'Sfantu Gheorghe', 15, 13),
		(4, 13, '2021-05-21' , '2021-05-30', 12, 'Strada Portocale 115', 'Targoviste', 16, 14),
		(5, 14, '2021-06-01' , '2021-06-15', 13, 'Strada Zdrobitoare 8', 'Hateg', 22, 15),
		(6, 15, '2021-01-20' , '2021-01-30', 14, 'Strada Fainosag 17', 'Iasi', 24, 16),
		(8, 16, '2021-02-21' , '2021-02-28', 15, 'Strada Lubenita 115', 'Buftea', 25, 17),
		(2, 17, '2021-03-01' , '2021-03-15', 16, 'Strada Barabule 8', 'Baia-Mare', 26, 1),
		(5, 18, '2021-04-01' , '2021-04-15', 17, 'Strada Ciupercuta 8', 'Piatra Neamt', 29, 2),
		(6, 19, '2021-05-20' , '2021-05-30', 18, 'Strada Lady Dimitrescu 17', 'Sibiu', 34, 3),
		(8, 22, '2021-06-21' , '2021-06-30', 19, 'Strada Corset 115', 'Sibiu', 34, 4),
		(2, 21, '2021-01-01' , '2021-01-15', 20, 'Strada Walking Dead 8', 'Timisoara', 37, 5)
		
SELECT*FROM Comenzi

SELECT*FROM Produse
select*from Comenzi

INSERT INTO Facturi(IdComanda, IdProdus, Cantitate, PretUnitar)
VALUES(2, 5, 1, 1500),
	  (2, 9, 1, 120),
	  (2,11, 2, 400),
	  (2, 15, 1, 600),
	  (3, 18, 1, 999),
	  (3,17, 2, 500),
	  (3, 28, 1, 700),
	  (4, 9, 1, 120),
	  (4,20, 1, 1699)


INSERT INTO Facturi(IdComanda, IdProdus, Cantitate, PretUnitar)
VALUES(20, 1, 3, 220),
	  (20, 5, 1, 120),
	  (20,7, 2, 2700),
	  (33, 4, 1, 170),
	  (33, 5, 1, 1799),
	  (34,6, 2, 300),
	  (34, 7, 1, 2800),
	  (34, 8, 1, 1200),
	  (35,9, 1, 169),
	  (35, 10, 1, 500),
	  (68,11, 1, 920),
	  (69,12, 2, 400),
	  (69, 13, 1, 600),
	  (70, 14, 1, 999),
	  (70,15, 2, 650),
	  (70, 16, 1, 130),
	  (71, 17, 1, 350),
	  (71,18, 1, 789),
	  (72, 19, 1, 1100),
	  (72, 20, 1, 1399),
	  (73,21, 2, 400),
	  (74, 22, 1, 600),
	  (74, 23, 1,3999),
	  (75,24, 2, 2500),
	  (75, 25, 1, 500),
	  (75, 26, 1, 120),
	  (76,27, 1, 199),
	  (77, 28, 1, 450),
	  (77, 29, 1, 820),
	  (78,30, 2, 130),
	  (79, 31, 1, 290),
	  (79, 32, 1, 998),
	  (79,33, 2, 500),
	  (80, 34, 1, 300),
	  (80, 35, 1, 215),
	  (80,36, 1, 405),
	  (80, 37, 1, 1205),
	  (80, 38, 1, 456),
	  (80,39, 2, 3099),
	  (80, 10, 1, 208),
	  (81, 12, 1, 110),
	  (82,17, 2, 320),
	  (83, 28, 1, 500),
	  (83, 9, 1, 155),
	  (83,13, 1, 389),
	  (84, 15, 1, 100),
	  (84, 19, 1, 350),
	  (84,17, 2, 119),
	  (85, 15, 1, 600),
	  (85, 28, 1, 500),
	  (85,7, 2, 220),
	  (85, 38, 1, 400),
	  (85, 39, 1, 3099),
	  (85,22, 1, 459)

INSERT INTO Facturi(IdComanda, IdProdus, Cantitate, PretUnitar)
VALUES(1, 4, 2, 140),
	  (1, 1, 1, 130),
	  (1, 6, 1, 259)
SELECT*FROM Facturi