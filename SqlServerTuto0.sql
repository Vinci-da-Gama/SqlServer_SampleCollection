-- Create a new table called 'Customer_0' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Customer_0', 'U') IS NOT NULL
DROP TABLE dbo.Customer_0
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Customer_0
(
    Id INT NOT NULL PRIMARY KEY identity(1,1), -- primary key column
    Name [NVARCHAR](50) NOT NULL,
    Title [NVARCHAR](50) NOT NULL,
    Sold_Amount decimal NOT NULL
    -- specify more columns here
);
GO

-- Insert rows into table 'Customer_0'
INSERT INTO Customer_0
( -- columns to insert data into
 [Name], [Title], [Sold_Amount]
)
VALUES
( -- first row: values for the columns in the list above
 'John', 'Title_'+CONVERT(nvarchar(16), @@IDENTITY), 250000
),
( -- first row: values for the columns in the list above
 'Many', 'Title_'+CONVERT(nvarchar(16), @@IDENTITY), 190000
),
( -- first row: values for the columns in the list above
 'Tom', 'Title_'+CONVERT(nvarchar(16), @@IDENTITY), 110000
),
( -- first row: values for the columns in the list above
 'Alex', 'Title_'+CONVERT(nvarchar(16), @@IDENTITY), 70000
),
( -- first row: values for the columns in the list above
 'Bob', 'Title_'+CONVERT(nvarchar(16), @@IDENTITY), 300000
)
-- add more rows here
GO

--Manully
-- SELECT Name as 'First-Name', Title as 'Employee-Title', [Sold_Amount] as 'MoneyEarned', [Sold_Amount]*.67 AS 'Real Income', [Sold_Amount]*.33 AS 'Tax Paid' from Customer_0
-- WHERE Sold_Amount*.67 NOT between 170000 AND 250000
-- ORDER by Title DESC, Sold_Amount*.67 ASC

--SQL_Designer
SELECT        Sold_Amount AS [Money Earned], Title AS [Employee Title], Name AS [First Name]
FROM            Customer_0
WHERE        ([Sold_Amount] < N'200000') OR (Sold_Amount > N'100000')
ORDER BY [Money Earned], [First Name] DESC


-- Create a new table called 'Customer_1' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Customer_1', 'U') IS NOT NULL
DROP TABLE dbo.Customer_1
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Customer_1
(
    Customer_1Id INT NOT NULL PRIMARY KEY IDENTITY(1, 1), -- primary key column
    [Name] [NVARCHAR](50) NOT NULL,
    [Total_Sold] MONEY NOT NULL
    -- specify more columns here
);
GO

-- Insert rows into table 'Customer_1'
INSERT INTO Customer_1
( -- columns to insert data into
 [Name], [Total_Sold]
)
VALUES
(
    -- first row: values for the columns in the list above
    'Mary', cast(1500000.0000 AS Money)
),
(
    -- second row: values for the columns in the list above
    'John', cast(2400000.0000 AS Money)
),
(
    'Micky', cast(1200000.0000 AS Money)
)
-- add more rows here
GO

-- Create a new table called 'Customer2' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Customer2', 'U') IS NOT NULL
DROP TABLE dbo.Customer2
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Customer2
(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    Name [NVARCHAR](50) NOT NULL,
    DateHired Date NOT NULL,
    Salary Money NOT NULL
    -- specify more columns here
);
GO

-- Insert rows into table 'Customer2'
INSERT INTO Customer2
( -- columns to insert data into
 [Name], [DateHired], [Salary]
)
VALUES
( -- first row: values for the columns in the list above
 'John', GETDATE()-100, 650000.0000
),
( -- second row: values for the columns in the list above
 'Jack', GETDATE()-122, 750000.0000
),
( -- second row: values for the columns in the list above
 'Jash', GETDATE()-2, 200000.0000
)
-- add more rows here
GO


-- Create a new table called 'Customers0' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Customers0', 'U') IS NOT NULL
DROP TABLE dbo.Customers0
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Customers0
(
    CustId INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- primary key column
    Customer_Name [NVARCHAR](50) NOT NULL,
    orderId Int NOT NULL
    -- specify more columns here
);
GO

-- Create a new table called 'OrderDetails0' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.OrderDetails0', 'U') IS NOT NULL
DROP TABLE dbo.OrderDetails0
GO
-- Create the table in the specified schema
CREATE TABLE dbo.OrderDetails0
(
    orderId INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- primary key column
    Item_Name [NVARCHAR](50) NOT NULL,
    Number_Bought Int NOT NULL, 
    Single_Price DECIMAL NOT NULL
    -- specify more columns here
);
GO

-- Insert rows into table 'Customers0'
USE [CodeFirst_DBTest2]
GO
INSERT INTO Customers0
( -- columns to insert data into
 [Customer_Name], [orderId]
)
VALUES
( -- first row: values for the columns in the list above
 'John', 1
),
( -- second row: values for the columns in the list above
 'Jack', 2
),
( -- second row: values for the columns in the list above
 'Jaspal', 3
)
-- add more rows here
GO

-- Insert rows into table 'OrderDetails0'
USE [CodeFirst_DBTest2]
GO
INSERT INTO dbo.OrderDetails0
( -- columns to insert data into
 [Item_Name], [Number_Bought], [Single_Price]
)
VALUES
( -- first row: values for the columns in the list above
 'Item3', 6, 66.66
)
--,
--( 
--	'Item3', 6, 66.66
--)
-- add more rows here
GO


-- Update rows in table 'OrderDetails0'
USE [CodeFirst_DBTest2]
GO
UPDATE dbo.OrderDetails0
SET
    [Item_Name] = 'Item_3+1'
    -- add more columns and values here
WHERE orderId = 3
GO


