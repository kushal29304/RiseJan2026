use A1
--1. Create Stored Procedure to get orders placed by Customers based on City.
CREATE PROCEDURE GetOrdersByCity
    @City VARCHAR(50)
AS
BEGIN
    SELECT o.OrderID, c.CustomerName, c.City, o.OrderDate
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    WHERE c.City = @City
END

EXEC GetOrdersByCity 'Mumbai'

--2. Create Stored Procedure to find out total employees department-wise 
CREATE PROCEDURE GetEmployeeCountByDepartment
AS
BEGIN
    SELECT DepartmentID, COUNT(*) AS TotalEmployees
    FROM Employees
    GROUP BY DepartmentID
END

EXEC GetEmployeeCountByDepartment

--3. Create Stored Procedure to find products by productname in e-commerce website
CREATE PROCEDURE GetProductByName
    @ProductName VARCHAR(100)
AS
BEGIN
    SELECT *
    FROM Products
    WHERE ProductName LIKE '%' + @ProductName + '%'
END

EXEC GetProductByName 'Laptop'

--4. Create procedure to increase or decrease product price of a specific category 
CREATE PROCEDURE UpdatePriceByCategory
    @CategoryID INT,
    @PriceChange DECIMAL(10,2)
AS
BEGIN
    UPDATE Products
    SET Price = Price + @PriceChange
    WHERE CategoryID = @CategoryID
END
--Increase price by 100
EXEC UpdatePriceByCategory 2, 100
--Decrease price by 50
EXEC UpdatePriceByCategory 2, -50

--5. Create a procedure that returns max salary of employees with respect to their  
--   department. 
CREATE PROCEDURE GetMaxSalaryByDepartment
AS
BEGIN
    SELECT DepartmentID, MAX(Salary) AS MaxSalary
    FROM Employees
    GROUP BY DepartmentID
END

--6. Create a Trigger to ensure that Salary is non negative 
CREATE TRIGGER CheckSalary
ON Employees
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE Salary < 0)
    BEGIN
        PRINT 'Salary cannot be negative'
        ROLLBACK TRANSACTION
    END
END

--7. Create a Update Trigger to log Salary change
CREATE TRIGGER LogSalaryChange
ON Employees
AFTER UPDATE
AS
BEGIN
    INSERT INTO SalaryLog(EmployeeID, OldSalary, NewSalary, ChangeDate)
    SELECT d.EmployeeID, d.Salary, i.Salary, GETDATE()
    FROM deleted d
    JOIN inserted i
    ON d.EmployeeID = i.EmployeeID
    WHERE d.Salary <> i.Salary
END

--8. Create a Trigger to ensure that Product Price never exceeds 9999.
CREATE TRIGGER CheckProductPrice
ON Products
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE Price > 9999)
    BEGIN
        PRINT 'Product price cannot exceed 9999'
        ROLLBACK TRANSACTION
    END
END

--9. Create a trigger that prevents a user from deleting more than 5 products in a single 
--   DELETE statement. 
CREATE TRIGGER LimitProductDelete
ON Products
FOR DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 5
    BEGIN
        PRINT 'You cannot delete more than 5 products at once'
        ROLLBACK TRANSACTION
    END
END

--10. Create a trigger to prevent Schema changes/ Structure modification on a database.
CREATE TRIGGER PreventSchemaChanges
ON DATABASE
FOR DDL_DATABASE_LEVEL_EVENTS
AS
BEGIN
    PRINT 'Schema modification is not allowed'
    ROLLBACK TRANSACTION
END