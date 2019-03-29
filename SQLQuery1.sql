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
VALUES		('DELL','2K8Q7','dom'),
			('ACER','2K9D7','dom'),
			('HP','3KS83','inny'),
			('DELL','D93KS','dom'),
			('ASUS','2KED7','BIURO'),
			('HP','3KS22','inny'),
			('LENOVO','E83KS','dom'),
			('APPLE','2K9DS7','biuro'),
			('HP','22G63','inny'),
			('DELL','H28US','dom');

