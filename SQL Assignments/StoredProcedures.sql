use A1
USE Jan2026

--ADVANCE SQL
------------------STORED PROCEDURE----------------------

--Simple stored procedure

CREATE PROCEDURE spGetEmpSalary_
AS
BEGIN
    SELECT Eid, Esalary
    FROM Employee
END


-- It has 3 method to execute the stored procedure
spGetEmpSalary_
EXEC spGetEmpSalary_
Execute spGetEmpSalary_


--Alter
Alter PROCEDURE spGetEmpSalary_
AS
BEGIN
    SELECT Eid, Department, Esalary
    FROM Employee
END


spGetEmpSalary_


sp_helptext 'spGetEmpSalary_'        -- It will show the code of the stored procedure, but if use with encryption then it will not show the code of the stored procedure
sp_help 'spGetEmpSalary_'            -- It will show the information of the stored procedure
sp_depends 'spGetEmpSalary_'         -- It will show the dependencies of the stored procedure, but it is not recommended to use this command because it may give wrong information


spGetEmpSalary_ WHERE Eid = 1      -- It will give error because we cannot use where clause with stored procedure, but we can use where clause with function

--For predefine stored procedure we write 'sp_' and for user defined stored procedure we write 'sp' but it is not mandatory, it is just a convention to write 'sp_' for predefine stored procedure and 'sp' for user defined stored procedure

-- Drop Procedure
DROP PROCEDURE spGetEmpSalary_


-- Stored procedure with parameters

-- Using input parameters

CREATE PROCEDURE spGetEmpDetailsById
    @Eid INT
    AS
BEGIN
    SELECT *
    FROM Employee
    WHERE Eid = @Eid
END

spGetEmpDetailsById 1

SELECT * FROM Employee

CREATE PROCEDURE spGetEmpDetailsByTwoVar
    @Age INT,
    @DeptName VARCHAR(255)
    AS
BEGIN
    SELECT *
    FROM Employee
    WHERE Eage >= @Age
    AND Department = @DeptName
END

spGetEmpDetailsByTwoVar @Age = 3, @DeptName = 'Full Stack'



--Using Output parameter

CREATE PROCEDURE spGetEmpDeptCount
    @Deptname varchar(20),
    @Empcount INT Output
    AS
BEGIN
    SELECT @Empcount = COUNT(Eid) From Employee
    WHERE Department = @Deptname
END

DECLARE @Total INT
EXECUTE spGetEmpDeptCount 'Full Stack', @Total Output  -- If i didnt write 'output here then it will conside null, not gives an error but return null value'
Print @Total

SELECT * FROM Employee

-- Get Orders placed by customers based on Customer ID using stored procedure with input parameter
CREATE TABLE Customers
(
    CustomerId INT PRIMARY KEY,
    CustomerName VARCHAR(255)
)
CREATE TABLE Orders
(
    OrderId INT PRIMARY KEY,
    CustomerId INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
)

INSERT INTO Customers (CustomerId, CustomerName) 
VALUES (1, 'John Doe'), 
(2, 'Jane Smith'), 
(3, 'Alice Johnson')

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount) 
VALUES (1, 1, '2024-01-01', 100.00), 
(2, 1, '2024-01-15', 150.00), 
(3, 2, '2024-02-01', 200.00), 
(4, 3, '2024-03-01', 250.00), 
(5, 3, '2024-03-15', 300.00)


CREATE PROCEDURE spGetOrdersByCustomerId
    @CustomerId INT
    AS
BEGIN
    SELECT o.OrderId, o.OrderDate, o.TotalAmount
    FROM Orders o
    INNER JOIN Customers c 
    ON o.CustomerId = c.CustomerId
    WHERE c.CustomerId = @CustomerId
END

EXEC spGetOrdersByCustomerId 1


-- Total Spent by customer 

Create PROCEDURE spGetTotalAmountByCustomerId
    @CustomerId INT,
    @TotalAmount DECIMAL(10, 2) OUTPUT
    AS
BEGIN 
    SELECT @TotalAmount = SUM(o.TotalAmount * o.Quantity)
    FROM Order o
    JOIN Customer c
    ON o.CustomerID = c.CustomerID
    WHERE c.CostomerID = @CustomerId
END


DECLARE @TotalBill DECIMAL(10,2)
Execute spGetTotalAmountByCustomerId 1, @TotalBill Output
PRINT 'The Total bill of the Customer is ' + CAST (@TotalBill as Varchar)


-- Inserting Velues in a table using stored procedure
CREATE PROCEDURE spInsertCustomer
    @CustomerName VARCHAR(255)
    AS
BEGIN
    INSERT INTO Customers (CustomerName)
    VALUES (@CustomerName)
END
EXEC spInsertCustomer 'Shakti Raolji'
SELECT * FROM Customers


--Updating values in a table using stored procedure
CREATE PROCEDURE spUpdateCustomerName
    @CustomerId INT,
    @NewCustomerName VARCHAR(255)
    AS
BEGIN
    UPDATE Customers
    SET CustomerName = @NewCustomerName
    WHERE CustomerId = @CustomerId
END

EXEC spUpdateCustomerName 1, 'Shakti Raolji'
SELECT * FROM Customers

-- Deleting values from a table using stored procedure
CREATE PROCEDURE spDeleteCustomer
    @CustomerId INT
    AS
BEGIN
    DELETE FROM Customers
    WHERE CustomerId = @CustomerId
END
EXEC spDeleteCustomer 1

-- To find products by productname in a e-commerse website
Create PROCEDURE spSearchProduct
@Proname VARCHAR(20)
    AS
BEGIN
    SELECT ProductID, ProductName, Price
    FROM Products
    WHERE ProductName LIKE '%' + @Proname + '%'
END

spSearchProduct 'Laptop'

-- To decrease dtock of a product after purchase
CREATE PROCEDURE spDecreaseStock
    @ProductId INT,
    @Quantity INT
    AS
BEGIN
    UPDATE Products
    SET Stock = Stock - @Quantity
    WHERE ProductID = @ProductId
END

spDecreaseStock 1, 4

-- Create SP to retrive details of all employees working in a given project 
CREATE PROC spProjectEmpDetails
@Projectname Varchar(200)
    AS
BEGIN
    SELECT e.Eid, e.Ename, p.pname
    FROM Employees e
    JOIN Project p
    ON e. Eid = p.Eid
    WHERE Pname = @Projectname
END


spProjectEmpDetails 'Data Migration'


-- Select SP that retrives all employees details with the specific Eid 

CREATE PROCEDURE spEmpDetailsByEid
@EID INT
AS
BEGIN
    SELECT *
    FROM Employee
    WHERE Eid = @EID
END

spEmpDetailsByEid 2

--Create procedure to imcrease or decrease product price
CREATE PROCEDURE spProductPriceChange
@Productname Varchar(20),
@percentageChange Decimal (5,2)
AS
BEGIN
    UPDATE Products
    SET Price = Price + (Price * @percentageChange)
    WHERE ProductName = @Productname
END 

spProductPriceChange 'Product A', 0.10

-- Create a procedure that returns max salary of the department
@MaxSalary Money Output
As
Begin
    SELECT department, MAX(Esalary) from Employee 
    WHERE department = @department
End

Declare @Highest Money
Execute spMaxSalaryDept 'IT', @Highest out
Print @Highest

Select @MaxSalary = MAX(Esalary),
@MinSalary = Min(Esalary),
@AvgSalary = Avg(Esalary) From employee
Where department = @department