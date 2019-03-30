USE master
DROP DATABASE FirmaKomputerowa
CREATE DATABASE FirmaKomputerowa
--DROP TABLE [FirmaKomputerowa].[dbo].[Produkty];
--DROP TABLE [FirmaKomputerowa].[dbo].[PC];
--DROP TABLE [FirmaKomputerowa].[dbo].[LAPTOP];
--DROP TABLE [FirmaKomputerowa].[dbo].[DRUKARKI];

CREATE TABLE [FirmaKomputerowa].[dbo].[Produkty]
(

	model nvarchar(30)  PRIMARY KEY NOT NULL,
	producent nvarchar(30),
	typ nvarchar(30),
	--FOREIGN KEY (model) REFERENCES [FirmaKomputerowa].[dbo].[PC](model),
	--FOREIGN KEY (model) REFERENCES [FirmaKomputerowa].[dbo].[LAPTOP](model),
	--FOREIGN KEY (model) REFERENCES [FirmaKomputerowa].[dbo].[DRUKARKI](model) 

);

CREATE TABLE [FirmaKomputerowa].[dbo].[PC]
(
	model nvarchar(30) PRIMARY KEY,
	procesor INT,
	ram INT,
	hdd INT,
	cd nvarchar(30),
	ekran INT,
	cena MONEY,
	FOREIGN KEY (model) REFERENCES [FirmaKomputerowa].[dbo].[Produkty](model)

);

CREATE TABLE [FirmaKomputerowa].[dbo].[LAPTOP]
(
	model nvarchar(30) PRIMARY KEY ,
	procesor INT,
	ram INT,
	hdd INT,
	ekran INT,
	cena MONEY,
	FOREIGN KEY (model) REFERENCES [FirmaKomputerowa].[dbo].[Produkty](model)
);

CREATE TABLE [FirmaKomputerowa].[dbo].[DRUKARKI]
(
	model nvarchar(30) PRIMARY KEY ,
	kolor BIT,
	typ nvarchar(30),
	cena MONEY,
	FOREIGN KEY (model) REFERENCES [FirmaKomputerowa].[dbo].[Produkty](model)
);
INSERT INTO [FirmaKomputerowa].[dbo].[Produkty](producent,model,typ) 
VALUES		('DELL','2K8Q7','pc'),
			('ACER','2K9D7','pc'),
			('HP','3KS83','laptop'),
			('DELL','D93KS','laptop'),
			('ASUS','2KED7','drukarka'),
			('HP','3KS22','drukarka'),
			('LENOVO','E83KS','pc'),
			('APPLE','2K9DS7','laptop'),
			('HP','22G63','laptop'),
			('DELL','H28US','drukarka'),
			('DELL','3K8Q7','pc'),
			('ACER','2J9D7','drukarka'),
			('HP','3KS43','pc'),
			('DELL','WE3KS','laptop'),
			('ASUS','4RED7','laptop'),
			('HP','3KL02','pc'),
			('LENOVO','E80KS','laptop'),
			('APPLE','2K9KO','pc'),
			('HP','22RR8','drukarka'),
			('DELL','H2P4S','pc'),
			('DELL','2E4Q7','pc'),
			('ACER','2K9D0','laptop'),
			('HP','3KS80','drukarka'),
			('DELL','D93K0','laptop'),
			('ASUS','2KEY7','drukarka'),
			('HP','3KS2Y','drukarka'),
			('LENOVO','Q83KS','drukarka'),
			('APPLE','2K9M7','pc'),
			('HP','X2G63','laptop'),
			('DELL','HX8US','drukarka');
INSERT INTO [FirmaKomputerowa].[dbo].[PC](model)
SELECT model FROM [FirmaKomputerowa].[dbo].[Produkty]
WHERE typ='pc'
INSERT INTO [FirmaKomputerowa].[dbo].[LAPTOP](model)
SELECT model FROM [FirmaKomputerowa].[dbo].[Produkty]
WHERE typ='laptop'
INSERT INTO [FirmaKomputerowa].[dbo].[DRUKARKI](model)
SELECT model FROM [FirmaKomputerowa].[dbo].[Produkty]
WHERE typ='drukarka'
