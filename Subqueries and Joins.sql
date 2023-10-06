-- Problem 01

GO

USE [SoftUni]

GO

SELECT TOP(5)
           [Employees].[EmployeeID],
           [Employees].[JobTitle],
	       [Addresses].[AddressID],
	       [Addresses].[AddressText]
      FROM [Employees]
      JOIN [Addresses] ON [Employees].AddressID = [Addresses].[AddressID]
  ORDER BY [Addresses].AddressID

-- Problem 02
    SELECT TOP (50)
           [Employees].[FirstName],
           [Employees].[LastName],
	       [Towns].[Name] AS [Town],
	       [Addresses].[AddressText]
      FROM [Employees]
      JOIN [Addresses] ON [Employees].AddressID = [Addresses].[AddressID]
	  JOIN [Towns] ON [Addresses].TownID = [Towns].TownID
  ORDER BY [FirstName], [LastName]

-- Problem 03
SELECT [E].[EmployeeID],
       [E].[FirstName],
	   [E].[LastName],
	   [D].[Name] AS [DepartmentName]
  FROM [Employees] AS [E]
  JOIN [Departments] AS [D] ON [E].DepartmentID = [D].DepartmentID
 WHERE [D].[Name] = 'Sales' 

 -- Problem 04
   SELECT TOP (5)
          [E].[EmployeeID],
          [E].[FirstName],	
	      [E].[Salary],
	      [D].[Name] AS [DepartmentName]
     FROM [Employees] AS [E]
     JOIN [Departments] AS [D] ON [E].DepartmentID = [D].DepartmentID
    WHERE [E].[Salary] > 15000
 ORDER BY [E].[DepartmentID]

 -- Problem 05
 SELECT TOP (3)
           [E].[EmployeeID],
		   [E].[FirstName]
      FROM [Employees] AS [E]
 LEFT JOIN [EmployeesProjects] AS [EP] ON [E].[EmployeeID] = [EP].EmployeeID
 LEFT JOIN [Projects] AS [P] ON [EP].[ProjectID] = [P].ProjectID
     WHERE [P].[ProjectID] IS NULL

 -- Problem 06
    SELECT   
		   [E].[FirstName],
		   [E].[LastName],
		   [E].[HireDate],
		   [D].[Name] AS [DeptName]
      FROM [Employees] AS [E]
	  LEFT JOIN [Departments] AS [D] ON [E].DepartmentID = [D].[DepartmentID]
	 WHERE [HireDate] > '1999-01-01' AND [D].[Name] IN ('Sales', 'Finance')

-- Problem 07
SELECT TOP (5)
           [E].[EmployeeID],
		   [E].[FirstName],
		   [P].[Name] AS [ProjectName]
      FROM [Employees] AS [E]
 LEFT JOIN [EmployeesProjects] AS [EP] ON [E].[EmployeeID] = [EP].EmployeeID
 LEFT JOIN [Projects] AS [P] ON [EP].[ProjectID] = [P].ProjectID
     WHERE [P].[StartDate] > '2002-08-13' AND [P].[EndDate] IS NULL
  ORDER BY [E].[EmployeeID]

-- Problem 08
    SELECT     
           [E].[EmployeeID],
		   [E].[FirstName],
    CASE 
           WHEN  DATEPART(YEAR, [p].[StartDate]) >= '2005' THEN NULL
		   ELSE [P].[Name]
    END AS [ProjectName]
      FROM [Employees] AS [E]
 LEFT JOIN [EmployeesProjects] AS [EP] ON [E].[EmployeeID] = [EP].EmployeeID
 LEFT JOIN [Projects] AS [P] ON [EP].[ProjectID] = [P].ProjectID
     WHERE [E].[EmployeeID] = 24

-- Problem 09
SELECT [E].[EmployeeID],
       [E].[FirstName],
	   [E].[ManagerID],
	   [M].[FirstName] AS [ManagerName]
  FROM [Employees] AS [E]
  JOIN [Employees] AS [M] ON [E].[ManagerID] = [M].[EmployeeID]
 WHERE [E].[ManagerID] IN (3,7)

-- Problem 10
  SELECT TOP (50)
         [E].[EmployeeID],
         CONCAT([E].[FirstName], ' ', [E].[LastName]) AS [EmployeeName],
	     CONCAT([M].[FirstName], ' ', [M].[LastName]) AS [ManagerName],
	     [D].[Name] AS [DepartmentName]
    FROM [Employees] AS [E]
    JOIN [Employees] AS [M] ON [E].[ManagerID] = [M].[EmployeeID]
    JOIN [Departments] AS [D] ON [E].[DepartmentID] = [D].DepartmentID
ORDER BY [E].[EmployeeID]

-- Problem 11
  SELECT TOP (1) 
           AVG([E].[Salary]) AS 'MinAverageSalary'
          FROM [Employees] AS [E]
      GROUP BY [E].[DepartmentID]
  ORDER BY AVG([E].[Salary])

 -- Problem 12
GO

USE [Geography]

GO

   SELECT [C].[CountryCode],
          [M].[MountainRange],
	      [P].[PeakName],
	      [P].[Elevation]
     FROM [Countries] AS [C]
