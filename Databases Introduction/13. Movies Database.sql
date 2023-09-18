CREATE DATABASE Movies

USE Movies

CREATE TABLE Directors
  (
  Id INT PRIMARY KEY IDENTITY,
  DirectorName VARCHAR(100),
  Notes VARCHAR(MAX)
  );

INSERT INTO Directors (DirectorName)
VALUES 
  ('Pesho'),
  ('Gosho'),
  ('Mitko'),
  ('Stefan'),
  ('Krasi')

CREATE TABLE Genres
  (
  Id INT PRIMARY KEY IDENTITY,
  GenresName VARCHAR(100),
  Notes VARCHAR(MAX)
  );

INSERT INTO Genres (GenresName)
VALUES 
  ('Comedy'),
  ('Action'),
  ('Horror'),
  ('Crime'),
  ('Drama')

CREATE TABLE Categories 
  (
  Id INT PRIMARY KEY IDENTITY,
  CategorieName VARCHAR(100),
  Notes VARCHAR(MAX)
  );
 
INSERT INTO Categories (CategorieName)
VALUES 
  ('Documentary film'),
  ('Experimental film‎'),
  ('Abstract animation'),
  ('Biographical film'),
  ('Dance film')

CREATE TABLE Movies 
  (
  Id INT PRIMARY KEY IDENTITY,
  Title VARCHAR(100),
  DirectorId INT,
  CopyrightYear DATE,
  [Length] TIME,
  GenreId INT,
  CategoryId INT,
  Rating INT,
  Notes VARCHAR(MAX)
  );

INSERT INTO Movies (Title, DirectorId, CopyrightYear, [Length], GenreId, CategoryId, Rating)
VALUES
('Die Hard', 1, '1996-01-01', '01:45:15.00', 1, 1, 9),
('Die Hard2', 2, '1997-01-01', '01:46:15.00', 2, 2, 9),
('Die Hard3', 3, '1998-01-01', '01:47:15.00', 3, 3, 9),
('Die Hard4', 4, '1999-01-01', '01:48:15.00', 4, 4, 9),
('Die Hard5', 5, '1999-01-01', '01:49:15.00', 5, 5, 9)