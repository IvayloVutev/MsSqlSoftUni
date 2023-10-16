GO
USE [SoftUni]
GO

--Problem 001
CREATE PROCEDURE [usp_GetEmployeesSalaryAbove35000] 
              AS
               SELECT [FirstName],
                      [LastName]
                 FROM [Employees]
                WHERE [Salary] > 35000

 EXEC [usp_GetEmployeesSalaryAbove35000]

 --Problem 002
 CREATE PROCEDURE [usp_GetEmployeesSalaryAboveNumber] @minSalary DECIMAL(18,4)
			  AS
			   BEGIN
			     SELECT [FirstName],
                        [LastName]
                   FROM [Employees]
                  WHERE [Salary] >= @minSalary
			     END

 EXEC [usp_GetEmployeesSalaryAboveNumber] 48100

 --Problem 003
CREATE OR ALTER PROCEDURE [usp_GetTownsStartingWith](@searchedString NVARCHAR(50))
         AS
          BEGIN
              DECLARE @stringCount int = LEN(@searchedString)
                  SELECT [Name] 
		 		   FROM [Towns]
              WHERE LEFT([Name],@stringCount) = @searchedString
            END
		  
EXEC [usp_GetTownsStartingWith] 'b'

--Problem 004
CREATE PROCEDURE [usp_GetEmployeesFromTown] @townName VARCHAR(50)
       AS
	    BEGIN
	        SELECT [E].[FirstName],
	    	       [E].[LastName]
	    	  FROM [Employees]
	    	    AS [E]
	     LEFT JOIN [Addresses]
	            AS [A]
	    		ON [E].AddressID = [A].[AddressID]
         LEFT JOIN [Towns]
	            AS [T]
	    		ON [A].[TownID] = [T].[TownID]
	    	 WHERE [T].[Name] = @townName
	    END

EXEC [usp_GetEmployeesFromTown] 'Sofia'

--Problem 005
CREATE FUNCTION [ufn_GetSalaryLevel] (@Salary MONEY)
RETURNS VARCHAR(10)
    AS
	 BEGIN
             DECLARE @salaryLevel VARCHAR(10)
             IF (@salary < 30000)
            	 SET @salaryLevel = 'Low';
             ELSE IF (@salary BETWEEN 30000 AND 50000)
            	 SET @salaryLevel = 'Average';
             ELSE
            	 SET @salaryLevel = 'High';
             RETURN @salaryLevel
	 END 
	
  --  SELECT [Salary], 
  --         [dbo].[ufn_GetSalaryLevel]([Salary]) AS [Salary Level]
  --    FROM [Employees]
  --ORDER BY [Salary]
  --    DESC

  --Problem 006
  CREATE PROCEDURE [usp_EmployeesBySalaryLevel] @SalaryLevel VARCHAR(10)
        AS
         BEGIN
		     SELECT [FirstName],
			        [LastName]
			   FROM [Employees]
			  WHERE [dbo].[ufn_GetSalaryLevel](Salary) = @SalaryLevel			   
           END

		 
--Problem 007
GO
CREATE FUNCTION [ufn_IsWordComprised](@setOfLetters VARCHAR(max), @word VARCHAR(max))
RETURNS BIT
AS
  BEGIN
    DECLARE @isComprised BIT = 0;
    DECLARE @currentIndex INT = 1;
    DECLARE @currentChar CHAR;
  
    WHILE(@currentIndex <= LEN(@word))
    BEGIN
  
      SET @currentChar = SUBSTRING(@word, @currentIndex, 1);
      IF(CHARINDEX(@currentChar, @setOfLetters) = 0)
        RETURN @isComprised;
      SET @currentIndex += 1;
  
    END

  RETURN @isComprised + 1;

END
GO

--Problem 008
GO

CREATE PROC [usp_DeleteEmployeesFromDepartment] (@departmentId INT)
AS
 ALTER TABLE [Departments]
 ALTER COLUMN [ManagerID] INT NULL
 
 DELETE FROM [EmployeesProjects]
 WHERE [EmployeeID] IN (
 						SELECT [EmployeeID] FROM [Employees]
 						WHERE [DepartmentID] = @departmentId
 					)
 
 UPDATE [Employees]
 SET [ManagerID] = NULL
 WHERE [ManagerID] IN (
 						SELECT [EmployeeID] FROM [Employees]
 						WHERE [DepartmentID] = @departmentId
 				   )
 
 
 UPDATE [Departments]
 SET [ManagerID] = NULL
 WHERE [ManagerID] IN (
 						SELECT [EmployeeID] FROM [Employees]
 						WHERE [DepartmentID] = @departmentId
 				   )
 
 DELETE FROM [Employees]
 WHERE [EmployeeID] IN (
 						SELECT [EmployeeID] FROM [Employees]
 						WHERE [DepartmentID] = @departmentId
 				    )
 
 DELETE FROM [Departments]
 WHERE [DepartmentID] = @departmentId
 SELECT COUNT(*) AS [Employees Count] FROM Employees AS e
 JOIN [Departments] AS [d]
 ON [d].[DepartmentID] = [e].[DepartmentID]
 WHERE [e].[DepartmentID] = @departmentId

GO

--Problem 009
GO 
USE [Bank]
GO 

CREATE PROC usp_GetHoldersFullName
AS
  SELECT CONCAT([FirstName], ' ', [LastName]) AS [Full Name]
  FROM [AccountHolders]


EXEC usp_GetHoldersFullName

--Problem 010
CREATE PROC usp_GetHoldersWithBalanceHigherThan(@number DECIMAL(13,2)) AS 
SELECT [FirstName],[LastName]
  FROM [AccountHolders] AS [ah]
  JOIN [Accounts] AS [a] ON [ah].[Id] = [a].[AccountHolderId]
 GROUP BY [FirstName],[LastName]
 HAVING SUM ([a].[Balance]) > @number
 ORDER BY [ah].[FirstName], [ah].[LastName];

 EXEC dbo.usp_GetHoldersWithBalanceHigherThan 200

--Problem 011
CREATE FUNCTION ufn_CalculateFutureValue (@sum money, @annualIntRate float, @years int)
RETURNS money
AS
BEGIN

  RETURN @sum * POWER(1 + @annualIntRate, @years);  

END;

--Problem 012
CREATE PROC usp_CalculateFutureValueForAccount (@accountId int, @interestRate float)
AS
BEGIN
  DECLARE @years int = 5;

  SELECT
    [a].[Id] AS [Account Id],
    [ah].[FirstName] AS [First Name],
    [ah].[LastName] AS [Last Name], 
    [a].[Balance] AS [Current Balance],
    dbo.ufn_CalculateFutureValue(a.Balance, @interestRate, @years) AS [Balance in 5 years]
  FROM [AccountHolders] AS [ah]
  JOIN Accounts AS [a] ON [ah].[Id] = [a].[AccountHolderId]
  WHERE [a].[Id] = @accountId

END

--Problem 013

GO 
USE Diablo

CREATE FUNCTION ufn_CashInUsersGames (@gameName nvarchar(50))
RETURNS table
AS
RETURN (
  WITH CTE_CashInRows (Cash, RowNumber) AS (
    SELECT [ug].[Cash], ROW_NUMBER() OVER (ORDER BY [ug].[Cash] DESC)
    FROM [UsersGames] AS [ug]
    JOIN [Games] AS [g] ON [ug].[GameId] = [g].[Id]
    WHERE [g].[Name] = @gameName
  )
  SELECT SUM([Cash]) AS [SumCash]
  FROM CTE_CashInRows
  WHERE [RowNumber] % 2 = 1 
)
