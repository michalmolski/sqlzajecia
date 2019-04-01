USE master
DROP DATABASE FirmaKomputerowa
CREATE DATABASE FirmaKomputerowa

-- Tworzenie tabel------------
CREATE TABLE [FirmaKomputerowa].[dbo].[Produkty]
(

	model nvarchar(30)  PRIMARY KEY NOT NULL,
	producent nvarchar(30),
	typ nvarchar(30),


);

CREATE TABLE [FirmaKomputerowa].[dbo].[PC]
(
	model nvarchar(30) PRIMARY KEY NOT NULL,
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
	model nvarchar(30) PRIMARY KEY NOT NULL,
	procesor INT,
	ram INT,
	hdd INT,
	ekran INT,
	cena MONEY,
	FOREIGN KEY (model) REFERENCES [FirmaKomputerowa].[dbo].[Produkty](model)
);

CREATE TABLE [FirmaKomputerowa].[dbo].[DRUKARKI]
(
	model nvarchar(30) PRIMARY KEY NOT NULL,
	kolor BIT,
	typ nvarchar(30),
	cena MONEY,
	FOREIGN KEY (model) REFERENCES [FirmaKomputerowa].[dbo].[Produkty](model)
);

--wprowadzanie wartoœci do tabel-----------

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

INSERT INTO [FirmaKomputerowa].[dbo].[PC](procesor,ram,hdd,cd,ekran,cena,model)
VALUES 
		(3400,8,512,'x8',12,1200,'2E4Q7'),
		(2300,16,1024,'x8',15,1500,'2K8Q7'),
		(3400,8,1024,'x16',17,2600,'2K9D7'),
		(3300,8,1024,'x8',15,1800,'2K9KO'),
		(3100,16,1024,'x16',19,2200,'2K9M7'),
		(2900,16,2048,'x16',19,2700,'3K8Q7'),
		(3000,8,2048,'x8',12,1700,'3KL02'),
		(2900,8,2048,'x8',12,1400,'3KS43'),
		(2700,32,2048,'x16',21,2900,'E83KS'),
		(3000,32,2048,'x16',21,3000,'H2P4S');
INSERT INTO [FirmaKomputerowa].[dbo].[LAPTOP](procesor,ram,hdd,ekran,cena,model)
VALUES 	
		(3400,8,512,12,1200.00,'22G63'),
		(2800,8,1024,15,1500.00,'2K9D0'),
		(3400,16,1024,17,2100.00,'2K9DS7'),
		(3300,8,1024,15,1800.00,'3KS83'),
		(3100,16,1024,17,2200.00,'4RED7'),
		(2400,16,2048,15,2100.00,'D93K0'),
		(3000,8,2048,17,1700.00,'D93KS'),
		(2800,4,1024,12,1400.00,'E80KS'),
		(2700,32,2048,15,2900.00,'WE3KS'),
		(3900,32,2048,15,3600.00,'X2G63');
INSERT INTO [FirmaKomputerowa].[dbo].[DRUKARKI](kolor,typ,cena,model)
VALUES	
		(1, 'laser' ,600.0, '22RR8'),
		(1, 'atrament' ,500.0, '2J9D7'),
		(1, 'atrament' ,520.0, '2KED7'),
		(0, 'laser' ,800.0, '2KEY7'),
		(0, 'laser' ,500.0, '3KS22'),
		(1, 'atrament' ,456.0, '3KS2Y'),
		(0, 'laser' ,530.0, '3KS80'),
		(1, 'atrament' ,180.0, 'H28US'),
		(1, 'laser' ,600.0, 'HX8US'),
		(0, 'laser' ,350.0, 'Q83KS');
