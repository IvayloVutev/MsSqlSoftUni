GO
USE [Gringotts]
GO


--Problem 001
SELECT COUNT(*)
  FROM [WizzardDeposits]

--Problem 002
SELECT MAX([MagicWandSize]) 
        AS [LongestMagicWand]
      FROM [WizzardDeposits]

--Problem 003
     SELECT [DepositGroup],
	    MAX([MagicWandSize]) 
		 AS [LongestMagicWand]      
       FROM [WizzardDeposits]
   GROUP BY [DepositGroup]

 --Problem 004
    SELECT TOP (2)
		       [DepositGroup]
          FROM [WizzardDeposits]
      GROUP BY [DepositGroup]
 ORDER BY  AVG([MagicWandSize]) 

 --Problem 005
     SELECT [DepositGroup],
	    SUM([DepositAmount]) 
		 AS [TotalSum]      
       FROM [WizzardDeposits]
   GROUP BY [DepositGroup]
  
  --Problem 006
     SELECT [DepositGroup],
	    SUM([DepositAmount]) 
		 AS [TotalSum]      
       FROM [WizzardDeposits]
	  WHERE [MagicWandCreator] = 'Ollivander family'
   GROUP BY [DepositGroup]

  --Problem 007
       SELECT [DepositGroup],
	      SUM([DepositAmount]) 
		   AS [TotalSum]      
         FROM [WizzardDeposits]
	    WHERE [MagicWandCreator] = 'Ollivander family'
     GROUP BY [DepositGroup]
   HAVING SUM([DepositAmount]) < 150000
 ORDER BY SUM([DepositAmount]) DESC

 --Problem 008     
  SELECT [DepositGroup], 
         [MagicWandCreator], 
     MIN([DepositCharge]) 
      AS [MinDepositCharge] 
    FROM [WizzardDeposits]
GROUP BY [DepositGroup], [MagicWandCreator]
ORDER BY [MagicWandCreator], [DepositGroup]

 --Problem 009
 SELECT [ageGroups].[AgeGroup], 
 COUNT(*) AS [WizardCount] 
 FROM
       (
			SELECT 
			CASE
			WHEN [Age] BETWEEN 0 AND 10 THEN '[0-10]'
			WHEN [Age] BETWEEN 11 AND 20 THEN '[11-20]'
			WHEN [Age] BETWEEN 21 AND 30 THEN '[21-30]'
			WHEN [Age] BETWEEN 31 AND 40 THEN '[31-40]'
			WHEN [Age] BETWEEN 41 AND 50 THEN '[41-50]'
			WHEN [Age] BETWEEN 51 AND 60 THEN '[51-60]'
			WHEN [Age] >= 61 THEN '[61+]'
			END AS [AgeGroup]
			FROM [WizzardDeposits]
      ) AS [ageGroups]
  GROUP BY [ageGroups].[AgeGroup]

 --Problem 010
   SELECT LEFT([FirstName],1) AS [FirstLetter]
          FROM [WizzardDeposits]
         WHERE [DepositGroup] = 'Troll Chest'
 GROUP BY LEFT([FirstName],1)
 ORDER BY LEFT([FirstName],1)

 --Problem 011
   SELECT [DepositGroup], 
          [IsDepositExpired], 
      AVG([DepositInterest]) AS 
	      [AverageInterest]
     FROM [WizzardDeposits]
    WHERE [DepositStartDate] > '1985/01/01'
 GROUP BY [DepositGroup], [IsDepositExpired]
 ORDER BY [DepositGroup] DESC, [IsDepositExpired]  
 
 --Problem 012
SELECT TOP (1)
       SUM([W].[Difference]) OVER () AS [SumDifference]
FROM (
    SELECT [WDMain].[FirstName] AS [Host Wizard],
           [WDMain].[DepositAmount] AS [Host Wizard Deposit],
           [S].[FirstName] AS [Guest Wizard],
           [S].[DepositAmount] AS [Guest Wizard Deposit],
           [WDMain].[DepositAmount] - [S].[DepositAmount] AS [Difference]
    FROM [WizzardDeposits] AS [WDMain]
    JOIN [WizzardDeposits] AS [S] ON [WDMain].[Id] + 1 = [S].[Id]
) AS [W];

 --Problem 013
GO
USE [SoftUni]
GO

  SELECT [DepartmentID],
     SUM([Salary]) 
	  AS [TotalSalary]
    FROM [Employees]
GROUP BY [DepartmentID]
ORDER BY [DepartmentID]

 --Problem 014
   SELECT [DepartmentID],
      MIN([Salary]) 
	   AS [MinimumSalary]
     FROM [Employees]
	WHERE [DepartmentID] IN (2,5,7) AND [HireDate] > '2000-01-01'
 GROUP BY [DepartmentID]

 --Problem 015
 SELECT *
  INTO [Employees2] 
  FROM [Employees]
 WHERE [Salary] > 30000

 DELETE FROM [Employees2] 
       WHERE [ManagerID] = 42

 UPDATE [Employees2]
    SET [Salary] += 5000
  WHERE [DepartmentID] = 1

     SELECT [DepartmentID],
        AVG([Salary]) AS 
		    [AverageSalary]
       FROM [Employees2]
   GROUP BY [DepartmentID]

 --Problem 016
	SELECT [DepartmentID],
       MAX([Salary]) AS 
	       [MaxSalary]
      FROM [Employees]
  GROUP BY [DepartmentID] 
 HAVING MAX(Salary) NOT BETWEEN 30000 AND 70000     
 
 --Problem 017
 SELECT COUNT([Salary]) 
           AS [Count] 
         FROM [Employees]
        WHERE [ManagerID] IS NULL 

--Problem 018
SELECT [Salaries].[DepartmentID], 
       [Salaries].[Salary] 
FROM
         (
           SELECT [DepartmentId],
              MAX([Salary]) 
			   AS [Salary],
         DENSE_RANK() OVER (PARTITION BY [DepartmentId] ORDER BY [Salary] DESC) 
		       AS [Rank]
             FROM [Employees]
         GROUP BY [DepartmentID], 
		          [Salary]
         )     AS [Salaries] 
WHERE [Rank]=3

--Problem 019
SELECT TOP 10 [FirstName], 
              [LastName], 
              [DepartmentID] 
         FROM [Employees] 
           AS [emp1]
        WHERE [Salary] >
                (SELECT AVG([Salary]) 
				       FROM [Employees] 
				         AS [emp2]
                      WHERE [emp1].[DepartmentID] = [emp2].[DepartmentID]
                   GROUP BY [DepartmentID])
ORDER BY [DepartmentID]