-- Inner Join
USE [CodeFirst_DBTest2]
GO
-- Select rows from a Table or View 'Customers0' in schema 'dbo'
SELECT c0.[Customer_Name], o0.Item_Name, o0.Number_Bought, o0.Single_Price, o0.Number_Bought*o0.Single_Price AS 'Total_Price' INTO CoInner
FROM dbo.Customers0 c0 INNER JOIN dbo.OrderDetails0 o0
On c0.orderId = o0.orderId
GO



-- left Join
USE [CodeFirst_DBTest2]
GO
-- Select rows from a Table or View 'Customers0' in schema 'dbo'
SELECT c0.[Customer_Name], o0.Item_Name, o0.Number_Bought, o0.Single_Price, o0.Number_Bought*o0.Single_Price AS 'Total_Price' INTO CoLeft
FROM dbo.Customers0 c0 LEFT OUTER JOIN dbo.OrderDetails0 o0
ON c0.orderId = o0.orderId
GO


-- Right Join
USE [CodeFirst_DBTest2]
GO
-- Select rows from a Table or View 'Customers0' in schema 'dbo'
SELECT c0.[Customer_Name], o0.Item_Name, o0.Number_Bought, o0.Single_Price, o0.Number_Bought*o0.Single_Price AS 'Total_Price' INTO CoRight
FROM dbo.Customers0 c0 Right OUTER JOIN dbo.OrderDetails0 o0
ON c0.orderId = o0.orderId
GO


-- full Join
USE [CodeFirst_DBTest2]
GO
-- Select rows from a Table or View 'Customers0' in schema 'dbo'
SELECT c0.[Customer_Name], o0.Item_Name, o0.Number_Bought, o0.Single_Price, o0.Number_Bought*o0.Single_Price AS 'Total_Price' INTO CoFull
FROM dbo.Customers0 c0 FULL OUTER JOIN dbo.OrderDetails0 o0
ON c0.orderId = o0.orderId
GO

USE [CodeFirst_DBTest2]
GO
-- Create a new table called 'ComputerInfo' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.ComputerInfo', 'U') IS NOT NULL
DROP TABLE dbo.ComputerInfo
GO
-- Create the table in the specified schema
CREATE TABLE dbo.ComputerInfo
(
    Tag INT NOT NULL, -- primary key column
    Parent Int NOT NULL,
    [Computers!1!] [NVARCHAR](50) NOT NULL,
    [Computer!2!brand] [NVARCHAR](50) NOT NULL,
    [Computer!2!harddiskname] [NVARCHAR](50) NOT NULL,
    [Computer!2!harddisksize] INT NOT NULL
);
GO


USE [CodeFirst_DBTest2]
GO
-- Select rows from a Table or View 'ComputerInfo' in schema 'dbo'
SELECT * FROM dbo.ComputerInfo
FOR XML explicit
GO


USE [CodeFirst_DBTest2]
GO

-- Create a new table called 'Customers1' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Customers1', 'U') IS NOT NULL
DROP TABLE dbo.Customers1
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Customers1
(
    cId INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- primary key column
    Customer_Name [NVARCHAR](50) NOT NULL,
    OrderId INT NOT NULL
    -- specify more columns here
);
GO


USE [CodeFirst_DBTest2]
GO
-- Create a new table called 'OrderDetails1' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.OrderDetails1', 'U') IS NOT NULL
DROP TABLE dbo.OrderDetails1
GO
-- Create the table in the specified schema
CREATE TABLE dbo.OrderDetails1
(
    OrderId INT NOT NULL PRIMARY KEY, -- primary key column
    Item_Name [NVARCHAR](70) NOT NULL,
    Number_Bought INT NOT NULL,
    Single_Price DECIMAL(6, 2) NOT NULL
    -- specify more columns here
);
GO

USE [CodeFirst_DBTest2]
GO
-- Insert rows into table 'Customers1'
INSERT INTO Customers1
( -- columns to insert data into
 [Customer_Name], [OrderId]
)
VALUES
( -- first row: values for the columns in the list above
    'John Smith', 1
),
( -- second row: values for the columns in the list above
    'Mary Smith', 2
),
( -- second row: values for the columns in the list above
    'Jaspal Neo', 3
)
-- add more rows here
GO

USE [CodeFirst_DBTest2]
GO
-- Insert rows into table 'OrderDetails1'
INSERT INTO OrderDetails1
( -- columns to insert data into
 OrderId, [Item_Name], [Number_Bought], [Single_Price]
)
VALUES
( -- first row: values for the columns in the list above
 1, 'item1', 3, 33.33
),
( -- second row: values for the columns in the list above
 2, 'item2', 6, 66.66
),
( -- second row: values for the columns in the list above
 5, 'item3', 9, 99.99
)
-- add more rows here
GO

USE [CodeFirst_DBTest2]
GO
-- Select rows from a Table or View 'Customers1' in schema 'dbo'
SELECT c1.Customer_Name, o1.Item_Name, o1.Number_Bought, o1.Single_Price FROM dbo.Customers1 c1 INNER JOIN OrderDetails1 o1 ON c1.OrderId = o1.OrderId
WHERE UPPER(c1.Customer_Name) IN ('John Smith', 'Mary Smith', 'Jaspal Neo')
GO


USE [CodeFirst_DBTest2]
GO
-- Create a new table called 'Name_Date' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Name_Date', 'U') IS NOT NULL
DROP TABLE dbo.Name_Date
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Name_Date
(
    ndId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name [NVARCHAR](50) NOT NULL,
    [Date_enrolled] DATE NOT NULL
);
GO

