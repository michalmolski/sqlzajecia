USE master
DROP DATABASE FirmaKomputerowa
CREATE DATABASE FirmaKomputerowa
--DROP TABLE [FirmaKomputerowa].[dbo].[Produkty];
--DROP TABLE [FirmaKomputerowa].[dbo].[PC];
--DROP TABLE [FirmaKomputerowa].[dbo].[LAPTOP];
--DROP TABLE [FirmaKomputerowa].[dbo].[DRUKARKI];


CREATE TABLE [FirmaKomputerowa].[dbo].[Produkty]
(
	producent nvarchar(30),
	model nvarchar(30)  PRIMARY KEY NOT NULL,
	typ nvarchar(30),
);
CREATE TABLE [FirmaKomputerowa].[dbo].[PC]
(
	model nvarchar(30) PRIMARY KEY NOT NULL,
	procesor INT,
	ram nvarchar(30),
	hdd nvarchar(30),
	cd nvarchar(30),
	ekran INT,
	cena MONEY,

);

CREATE TABLE [FirmaKomputerowa].[dbo].[LAPTOP]
(
	model nvarchar(30) PRIMARY KEY NOT NULL,
	procesor INT,
	ram INT,
	hdd INT,
	ekran INT,
	cena MONEY,
);

CREATE TABLE [FirmaKomputerowa].[dbo].[DRUKARKI]
(
	model nvarchar(30) PRIMARY KEY NOT NULL,
	kolor BIT,
	typ nvarchar(30),
	cena MONEY,
);
