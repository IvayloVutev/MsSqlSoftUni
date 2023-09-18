USE Minions
CREATE TABLE [People](
  Id INT PRIMARY KEY IDENTITY,
  [Name] NVARCHAR(200) NOT NULL,
  Picture VARBINARY(MAX),
  Height DECIMAL(5,2),
  [Weight] DECIMAL(5,2),
  Gender BIT,
  Birthdate DATE NOT NULL,
  Biography NVARCHAR(MAX)
);

INSERT INTO People ([Name], Picture, Height, [Weight], Gender, Birthdate)
VALUES 
('Pesho1', null, 1.75, 69.55, 1, '11-09-1988'),
('Pesho2', null, 1.76, 70.55, 1, '12-10-1988'),
('Pesho3', null, 1.77, 71.55, 1, '8-11-1988'),
('Pesho4', null, 1.78, 72.55, 1, '9-12-1988'),
('Pesho5', null, 1.79, 73.55, 1, '7-13-1988')