-- Insert rows into table 'Name_Date'
INSERT INTO Name_Date
( -- columns to insert data into
 [Name], [Date_enrolled]
)
VALUES
(
    'Sara', '2009-10-01'
),
( 
    'Sarah', '2007-10-05'
),
( 
    'Jenny', '2011-01-16'
),
( 
    'Alex', '2014-06-01'
),
( 
    'Sarea', '2017-10-03'
)
GO

USE [CodeFirst_DBTest2]
GO
-- Select rows from a Table or View 'Name_Date' in schema 'dbo'
SELECT * FROM dbo.Name_Date
WHERE (UPPER(Name) like('SAR%') AND DateDiff(year, [Date_enrolled], GETDATE())> 3)
GO

USE [CodeFirst_DBTest2]
GO
-- Create a new table called 'Comments' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Comments', 'U') IS NOT NULL
DROP TABLE dbo.Comments
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Comments
(
    CmtId INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- primary key column
    [Date_enrolled] Date NOT NULL,
    [Date Left] Date NOT NULL,
    [Comment Left 1] NVARCHAR(50) NOT NULL,
    [Comment Left 2] NVARCHAR(50) NOT NULL,
    [Money Spent] Money NOT NULL
);
GO

-- Insert rows into table 'Comments'
INSERT INTO Comments
( -- columns to insert data into
 [Date_enrolled], [Date Left], [Comment Left 1], [Comment Left 2], [Money Spent]
)
VALUES
(
    '2001-01-01', '2001-01-02', 'cl1Tell01', 'cl2Tell01+1', 33.33
),
(
    '2003-02-03', '2003-02-06', 'cl1Tell02', 'cl2Tell02+2', 36.77
),
(
    '2013-02-03', '2013-04-06', 'cl1Tell03', 'cl2Tell03+3', 66.76
),
(
    '2010-11-03', '2010-11-05', 'cl1Tell04', 'cl2Tell04+4', 96.36
),
(
    '2016-12-03', '2016-12-15', 'cl1Tell05', 'cl2Tell05+5', 46.33
)
GO

USE [CodeFirst_DBTest2]
GO
-- Select rows from a Table or View 'Comments' in schema 'dbo'
SELECT DateDiff(day, [Date_enrolled], [Date Left]) AS 'Time_Spent', 
FORMAT([Money Spent], 'C', 'en-us') AS 'Your_Spent', 
LOWER(RTRIM(LTRIM([Comment Left 1])))+ ' ' +LOWER(RTRIM(LTRIM([Comment Left 2]))) AS 'Comment'
FROM dbo.Comments
GO

USE [CodeFirst_DBTest2]
GO
-- Create a new table called 'SpendingHabit' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.SpendingHabit', 'U') IS NOT NULL
DROP TABLE dbo.SpendingHabit
GO
-- Create the table in the specified schema
CREATE TABLE dbo.SpendingHabit
(
    shId INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- primary key column
    Name [NVARCHAR](50) NOT NULL,
    Amount Money NOT NULL,
    [Date Saved] Date NOT NULL
    -- specify more columns here
);
GO

-- Insert rows into table 'SpendingHabit'
INSERT INTO SpendingHabit
( -- columns to insert data into
 [Name], [Amount], [Date Saved]
)
VALUES
(
    'John', 23.0000, '2015-10-07'
),
(
    'John', 25.0000, '2015-10-17'
),
(
    'John', 19.0000, '2015-11-15'
),
(
    'Mary', 25.0000, '2016-07-15'
),
(
    'Mary', 56.0000, '2016-08-02'
),
(
    'Mary', 67.0000, '2016-10-03'
)
GO


USE [CodeFirst_DBTest2]
GO
-- Select rows from a Table or View 'SpendingHabit' in schema 'dbo'
SELECT Name, Amount, [Date Saved] AS 'Date_Saved', SUM(Amount) OVER(Partition by Name) AS 'Total Saved'
FROM dbo.SpendingHabit
GO

USE [CodeFirst_DBTest2]
GO
-- Select rows from a Table or View 'SpendingHabit' in schema 'dbo'
SELECT UPPER(Name) AS 'User Name',
FORMAT(MIN(Amount), 'C', 'en-us') AS 'Min_Saved',
FORMAT(MAX(Amount), 'C', 'en-us') AS 'Max_Saved',
FORMAT(AVG(Amount), 'C', 'en-us') AS 'Average Saved Auto',
FORMAT((SUM(Amount)/Count(Name)), 'C', 'en-us') AS 'Average Saved Manully',
FORMAT(SUM(Amount), 'C', 'en-us') AS 'Total_Saved'
FROM dbo.SpendingHabit
GROUP By Name
ORDER By Total_Saved
GO

USE [CodeFirst_DBTest2]
GO
-- Select rows from a Table or View 'SpendingHabit' in schema 'dbo'
SELECT Name, Amount, [Date Saved],
FORMAT(SUM(Amount), 'C', 'en-us') OVER(Partition by Name) AS 'Total',
FORMAT(Amount/(SUM(Amount) OVER(Partition by Name)), 'P') AS 'Percentage of Total'
FROM dbo.SpendingHabit
ORDER BY SUM(Amount) OVER(PARTITION BY Name) DESC
GO

USE [CodeFirst_DBTest2]
GO
-- Create a new table called 'EmployeeIdName' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.EmployeeIdName', 'U') IS NOT NULL
DROP TABLE dbo.EmployeeIdName
GO
-- Create the table in the specified schema
CREATE TABLE dbo.EmployeeIdName
(
    einId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name [NVARCHAR](50) NOT NULL
);
GO

-- Insert rows into table 'EmployeeIdName'
INSERT INTO EmployeeIdName
( -- columns to insert data into
 [Name]
)
VALUES
(
 'John Smith'
),
(
 'Mary Jones'
),
(
 'Bob Jack'
)
-- add more rows here
GO

