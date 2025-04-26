
CREATE DATABASE universiteDB ;
GO

USE universiteDB ;
GO


CREATE TABLE Kampus(

	kampus_id INT PRIMARY KEY,
	kampus_adi VARCHAR(100)

);

CREATE TABLE Bolum(

	bolum_id INT PRIMARY KEY,
	bolum_adi VARCHAR(100),
	kampus_id INT,
	FOREIGN KEY (kampus_id) REFERENCES Kampus(kampus_id)

);

CREATE TABLE  Hoca(

	hoca_id INT PRIMARY KEY,
	hoca_adi VARCHAR(100),
	hoca_soyadi VARCHAR(100),
	bolum_id INT,
	FOREIGN KEY (bolum_id) REFERENCES Bolum(bolum_id)

);

CREATE TABLE Ogrenci(

	ogrenci_id INT PRIMARY KEY,
	ogrenci_adi VARCHAR(100),
	ogrenci_soyadi VARCHAR(100),
	bolum_id INT,
	danisman_id INT,
	FOREIGN KEY (bolum_id) REFERENCES Bolum(bolum_id),
	FOREIGN KEY (danisman_id) REFERENCES Hoca(hoca_id)
  
 );
	
CREATE TABLE Derslik(

	derslik_id INT PRIMARY KEY ,
	derselik_adi VARCHAR (100),
	kapasite INT
	);

CREATE TABLE Ders(
	
	ders_id INT PRIMARY KEY,
	ders_adi VARCHAR(100),
	hoca_id INT,
	derslik_id INT,
	kampus_id INT,
	FOREIGN KEY (hoca_id) REFERENCES Hoca(hoca_id),
	FOREIGN KEY (ders_id) REFERENCES Ders(ders_id),
	FOREIGN KEY (kampus_id) REFERENCES Kampus(kampus_id)
);

CREATE TABLE Ogrenci_Ders(
	ogrenci_id INT,
	ders_id INT,
	PRIMARY KEY (ogrenci_id , ders_id),
	FOREIGN KEY (ogrenci_id) REFERENCES Ogrenci(ogrenci_id),
	FOREIGN KEY (ders_id) REFERENCES Ders(ders_id),

);

CREATE TABLE Sinav (

	sinav_id INT PRIMARY KEY ,
	ders_id INT ,
	sinav_tarihi DATE ,
	FOREIGN KEY (ders_id) REFERENCES Ders(ders_id)

);

CREATE TABLE Notlar (
    ogrenci_id INT,
    sinav_id INT,
    notu INT ,
    PRIMARY KEY (ogrenci_id , sinav_id),
    FOREIGN KEY (ogrenci_id) REFERENCES Ogrenci(ogrenci_id),
    FOREIGN KEY(sinav_id) REFERENCES Sinav(sinav_id)

);


CREATE TABLE Devamsizlik(
    ogrenci_id INT, 
    ders_id INT ,
    devamsizlik_sayisi INT ,
    PRIMARY KEY (ogrenci_id , ders_id),
    FOREIGN KEY (ogrenci_id) REFERENCES Ogrenci(ogrenci_id),
    FOREIGN KEY(ders_id) REFERENCES Ders(ders_id)

);

INSERT INTO Kampus VALUES 
	
	(1 , 'Merkez Kampüs'),
	(2 , 'Teknoloji Kampüsü')
	
INSERT INTO  Bolum VALUES

	(1 , 'PC Mühendisliði' , 1),
	(2 , 'Elektirik Mühendisliði' , 1),
	(3 , 'Makina Mühendisliði' ,2 );

INSERT INTO Hoca VALUES

	(101 , 'Yiğit' , 'Özen',1),
	(102 , 'Merve' , 'Özkan' ,1),
	(103 , 'Koray' , 'Taþtan' ,2),
	(104 , 'Mehmet' , 'Naci' ,2),
	(105 , 'Kamil' , 'Ersoy' ,3);

INSERT INTO Ogrenci VALUES
	(201 , 'Necat' , 'Ham' , 1 , 101),
	(202 , 'Hanife' , 'Koç' , 1 , 102),
	(203 , 'Fetih' , 'Ulu' , 2 , 103),
	(204 , 'Ahmet' , 'Deniz' , 2 , 104),	
	(205 , 'Fatma' , 'Er' , 3 , 105);

INSERT INTO Derslik VALUES
	(1, 'A101' , 40),
	(2, 'B202' , 30),
	(3, 'C303' , 35),
	(4, 'D404' , 25),
	(5, 'E505' , 20);

INSERT INTO Ders VALUES
	(301 ,'Veri Tabanı', 101 , 1, 1),
	(302 ,'Algoritma', 102 , 2, 1),
	(303 ,'Devre Teorsi', 103 , 3, 2),
	(304 ,'Elektronik', 104 , 4, 2),
	(305 ,'Termodinamik', 101 , 5, 1);

INSERT INTO Ogrenci_Ders VALUES

	(201,301),(201,302),
	(202,301),(203,303),
	(204,304),(205,305)

INSERT INTO Sinav VALUES
	
	(401, 301 , '2025-04-01'),
	(402, 301 , '2025-04-15'),
	(403, 302 , '2025-04-10'),
	(404, 303 , '2025-04-12'),
	(405, 305 , '2025-04-08');


INSERT INTO Notlar VALUES

	(201, 401 ,85),(202,401,78),
	(201, 402 ,92),(202,402,70),
	(201, 403, 60),(203,404,88),
	(205,405,75);

INSERT INTO Devamsizlik VALUES

	(201,301, 2),
	(201, 302, 0),
	(202, 301, 1),
	(203, 303, 4),
	(204, 305, 2),
	(205, 305, 3);

-- SORGU--
	