LEFT JOIN [MountainsCountries] AS [MC] ON [C].[CountryCode] = [MC].CountryCode
LEFT JOIN [Mountains] AS [M] ON [MC].MountainId = [M].[Id]
LEFT JOIN [Peaks] AS [P] ON [M].[Id] = [P].[MountainId]
    WHERE [P].[Elevation] > 2835 AND [C].CountryName = 'Bulgaria'
 ORDER BY [P].[Elevation] DESC

  -- Problem 13
  SELECT  [C].[CountryCode],
          COUNT([M].[MountainRange]) AS [MountainRanges]
     FROM [Countries] AS [C]
LEFT JOIN [MountainsCountries] AS [MC] ON [C].[CountryCode] = [MC].CountryCode
LEFT JOIN [Mountains] AS [M] ON [MC].MountainId = [M].[Id]
    WHERE [C].[CountryName] IN ('United States', 'Russia', 'Bulgaria')
 GROUP BY [C].[CountryCode]
   
  -- Problem 14
    SELECT TOP (5)
               [C].[CountryName],
		       [R].[RiverName]         
          FROM [Countries] AS [C]
	 LEFT JOIN [CountriesRivers] AS [CR] ON [C].[CountryCode] = [CR].[CountryCode]
	 LEFT JOIN [Rivers] AS [R] ON [CR].[RiverId] = [R].[Id]
	 LEFT JOIN [Continents] AS [CO] ON [C].ContinentCode = [CO].[ContinentCode]
	     WHERE [CO].ContinentName = 'Africa'
	  ORDER BY [C].[CountryName]
  
   -- Problem 15
   SELECT [TableOne].[ContinentCode], [TableOne].[CurrencyCode], [TableOne].[CurrencyUsage] 
   FROM 
   (
   SELECT [C].[ContinentCode] ,[C].[CurrencyCode], COUNT(*) AS 'CurrencyUsage'
   FROM [Countries] AS [C]
   WHERE [C].[CurrencyCode] IS NOT NULL
   GROUP BY [C].[ContinentCode] ,[C].[CurrencyCode]
   HAVING COUNT([C].[CurrencyCode]) > 1
   ) AS [TableOne]
   INNER JOIN 
   (SELECT [currencies].[ContinentCode], MAX([currencies].[CurrencyUsage]) AS [MaxUsage] 
   FROM 
   		(
   		SELECT [C].[ContinentCode] ,[C].[CurrencyCode], COUNT(*) AS 'CurrencyUsage'
   		FROM [Countries] AS [C]
   		WHERE [C].[CurrencyCode] IS NOT NULL
   		GROUP BY [C].[ContinentCode] ,[C].[CurrencyCode]
   		HAVING COUNT([C].[CurrencyCode]) > 1
   		) AS [currencies]
   GROUP BY [currencies].[ContinentCode]
   ) AS [TableTwo]
   ON [TableOne].[ContinentCode] = [TableTwo].[ContinentCode] AND [TableOne].[CurrencyUsage] = [TableTwo].[MaxUsage]
   ORDER BY [TableOne].[ContinentCode]

 -- Problem 16
SELECT COUNT(*) AS [CountryCount]
FROM [Countries] AS [C]
LEFT JOIN [MountainsCountries] AS [MC]
ON [C].[CountryCode] = [MC].[CountryCode]
WHERE [MC].[CountryCode] IS NULL;

-- Problem 17
SELECT TOP 5 [c].[CountryName],
         MAX([p].[Elevation]) 
		  AS [HighestPeakElevation],
         MAX([r].[Length]) 
		  AS [LongestRiverLength]
        FROM [Countries] 
		  AS [c]
   LEFT JOIN [MountainsCountries] AS [mc] ON [c].[CountryCode] = [mc].[CountryCode]
   LEFT JOIN [Peaks] AS [p] ON [p].[MountainId] = [mc].[MountainId]
   LEFT JOIN [CountriesRivers] AS [cr] ON [c].[CountryCode] = [cr].[CountryCode]
   LEFT JOIN [Rivers] AS [r] ON [r].Id = [cr].[RiverId]
    GROUP BY [c].[CountryName]
    ORDER BY [HighestPeakElevation] DESC, 
	         [LongestRiverLength] DESC, 
			 [c].[CountryName]

-- Problem 18
WITH [PeaksMountains_CTE] ([Country], [PeakName], [Elevation], [Mountain]) AS (

  SELECT [c].[CountryName], [p].[PeakName], [p].[Elevation], [m].[MountainRange]
  FROM [Countries] AS [c]
  LEFT JOIN [MountainsCountries] as [mc] ON [c].[CountryCode] = [mc].[CountryCode]
  LEFT JOIN [Mountains] AS [m] ON [mc].[MountainId] = [m].[Id]
  LEFT JOIN [Peaks] AS [p] ON [p].[MountainId] = [m].[Id]
)

SELECT TOP 5
  [TopElevations].[Country] AS [Country],
  ISNULL([pm].[PeakName], '(no highest peak)') AS [HighestPeakName],
  ISNULL([TopElevations].[HighestElevation], 0) AS [HighestPeakElevation],	
  ISNULL([pm].[Mountain], '(no mountain)') AS [Mountain]
FROM 
  (SELECT [Country], MAX([Elevation]) AS [HighestElevation]
   FROM [PeaksMountains_CTE] 
   GROUP BY [Country]) AS [TopElevations]
LEFT JOIN [PeaksMountains_CTE] AS [pm]
ON ([TopElevations].[Country] = [pm].[Country] AND [TopElevations].[HighestElevation] = [pm].[Elevation])
ORDER BY [Country], [HighestPeakName] 
   