USE [CodeFirst_DBTest2]
GO
-- Create a new table called 'EmployeeDetails' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.EmployeeDetails', 'U') IS NOT NULL
DROP TABLE dbo.EmployeeDetails
GO
-- Create the table in the specified schema
CREATE TABLE dbo.EmployeeDetails
(
    einId INT NOT NULL IDENTITY(1,1),
    Date_Hired Date NOT NULL,
    Salary Money NOT NULL
);
GO

USE [CodeFirst_DBTest2]
GO
-- Insert rows into table 'EmployeeDetails'
INSERT INTO EmployeeDetails
( -- columns to insert data into
 [Date_Hired], [Salary]
)
VALUES
('2007-05-16', 90000),
('2015-08-16', 100000),
(GETDATE(), 200000)
GO

USE [CodeFirst_DBTest2]
GO
-- Select rows from a Table or View 'EmployeeIdName' in schema 'dbo'
SELECT Name, (SELECT FORMAT(Salary, 'C', 'en-us') FROM dbo.EmployeeDetails ed0
WHERE ed0.einId = ein.einId) AS 'Salary'
FROM EmployeeIdName ein
GO

USE [CodeFirst_DBTest2]
-- Create a new table called 'Folks' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Folks', 'U') IS NOT NULL
DROP TABLE dbo.Folks
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Folks
(
    fId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    AmountSaved Money NOT NULL,
    DateSaved Date NOT NULL,
    pId INT NOT NULL
);
GO

-- Insert rows into table 'Folks'
INSERT INTO Folks
( -- columns to insert data into
 [AmountSaved], [DateSaved], [pId]
)
VALUES
(234, GETDATE()-101, 1),
(123, GETDATE()-121, 1),
(126, GETDATE()-131, 1),
(145, GETDATE()-600, 1),
(165, GETDATE()-540, 2),
(345, GETDATE()-267, 2),
(245, GETDATE()-758, 2),
(33, GETDATE()-755, 2),
(6, GETDATE()-89, 3),
(99, GETDATE()-77, 3),
(88, GETDATE()-64, 3)
GO

USE [CodeFirst_DBTest2]
-- Create a new table called 'People0' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.People0', 'U') IS NOT NULL
DROP TABLE dbo.People0
GO
-- Create the table in the specified schema
CREATE TABLE dbo.People0
(
    pId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name [NVARCHAR](60) NOT NULL
);
GO

-- Insert rows into table 'People0'
INSERT INTO People0
( -- columns to insert data into
 [Name]
)
VALUES
('John'), ('Mary')
GO

USE [CodeFirst_DBTest2]
-- Select rows from a Table or View 'Folks' in schema 'dbo'
SELECT p0.pId, p0.Name, AvgAmtQuery.AVGAMT FROM dbo.People0 p0,
(
    SELECT f.pId, FORMAT(AVG(f.AmountSaved), 'C', 'en-us') AS 'AVGAMT' From dbo.Folks f
	GROUP BY f.pId
) AS AvgAmtQuery
WHERE p0.pId = AvgAmtQuery.pId
ORDER BY UPPER(Name) DESC
GO

USE [CodeFirst_DBTest2]
GO
-- Create a new stored procedure called 'GetHigherSavers' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'GetHigherSavers'
)
DROP PROCEDURE GetHigherSavers
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE GetHigherSavers
    @AmtSaved Money,
    @DateSaved Date
AS
    -- Select rows from a Table or View 'Folks' in schema 'dbo'
    SELECT f.fId, FORMAT(f.AmountSaved, 'C', 'en-us') AS 'Amount_Saved', f.DateSaved, f.pId FROM dbo.Folks f
    WHERE f.AmountSaved > @AmtSaved AND f.DateSaved > @DateSaved
    GO
GO
-- example to execute the stored procedure we just created
EXECUTE GetHigherSavers 200, '01/02/2012'
GO


USE [CodeFirst_DBTest2]
-- Create a new stored procedure called 'TryIfElse' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'TryIfElse'
)
DROP PROCEDURE TryIfElse
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE TryIfElse
    @AmtSaved Money
-- add more stored procedure parameters here
AS
BEGIN
    IF @AmtSaved >= 0 AND @AmtSaved <= 345
        SELECT f.fId, FORMAT(f.AmountSaved, 'C', 'en-us') AS 'Amount_Saved', f.DateSaved, f.pId FROM dbo.Folks f
        WHERE f.AmountSaved > @AmtSaved
    ELSE
        PRINT 'Print Message --> Condition is not fited.'
END
GO
-- example to execute the stored procedure we just created
EXECUTE TryIfElse -456
EXECUTE TryIfElse 245
GO

USE [CodeFirst_DBTest2]
GO
-- Create a new table called 'AmountSold' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.AmountSold', 'U') IS NOT NULL
DROP TABLE dbo.AmountSold
GO
-- Create the table in the specified schema
CREATE TABLE dbo.AmountSold
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name [NVARCHAR](50) NOT NULL,
    AmountSold Money NOT NULL
);
GO

-- Insert rows into table 'AmountSold'
INSERT INTO AmountSold
( -- columns to insert data into
 [Name], [AmountSold]
)
VALUES
('Jhon', 1578.56 ),
('Mary', 2300.67 ),
('Tim', 4500.4 ),
('Jack', 1456.45 ),
('Steve', 2789.34 ),
('Bob', 2000.67 )
GO


