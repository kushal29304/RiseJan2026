-- Types of SQL Language
-- 1.DDL (Data Definition Language)
-- Create,Alter, Drop, Truncate
-- 2.DML(Data Manupulation Language)
-- Insert,Update,Delete
-- 3.DQL(Data Query Language)
-- Select
-- 4.TCL(Transaction Control Language)
-- Commit, Rollback, Savepoint
CREATE DATABASE JAN2026
USE JANUARY2026
DROP DATABASE JANUARY2026
ALTER DATABASE JAN2026
MODIFY NAME = JANUARY2026
SELECT 4+4 AS ADDITION
SELECT 'Kushal' + 'Parikh' AS FullName
SELECT GETDATE()
SELECT SYSTEM_USER


-- TO CREATE A TABLE IN DB
--CREATE TABLE <NAME>
-- (Col1 name <datatype>, Col2 name <datatype>, Col3 name <datatype>)
CREATE TABLE Employee
(EID INT, EName VARCHAR(20), EAge INT, ESalary MONEY)
SELECT * FROM Emp


-- Rename Table name
--sp_rename 'oldname', 'newname'
sp_rename 'Emp', 'EMP'


-- Rename column name
--sp_rename 'table.oldcolumn name', 'newcolumn name'
sp_rename 'Emp.EName', 'eName'


--TO DISPLAY ALL DATABASES PRESENT IN THE SYSTEM
SELECT NAME, create_date FROM sys.databases


--TO DISPLAY ALL TABLES IN DB
SELECT NAME FROM SYS.TABLES

--TO DROP A TABLE
DROP TABLE EMP

--To add a column
ALTER TABLE Emp
ADD email VARCHAR(20)


--To drop a column
ALTER TABLE Emp
drop column email


--To change the datatype of the column
ALTER TABLE Emp
ALTER Column EID INT

--INSERT METHOD 1
INSERT INTO Emp VALUES
(10,'Kushal',20,200000)

--INSERT METHOD 2
INSERT INTO Emp (EID,eName,EAge) VALUES (22,'Darshan',19)

--INSERT METHOD 3
INSERT INTO Emp VALUES
(3,'Deep',22,210000),
(4,'Shakti',22,210000),
(5,'Shiv',22,210000)


ALTER TABLE Emp
ALTER COLUMN EID INT

SELECT TOP 3 * FROM Emp