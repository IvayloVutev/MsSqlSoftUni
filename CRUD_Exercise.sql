USE [SoftUni]
-- Problem 2
SELECT *
  FROM [Departments]

-- Problem 3
SELECT [Name]
  FROM [Departments]

-- Problem 4
SELECT [FirstName],
       [LastName],
	   [Salary]
  FROM [Employees]

-- Problem 5
SELECT [FirstName],
       [MiddleName],
       [LastName]	   
  FROM [Employees]

-- Problem 6
SELECT CONCAT([FirstName], '.', [LastName],  '@', 'softuni.bg') AS [Full Email Address]
  FROM [Employees]

-- Problem 7
    SELECT [Salary]	   
      FROM [Employees]
  GROUP BY [Salary]

-- Problem 8
SELECT *	   
  FROM [Employees]
 WHERE [JobTitle] = 'Sales Representative'

-- Problem 9
SELECT [FirstName], [LastName], [JobTitle]	   
  FROM [Employees]
 WHERE [Salary] >= 20000 AND [Salary] <= 30000

-- Problem 10
SELECT CONCAT([FirstName], ' ', [MiddleName], ' ',[LastName]) AS [Full Name]
         FROM [Employees]
        WHERE [Salary] IN (25000, 14000, 12500, 23600)

-- Problem 11
SELECT [FirstName], 
       [LastName]	   
  FROM [Employees]
 WHERE [ManagerID] IS NULL

-- Problem 12
  SELECT [FirstName], 
         [LastName], 
         [Salary]	   
    FROM [Employees]
   WHERE [Salary] > 50000
ORDER BY [Salary] DESC

-- Problem 13
 SELECT TOP (5) 
            [FirstName],
			[LastName]
       FROM [Employees]
   ORDER BY [Salary] DESC

-- Problem 14
  SELECT [FirstName], 
         [LastName]          
    FROM [Employees]
   WHERE [DepartmentID] != 4
  
-- Problem 15
   SELECT *          
    FROM [Employees]
ORDER BY [Salary] DESC,
         [FirstName],
		 [LastName] DESC,
		 [MiddleName]

-- Problem 16
GO
  CREATE VIEW [V_EmployeesSalaries] AS
       SELECT [FirstName], 
              [LastName],
	     	  [Salary]
         FROM [Employees]
GO

-- Problem 17
GO
   CREATE VIEW [V_EmployeeNameJobTitle] AS
 SELECT CONCAT([FirstName], ' ', [MiddleName], ' ',[LastName]) AS [Full Name],
               [JobTitle]
          FROM [Employees]
GO

-- Problem 18
      SELECT [JobTitle]      
        FROM [Employees]
	GROUP BY [JobTitle]

-- Problem 19
SELECT TOP (10) *
      FROM [Projects]
  ORDER BY [StartDate],
           [Name]

-- Problem 20
SELECT TOP (7)
           [FirstName],
		   [LastName],
		   [HireDate]
      FROM [Employees]
  ORDER BY [HireDate] DESC

-- Problem 21
SELECT * 
 FROM [Departments]
WHERE [Name] IN ('Engineering', 'Tool Design', 'Marketing ', 'Information Services')

UPDATE [Employees]
   SET [Salary] *= 1.12
 WHERE [DepartmentID] IN (1, 2, 4, 11)

SELECT [Salary]
  FROM [Employees]


-- Problem 22
USE [Geography]

  SELECT [PeakName]
    FROM [Peaks]
ORDER BY [PeakName]

-- Problem 23
  SELECT TOP (30)
         [CountryName],
         [Population]
    FROM [Countries]
	WHERE[ContinentCode] = 'EU'
ORDER BY [Population] DESC

-- Problem 24
   SELECT 
         [CountryName],
	     [CountryCode],
	     (CASE 
	      WHEN [CurrencyCode] = 'EUR' THEN 'Euro'
	      ELSE 'Not Euro'
	      END) AS [Currency]
    FROM [Countries]
ORDER BY [CountryName]

-- Problem 25

USE [Diablo]

  SELECT [Name]
    FROM [Characters]
ORDER BY [Name]