USE [CodeFirst_DBTest2]
-- Create a new stored procedure called 'AmountSold' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'AmountSold'
)
DROP PROCEDURE ComissionEarn
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE ComissionEarn
AS
BEGIN
    SELECT a.Name, a.AmountSold, FLOOR(a.AmountSold) AS 'Amount Sold Rounded', 
	"Commission Earned" = 
		CASE
            WHEN FLOOR(a.AmountSold) Between 0 AND 2000 THEN FORMAT(AmountSold*.03, 'C', 'en-us')
            WHEN FLOOR(a.AmountSold) Between 2001 AND 4000 THEN FORMAT(AmountSold*.04, 'C', 'en-us')
            WHEN FLOOR(a.AmountSold) Between 4001 AND 6000 THEN FORMAT(AmountSold*.06, 'C', 'en-us')
        END
	FROM AmountSold a
END
GO
-- example to execute the stored procedure we just created
EXECUTE ComissionEarn
GO


USE [CodeFirst_DBTest2]
-- Create a new stored procedure called 'CheckCouldBeDevidedBy2' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'CheckCouldBeDevidedBy2'
)
DROP PROCEDURE dbo.CheckCouldBeDevidedBy2
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.CheckCouldBeDevidedBy2
    @counter INT = 1
AS
WHILE @counter <= 5
BEGIN
    SELECT @counter AS 'This is Interger Counter'
    SELECT cast((@counter) as DECIMAL(4,2)) AS 'Decimal Type counter'
    SET @counter+=1
    IF @counter%2 = 0
        PRINT 'mag --> This number is dividable by 2.'
    ELSE
        PRINT 'mag --> This number is not dividable by 2.'
END
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.CheckCouldBeDevidedBy2
GO

-- Random Number 1-10
SELECT ABS(CHECKSUM(NEWID())%10)+1 AS 'Random_Number'
GO

USE [CodeFirst_DBTest2]
GO
-- Create a new table called 'empAmt' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.empAmt', 'U') IS NOT NULL
DROP TABLE dbo.empAmt
GO
-- Create the table in the specified schema
CREATE TABLE dbo.empAmt
(
    empId INT NOT NULL,
    Amount MONEY NOT NULL
);
GO

USE [CodeFirst_DBTest2]
GO
DECLARE @counter INT = 1
WHILE @counter <= 60
    BEGIN
        -- Insert rows into table 'empAmt'
        INSERT INTO empAmt
        (
            empId, [Amount]
        )
        VALUES
        (ABS(CHECKSUM(NEWID())%10)+1, Round(Rand()*1000, 2))
        SET @counter += 1
    END
GO

USE [CodeFirst_DBTest2]
GO
-- Create a new stored procedure called 'CountAmount' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'CountAmount'
)
DROP PROCEDURE CountAmount
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE CountAmount
    @employeeid INT,
    @total MONEY OUTPUT
-- add more stored procedure parameters here
AS
BEGIN
    SET @total=(SELECT FORMAT(SUM(Amount), 'C', 'en-us') FROM empAmt Where empId = @employeeid)
    RETURN @total
END
GO

USE [CodeFirst_DBTest2]
GO
DECLARE @TargetId INT = ABS(CHECKSUM(NEWID())%10)+1, @TotalById INT
-- example to execute the stored procedure we just created
EXECUTE CountAmount @TargetId, @TotalById output;
Print 'the amount of Employee-'+CONVERT(varchar, @TargetId)+' is $'+Cast(@TotalById AS varchar);
GO


USE [CodeFirst_DBTest2]
GO
-- Create a new stored procedure called 'ErrorNumNErrMsg' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'ErrorNumNErrMsg'
)
DROP PROCEDURE ErrorNumNErrMsg
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE ErrorNumNErrMsg
    @counter INT = 5, @quote DECIMAL(5,2) OUTPUT
AS
WHILE @counter >= 0
    BEGIN TRY
        IF OBJECT_ID('quotetable') IS NOT NULL
            DROP TABLE quotetable
        SET @quote = (1.00/(Cast(@counter AS DECIMAL)))
            SELECT @quote as 'Result_Of_Divide' INTO quotetable
            SET @counter -= 1
    END TRY
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS 'Error_Number', ERROR_MESSAGE() AS 'Error_Message'
        BREAK
    END CATCH
GO
DECLARE @quoteHere DECIMAL(5,2)
EXECUTE ErrorNumNErrMsg 5, @quoteHere OUTPUT
GO

USE [CodeFirst_DBTest2]
GO
-- Create a new table called 'SoldAmtOnePerson' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.SoldAmtOnePerson', 'U') IS NOT NULL
DROP TABLE dbo.SoldAmtOnePerson
GO
-- Create the table in the specified schema
CREATE TABLE dbo.SoldAmtOnePerson
(
    SoldId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name [NVARCHAR](50) NOT NULL,
    Date DATE NOT NULL,
    Amount MONEY NOT NULL
);
GO

USE [CodeFirst_DBTest2]
GO
DECLARE @countersa INT = 1
WHILE @countersa <= 60
BEGIN
-- Insert rows into table 'SoldAmtOnePerson'
INSERT INTO SoldAmtOnePerson
( -- columns to insert data into
 [Name], [Date], [Amount]
)
VALUES ('JOHN', GETDATE()+@countersa-12, Rand()*1000)
SET @countersa += 1

END

USE [CodeFirst_DBTest2]
GO
DECLARE @counter0 INT = 1
WHILE @counter0 <= 60
BEGIN
    DELETE FROM SoldAmtOnePerson
    SET @counter0 += 1
END


