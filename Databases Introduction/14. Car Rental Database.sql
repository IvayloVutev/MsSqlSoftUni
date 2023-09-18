CREATE TABLE Categories
( 
  Id INT PRIMARY KEY IDENTITY,
  CategoryName VARCHAR(100),
  DailyRate INT NOT NULL,
  WeeklyRate INT NOT NULL,
  MonthlyRate INT NOT NULL,
  WeekendRate INT NOT NULL,
); 

INSERT INTO Categories (CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES
('Van', 1, 2, 3, 4),
('Light Vehicle', 2, 3, 4, 5),
('SUV', 3, 4, 5, 6)


CREATE TABLE Cars 
( 
  Id INT PRIMARY KEY IDENTITY,
  PlateNumber VARCHAR(50),
  Manufacturer VARCHAR(50),
  Model VARCHAR(50),
  CarYear DATE,
  CategoryId INT,
  Doors SMALLINT,
  Picture VARBINARY(MAX),
  Condition VARCHAR(50),
  Available BIT
); 

INSERT INTO Cars (PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Condition, Available)
VALUES
('CO-1213-BM', '1HGBH41JXMN109189', 'XC-90', '2012-01-01', 1, 4, 'Good', 0),
('CO-1314-BM', '1HGBH41JXMN109190', 'XC-60', '2012-01-01', 1, 4, 'Very Good', 0),
('CO-1213-BM', '1HGBH41JXMN109191', 'XC-40', '2012-01-01', 1, 4, 'Good', 0)


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
('Peter', 'Petrov', 'Worker'),
('Ivan', 'Ivanov', 'Manager'),
('Peter', 'Petrov', 'Driver')


CREATE TABLE Customers   
( 
  Id INT PRIMARY KEY IDENTITY,
  DriverLicenceNumber INT,
  FullName  VARCHAR(50) NOT NULL,
  [Address] VARCHAR(50) NOT NULL,
  City VARCHAR(50) NOT NULL,
  ZIPCode INT NOT NULL,
  Notes VARCHAR(MAX)
); 

INSERT INTO Customers (FullName, [Address], City, ZIPCode)
VALUES
('Peter Ivanov', 'Sofia 52', 'Sofia', 2000),
('Ivan Ivanov', 'Sofia 53', 'Sofia', 2000),
('Dimitar Ivanov', 'Sofia 54', 'Sofia', 2000)

CREATE TABLE RentalOrders   
( 
  Id INT PRIMARY KEY IDENTITY,
  EmployeeId INT NOT NULL,
  CustomerId INT NOT NULL,
  CarId INT NOT NULL,
  TankLevel INT NOT NULL,
  KilometrageStart INT NOT NULL,
  KilometrageEnd INT NOT NULL,
  TotalKilometrage INT NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  TotalDays INT NOT NULL,
  RateApplied INT,
  TaxRate INT,
  OrderStatus VARCHAR(50),
   Notes VARCHAR(MAX)
);

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays)
VALUES 
(1,2,3,40,102000, 104000, 2000, '2022-01-01', '2022-04-01', 90),
(3,4,5,20,104000, 106000, 2000, '2022-05-01', '2022-08-01', 90),
(4,5,6,45,106000, 108000, 2000, '2022-08-01', '2022-11-01', 90)