CREATE TABLE Employees
(
  Id INT PRIMARY KEY IDENTITY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Title VARCHAR(50) NOT NULL,
  Notes VARCHAR(MAX)
); 

INSERT INTO Employees (FirstName, LastName, Title)
VALUES
('Peter', 'Petrov', 'Driver'),
('Ivan', 'Ivanov', 'Worker'),
('Georgi', 'Georgiev', 'Manager')

CREATE TABLE Customers 
(
  AccountNumber INT PRIMARY KEY IDENTITY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  PhoneNumber INT NOT NULL,
  EmergencyName VARCHAR(50) NOT NULL,
  EmergencyNumber INT NOT NULL,
  Notes VARCHAR(MAX)
); 

INSERT INTO Customers (FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber)
VALUES
('Peter', 'Petrov', 0888888888, 'Gosho', 0888888889),
('Ivan', 'Ivanov', 0888888887, 'Misho', 0888888890),
('Georgi', 'Georgiev', 0888888886, 'Krasi', 0888888891)

CREATE TABLE RoomStatus 
(
  RoomStatus BIT NOT NULL,
  Notes VARCHAR(MAX)
); 

INSERT INTO RoomStatus (RoomStatus)
VALUES
(0),
(1),
(0)

CREATE TABLE RoomTypes  
(
  RoomType VARCHAR(50) NOT NULL,
  Notes VARCHAR(MAX)
);

INSERT INTO RoomTypes (RoomType)
VALUES
('Studio'),
('Bedroom'),
('Apartament')


CREATE TABLE BedTypes   
(
  BedType VARCHAR(50) NOT NULL,
  Notes VARCHAR(MAX)
);

INSERT INTO BedTypes (BedType)
VALUES
('Personal'),
('Bedroom'),
('SmallBed')


CREATE TABLE Rooms    
(
  RoomNumber INT PRIMARY KEY IDENTITY,
  RoomType VARCHAR(50) NOT NULL,
  BedType VARCHAR(50) NOT NULL,
  Rate INT,
  RoomStatus BIT,
  Notes VARCHAR(MAX)
);

INSERT INTO Rooms  (RoomType, BedType)
VALUES
('Studio','Personal'),
('Bedroom', 'Bedroom'),
('Studio', 'SmallBed')

CREATE TABLE Payments     
(
  Id INT PRIMARY KEY IDENTITY,
  EmployeeId INT NOT NULL,
  PaymentDate DATE NOT NULL,
  AccountNumber INT NOT NULL,
  FirstDateOccupied DATE,
  LastDateOccupied DATE,
  TotalDays INT,
  AmountCharged DECIMAL(5,2) NOT NULL,
  TaxRate DECIMAL(5,2) NOT NULL,
  TaxAmount DECIMAL(5,2) NOT NULL,
  PaymentTotal DECIMAL(5,2) NOT NULL,
  Notes VARCHAR(MAX)
);

INSERT INTO Payments  (EmployeeId, PaymentDate, AccountNumber, AmountCharged, TaxRate, TaxAmount, PaymentTotal)
VALUES
(1,'2022-01-01', 12345, 500, 0.25, 125.50, 625),
(2,'2023-01-01', 12346, 500, 0.25, 125.50, 625),
(3,'2024-01-01', 12347, 500, 0.25, 125.50, 625)


CREATE TABLE Occupancies      
(
  Id INT PRIMARY KEY IDENTITY,
  EmployeeId INT NOT NULL,
  DateOccupied DATE,
  AccountNumber INT NOT NULL,
  RoomNumber INT NOT NULL,
  RateApplied INT,
  PhoneCharge INT,
  Notes VARCHAR(MAX)
);

INSERT INTO Occupancies  (EmployeeId, AccountNumber, RoomNumber)
VALUES
(123, 456, 789),
(112, 134, 156),
(167, 188, 199)