USE [CodeFirst_DBTest2]
GO
WITH SoldAmountSummary(FormatedName, TheMonth, Total, AvgPerDay)
AS
(
    -- Select rows from a Table or View 'SoldAmtOnePerson' in schema 'dbo'
    SELECT 
        UPPER(SUBSTRING(Name, 1, 1))+LOWER(SUBSTRING(Name, 2, DATALENGTH(Name))),
        MONTH(Date),
        FORMAT(SUM(Amount), 'C', 'en-us'),
        FORMAT(AVG(Amount), 'C', 'en-us')
    FROM dbo.SoldAmtOnePerson
    GROUP BY UPPER(SUBSTRING(Name, 1, 1))+LOWER(SUBSTRING(Name, 2, DATALENGTH(Name))), MONTH(Date)
)
-- Select rows from a Table or View 'SoldAmountSummary' in schema 'dbo'
SELECT 
    FormatedName AS 'PersonName',
    TheMonth AS 'TargetMonth',
    Total AS 'Total_Sold',
    AvgPerDay AS 'Avg_Per_Day'
FROM SoldAmountSummary
ORDER BY TargetMonth DESC
GO

USE [CodeFirst_DBTest2]
GO
--LEAD for SoldAmountSummary
WITH SoldAmountCollection(name, monthsold, soldtotal)
AS
(
    SELECT
    Name,
    MONTH(Date),
    SUM(Amount)
    FROM dbo.SoldAmtOnePerson
    GROUP BY MONTH(DATE), name
)
-- Select rows from a Table or View 'SoldAmountCollection' in schema 'dbo'
SELECT
    name, monthsold, soldtotal,
    FORMAT(LEAD(soldtotal, 1) OVER(ORDER BY monthsold), 'C', 'en-us') AS 'Next_Amount',
    soldtotal - (LEAD(soldtotal, 1) OVER(ORDER BY monthsold)) AS 'Differences Between this Amount and Next Amount'
FROM SoldAmountCollection
GO


USE [CodeFirst_DBTest2]
GO
-- Create a new table called 'DepartIdNameSalary0' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.DepartIdNameSalary0', 'U') IS NOT NULL
DROP TABLE dbo.DepartIdNameSalary0
GO
-- Create the table in the specified schema
CREATE TABLE dbo.DepartIdNameSalary0
(
    Dept_Id INT NOT NULL,
    Name [NVARCHAR](50) NOT NULL,
    Salary MONEY NOT NULL
);
GO
-- Insert rows into table 'DepartIdNameSalary0'
INSERT INTO DepartIdNameSalary0
( -- columns to insert data into
 [Dept_Id], [Name], [Salary]
)
VALUES
(45, 'Yates', 54000),
(45, 'Erickson', 80000),
(45, 'Parker', 42000),
(30, 'Sally', 57500),
(30, 'Fred', 65000)
GO

-- Select rows from a Table or View 'DepartIdNameSalary0' in schema 'dbo'
SELECT Dept_Id, Name, Salary, 
    LAG(Salary, 1) OVER(ORDER BY Salary) AS Lower_Salary
FROM dbo.DepartIdNameSalary0
GO
-- Select rows from a Table or View 'DepartIdNameSalary0' in schema 'dbo'
SELECT Dept_Id, Name, Salary, 
    LAG(Salary, 1) OVER(PARTITION BY Dept_Id ORDER BY Salary DESC) AS Lower_Salary
FROM dbo.DepartIdNameSalary0
GO

-- Select rows from a Table or View 'DepartIdNameSalary0' in schema 'dbo'
SELECT Dept_Id, Name, Salary, 
    LEAD(Salary, 1) OVER(ORDER BY Salary) AS Higher_Salary
FROM dbo.DepartIdNameSalary0
GO
-- Select rows from a Table or View 'DepartIdNameSalary0' in schema 'dbo'
SELECT Dept_Id, Name, Salary, 
    LEAD(Salary, 1) OVER(PARTITION BY Dept_Id ORDER BY Salary DESC) AS Higher_Salary
FROM dbo.DepartIdNameSalary0
GO

USE [CodeFirst_DBTest2]
GO
-- Create a new table called 'MarySales' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.MarySales', 'U') IS NOT NULL
DROP TABLE dbo.MarySales
GO
-- Create the table in the specified schema
CREATE TABLE dbo.MarySales
(
    MaryId INT NOT NULL,
    Date_Sold DATE NOT NULL
);
GO

USE [CodeFirst_DBTest2]
GO
-- Create a new table called 'MaryDetails' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.MaryDetails', 'U') IS NOT NULL
DROP TABLE dbo.MaryDetails
GO
-- Create the table in the specified schema
CREATE TABLE dbo.MaryDetails
(
    MaryId INT NOT NULL,
    Name [NVARCHAR](50) NOT NULL,
    Totaldays INT NOT NULL,
    AmountSold MONEY NOT NULL,
    Commearned MONEY NOT NULL
);
GO

DECLARE @counter INT = 0
DECLARE @Amount MONEY = 0
WHILE @counter <= 60
BEGIN
    INSERT INTO MarySales VALUES(@counter+1, GETDATE()-DATEPART(day, GETDATE())+1+@counter)
    SET @Amount = CAST(Rand()*1000 AS MONEY)
    INSERT INTO MaryDetails VALUES(@counter+1, 'Mary', DATEPART(day, GETDATE())-18+@counter, @Amount, @Amount*.05)
    SET @counter+=1
END

USE [CodeFirst_DBTest2]
GO
WITH MaryJoinCTE(SellerName, DateSold, TotalDays, AmountSold, CommEarned)
AS
(
    -- Select rows from a Table or View 'MarySales' in schema 'dob'
    SELECT
		md.Name,
		ms.Date_Sold,
		md.Totaldays,
		md.AmountSold,
		md.Commearned
    FROM MarySales ms INNER JOIN MaryDetails md
    on ms.MaryId = md.MaryId
)
-- Select rows from a Table or View 'MaryJoinCTE' in schema
SELECT
    SellerName AS 'Seller',
    MONTH(DateSold) AS 'Sold Month',
    FORMAT(SUM(AmountSold), 'C', 'en-us') AS 'Amount_Sold_Total',
    FORMAT(SUM(CommEarned), 'C', 'en-us') AS 'Commission'
