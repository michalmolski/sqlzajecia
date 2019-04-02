--zad2--
--ALTER TABLE Produkty
--ALTER COLUMN producent varchar(50)
 
SELECT DISTINCT producent AS 'ZAD2'
FROM Produkty Where typ = 'drukarka'

--insert into Produkty values('XYZ', 'EcoTank L30', 'drukarka');
--insert into Drukarki values('EcoTank L30', 1, 'laserowa', 829);
--ZAD3--
select 'Z3' AS 'Nr zad', model, ram, ekran
from Laptopy
where cena > 2000;
--zad4-------------------------------------------------------
SELECT * 
FROM Drukarki WHERE kolor=1;
--ZAD5-------------------------------------------------------
select 'Z5'AS 'Nrzad', model, procesor, hdd,cd
from PCs
where (cd = 8 and cena < 2500) or (cd = 16 and cena > 2500);
--ZAD6-------------------------------------------------------
select 'Z6' [Nr zad], Products.producent, Lapki.procesor,Lapki.hdd
from Produkty as Products
join Laptopy as Lapki
on Products.model = Lapki.model
where Lapki.hdd >= 500;
--ZAD7--------------------------------------------------------
select 'Z7' [Nr zad], Products.producent, PEC.procesor
from Produkty as Products
join PCs as PEC
on Products.model = PEC.model
where PEC.procesor <> '3500';
--zad8-------------------------------------------------------
SELECT'Z8'AS 'NRZAD', model,cena FROM Drukarki
WHERE cena=(SELECT max(cena) FROM Drukarki );
--zad9-------------------------------------------------------
SELECT 'Z9' [Nr zad],AVG(procesor) as 'srednia_proc'
FROM PCs
--zad10-------------------------------------------------------
SELECT 'Z10' [Nr zad],AVG(procesor) as 'srednia_proc>3500ZL'
FROM PCs WHERE cena>3500
--ZAD11-------------------------------------------------------
SELECT 'Z11' [Nr zad], AVG(PEC.procesor) AS 'AVGDELLPROC'
from Produkty as Products
join PCs as PEC
on Products.model = PEC.model
where CAST(Products.producent as varchar(50)) ='dell';
--ZAD12-------------------------------------------------------
SELECT 'Z12' AS 'NR ZAD', procesor,AVG(cena) AS 'AVGPRICE'
FROM PCs
GROUP BY procesor
--ZAD13------------------------------------------------------
SELECT 'Z13' [Nr zad],CAST(Products.producent AS varchar(50)) as 'prod', AVG(PEC.ekran) AS 'AVGEKR'
from Produkty as Products
join Laptopy as PEC
on Products.model = PEC.model
GROUP BY CAST(Products.producent AS varchar(50))