FROM MaryJoinCTE
GROUP BY MONTH(DateSold), SellerName
GO

USE [CodeFirst_DBTest2]
GO
SELECT DATEDIFF(day, co.Date_enrolled, GETDATE()) AS 'DifferDate' from dbo.Comments co
GO

USE [CodeFirst_DBTest2]
GO
-- Create a new table called 'SalesMenName' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.SalesMenName', 'U') IS NOT NULL
DROP TABLE dbo.SalesMenName
GO
-- Create the table in the specified schema
CREATE TABLE dbo.SalesMenName
(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name [NVARCHAR](50) NOT NULL
);
GO

-- Create a new table called 'SalesMenDetails' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.SalesMenDetails', 'U') IS NOT NULL
DROP TABLE dbo.SalesMenDetails
GO
-- Create the table in the specified schema
CREATE TABLE dbo.SalesMenDetails
(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    SalesPerson [NVARCHAR](50) NOT NULL,
    AmountSold MONEY NOT NULL,
    DateSold DATE NOT NULL
);
GO

-- Create a new table called 'EmpDetailsTable' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.EmpDetailsTable', 'U') IS NOT NULL
DROP TABLE dbo.EmpDetailsTable
GO
-- Create the table in the specified schema
CREATE TABLE dbo.EmpDetailsTable
(
    empId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name [NVARCHAR](50) NOT NULL,
    Email [NVARCHAR](100) NOT NULL,
    Date_Hired DATE NOT NULL,
    TimeWorked INT NOT NULL,
    Bouns VARCHAR(3) NOT NULL,
    Salary MONEY NOT NULL,
    Date_Updated DATE NOT NULL
);
GO

USE [CodeFirst_DBTest2]
GO
-- Insert rows into table 'SalesMenName'
INSERT INTO SalesMenName
( -- columns to insert data into
 [Name]
)
VALUES
('john'),('mary'),('steve')
GO

-- Insert rows into table 'SalesMenDetails'
INSERT INTO SalesMenDetails
([SalesPerson], [AmountSold], [DateSold])
VALUES
('john', 244.00, GETDATE()-ABS(CHECKSUM(NEWID())%1000)+1),
('john', 245.00, GETDATE()-ABS(CHECKSUM(NEWID())%1000)+1),
('john', 453.00, GETDATE()-ABS(CHECKSUM(NEWID())%1000)+1),
('mary', 255.00, GETDATE()-ABS(CHECKSUM(NEWID())%1000)+1),
('mary', 345.00, GETDATE()-ABS(CHECKSUM(NEWID())%1000)+1),
('mary', 566.00, GETDATE()-ABS(CHECKSUM(NEWID())%1000)+1),
('steve', 338.00, GETDATE()-ABS(CHECKSUM(NEWID())%1000)+1)
GO

-- Insert rows into table 'EmpDetailsTable'
INSERT INTO EmpDetailsTable
(
 [Name], [Email], [Date_Hired], [TimeWorked], [Bouns], [Salary], [Date_Updated]
)
VALUES
('Johnny', 'JOHN@smail.com', '2010-01-23', NULL, NULL, 150000.00, NULL),
('MARY', 'MARY@Yahoo.com', '2013-02-04', NULL, NULL, 565780.00, NULL),
('Steve', 'steve@baha.com', '2014-10-02', NULL, NULL, 345670.00, NULL)
GO

USE [CodeFirst_DBTest2]
GO
CREATE FUNCTION dbo.SalesAmtFromSalesMenDetails(@Name NVARCHAR(50))
RETURNS MONEY

AS
BEGIN
    DECLARE @TotalAmt MONEY
    -- Select rows from a Table or View 'SalesMenDetails' in schema 'dbo'
    SELECT @TotalAmt = SUM(smd.AmountSold) FROM dbo.SalesMenDetails smd
    WHERE smd.SalesPerson = @Name
    RETURN @TotalAmt
END
GO


-- Select rows from a Table or View 'SalesMenName' in schema 'dbo'
SELECT MAX(smn.Id), smn.Name, FORMAT(dbo.SalesAmtFromSalesMenDetails(smn.Name), 'C', 'en-us') AS 'Total_Sales'
FROM dbo.SalesMenName smn
WHERE smn.Name = 'john' OR smn.Name = 'mary'
GROUP BY smn.Name
GO

USE [CodeFirst_DBTest2]
GO
CREATE FUNCTION dbo.CreateNewEmpDetailsTable(@empID INT)
RETURNS @empDetailsTable TABLE
(
    Email NVARCHAR(100) NOT NULL, Date_Hired DATE NOT NULL, 
    TimeWorked INT NULL, Bouns VARCHAR(3) NULL
)
AS
BEGIN
    DECLARE @empEmail NVARCHAR(100), @empDate_Hired DATE, @empTimeWorked INT, @empBouns VARCHAR(3)

    SELECT @empEmail = edt.Email, @empDate_Hired = edt.Date_Hired, 
		@empTimeWorked = DATEDIFF(YEAR, edt.Date_Hired, GETDATE()),
		@empBouns = CASE
						WHEN @empTimeWorked >= 3 THEN 'Yes'
						WHEN @empTimeWorked < 3 THEN 'No'
					END
    FROM EmpDetailsTable edt
    WHERE edt.empId = @empID
    BEGIN
        INSERT @empDetailsTable
		-- This table doesnot exist now, so you have to specify column name
        SELECT @empEmail, @empDate_Hired, @empTimeWorked, @empBouns
    END
	RETURN
END
GO

DECLARE @employeeID INT = 1
SELECT * FROM dbo.CreateNewEmpDetailsTable(@employeeID)
GO


USE [CodeFirst_DBTest2]
GO
-- Create a new table called 'InsTable' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.InsTable', 'U') IS NOT NULL
DROP TABLE dbo.InsTable
GO
-- Create the table in the specified schema
CREATE TABLE dbo.InsTable
(
    EmpId INT NOT NULL PRIMARY KEY,
    EmpName [NVARCHAR](50) NOT NULL,
    EmpSalary MONEY NULL
);
GO


-- Create a new stored procedure called 'CreateTableAndInserValues' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'CreateTableAndInserValues'
)
DROP PROCEDURE dbo.CreateTableAndInserValues
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.CreateTableAndInserValues
    @Counter1 INT = 1
AS
WHILE @Counter1 <= 20
BEGIN
    INSERT INTO InsTable VALUES
    (
        @Counter1, 'Mary'+CHAR(@Counter1), RAND()*10000
    )
    SET @Counter1 += 1
END
IF @Counter1 = 20
BEGIN
    SELECT * FROM InsTable
END
GO

-- example to execute the stored procedure we just created
EXECUTE dbo.CreateTableAndInserValues
GO


USE [CodeFirst_DBTest2]
GO
DECLARE @TableWithInsertValues TABLE(EmpID INT NOT NULL, EmpName NVARCHAR(50) NOT NULL, EmpSalary MONEY NULL)
DECLARE @CounterA INT = 1;
WHILE @counterA <= 16
BEGIN
    BEGIN
        INSERT INTO @TableWithInsertValues VALUES
        (
            @CounterA, 'Jack'+CHAR(@CounterA), RAND()*10000
        )
        SELECT EmpID, EmpName AS 'Name', FORMAT(EmpSalary, 'C', 'en-us') AS 'Income' FROM @TableWithInsertValues
        SET @counterA += 1
    END
    IF @counterA = 20
    BEGIN
        SELECT * INTO PeremTable FROM @TableWithInsertValues
    END
END
GO

USE [CodeFirst_DBTest2]
GO
SELECT * FROM PeremTable


USE [CodeFirst_DBTest2]
GO
-- Create a new View called 'EmployeesView' in schema 'dbo'
-- Drop the View if it already exists
IF OBJECT_ID('dbo.EmployeesView') IS NOT NULL
DROP VIEW dbo.EmployeesView
GO
-- Create the View in the specified schema
CREATE VIEW dbo.EmployeesView
AS
    SELECT ed.Name, ed.Email, ed.Date_Hired AS 'Hired_Date', 
		"Time_Worked" = DATEDIFF(YEAR, ed.Date_Hired, GETDATE()),
		"Bouns" = (
			CASE
				WHEN DATEDIFF(YEAR, ed.Date_Hired, GETDATE()) > 3 THEN 'Yes'
				ELSE 'No'
			END
		),
		ed.Salary,
		FORMAT((((ed.Salary * 1.05)/12)/4)*.6, 'C', 'en-us') AS 'Weekly_Wage'
	FROM dbo.EmpDetailsTable ed
GO

SELECT * FROM dbo.EmployeesView
WHERE Weekly_Wage < CAST(2000 AS VARCHAR)
GO


-- Create a new table called 'CustomerTransactions' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.CustomerTransactions', 'U') IS NOT NULL
DROP TABLE dbo.CustomerTransactions
GO
-- Create the table in the specified schema
CREATE TABLE dbo.CustomerTransactions
(
    custId INT NOT NULL PRIMARY KEY,
    Customer_Name [NVARCHAR](50) NOT NULL,
    OrderId INT NOT NULL
);
GO




USE [CodeFirst_DBTest2]
GO
DECLARE @transName VARCHAR(50) = 'Simple_Transaction'
DECLARE @counterB INT = 20;
WHILE @counterB <= 25
BEGIN
    BEGIN TRANSACTION @transName
    SELECT @@TRANCOUNT AS 'Transaction Count'
    INSERT INTO CustomerTransactions VALUES(
        @counterB, 'Mozila '+CAST(@counterB AS nvarchar), ABS(CHECKSUM(NEWID())%20)+1
    )
    COMMIT TRANSACTION @transName
    SET @counterB += 1
    SELECT @@TRANCOUNT AS 'Transaction Count'
END
GO


-- Delete rows from table 'CustomerTransactions'
DELETE FROM CustomerTransactions
WHERE custId >= 24
SELECT * FROM CustomerTransactions
GO


USE [CodeFirst_DBTest2]
GO
DECLARE @transName VARCHAR(50) = 'Simple_TransaPrac'
DECLARE @counterB INT = 3;
WHILE @counterB <= 6
BEGIN
    BEGIN TRANSACTION @transName
    INSERT INTO CustomerTransactions VALUES(
        @counterB, 'Name600 '+CAST(@counterB AS nvarchar), ABS(CHECKSUM(NEWID())%20)+1
    )
	SELECT * FROM CustomerTransactions
    ROLLBACK TRANSACTION @transName
    SET @counterB += 1
    SELECT @@ROWCOUNT AS 'Rows_Affected'
	SELECT * FROM CustomerTransactions
END
GO



USE [CodeFirst_DBTest2]
GO
DECLARE @transName VARCHAR(50) = 'Simple_Transaction'
BEGIN TRANSACTION @transName
UPDATE CustomerTransactions
SET OrderId = 3 Where OrderId = 1
SELECT * FROM CustomerTransactions
SAVE TRANSACTION SavePoint

UPDATE CustomerTransactions
SET Customer_Name = 'Mozila 21' Where Customer_Name = 'MarinFolder_Han'
SELECT * FROM CustomerTransactions
ROLLBACK TRANSACTION @transName
SELECT * FROM CustomerTransactions
SELECT @@ROWCOUNT AS 'Rows_Affected'

