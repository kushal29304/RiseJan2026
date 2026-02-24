CREATE DATABASE A1
USE A1
CREATE TABLE kushal (kID INT, Name varchar(20), Age INT, National_id_no varchar(20))
INSERT INTO kushal VALUES (23,'Pranav',21,236104)
SELECT * FROM kushal
-- Arithematic operators +,-,*,/
CREATE TABLE Employee (EID INT, Ename VARCHAR(20), Eage INT, Department VARCHAR(20), Salary MONEY)
INSERT INTO Employee VALUES
(1,'Kushal',21,'BA',200000),
(2,'Pranav',24,'QA',210000),
(3,'Deep',23,'AI',220000),
(4,'Darshan',26,'LARAVEL',230000),
(5,'Yanshik',28,'Full Stack',240000)
DROP TABLE Employee
SELECT * FROM Employee
SELECT EID,Ename,Salary,(Salary*0.05) AS Salary_Bonus from Employee

-- Logical operators (IN,AND,NOT,OR)
SELECT * FROM Employee WHERE Department = 'BA' OR Salary = 210000

SELECT * FROM Employee WHERE Department = 'Full Stack' AND Salary < 500000

-- <> IT IS USED FOR NOT EQUALS TO 
SELECT * FROM Employee WHERE Department <> 'QA' 

SELECT * FROM Employee WHERE Salary BETWEEN 200000 AND 230000

SELECT * FROM Employee WHERE Ename LIKE 'D%'

--Set Operators
--Union, Union All, Intersect, Except
CREATE TABLE Bank_Vadodara
(BID INT, Bname VARCHAR(20), LOCATION VARCHAR(20))

INSERT INTO Bank_Vadodara VALUES
(10,'SBI','Akota'),
(20,'HDFC','Manjalpur'),
(30,'ICICI','Atladra')
SELECT * FROM Bank_Vadodara

CREATE TABLE Bank_Surat
(BID INT, Bname VARCHAR(20), LOCATION VARCHAR(20))

INSERT INTO Bank_Surat VALUES
(10,'SBI','Akota'),
(40,'Axis','Varacha'),
(50,'BOB','Udhna')

SELECT * FROM Bank_Vadodara
UNION ALL
SELECT * FROM Bank_Surat

SELECT * FROM Bank_Vadodara
INTERSECT
SELECT * FROM Bank_Surat

SELECT BID, Bname,LOCATION FROM Bank_Surat
UNION
SELECT BID, Bname,LOCATION FROM Bank_Vadodara

-- NUMBER OF COLUMNS IN TABLES MUST BE SAME 
-- ORDER OF THE COLUMNS MUST BE SAME
-- DATATYPE OF COLUMN MUST BE SAME 
-- NUMBER OF SUPPLIED VALUES MUST BE SAME 

-- CLAUSES (Group by AND Having)
-- WHERE (USED TO APPLY FILTERS ON ROWS)
-- GROUP BY (USED TO GROUP SIMILAR DATA BASED ON THE COLUMN)
-- HAVING (USED TO FILTER THE RECORDS AFTER THE 

-- AGGREGATE FUNCTION (COUNT,SUM,MAX,MIN,AVG)
--(COUNT (NUMERIC & NON NUMERIC), SUM (NUMERIC), MAX(BOTH), MIN(BOTH), AVG(NUMERIC)
SELECT * FROM Employee
SELECT MAX(Salary) AS Highest FROM Employee
SELECT MIN(Salary) AS Lowest FROM Employee
SELECT AVG(Salary) AS Average FROM Employee
SELECT SUM(Salary) AS Total_Salary FROM Employee

SELECT MAX(Salary) AS Highest, MIN(Salary) AS Lowest, AVG(Salary) AS Average FROM Employee

SELECT Department, MAX(Salary) 
FROM Employee
GROUP BY Department

SELECT Department, SUM(Salary) 
FROM Employee
GROUP BY Department

SELECT * FROM Employee
SELECT Department, COUNT(*) AS 'TOTAL_EMPLOYEES' FROM Employee WHERE Salary IS NOT NULL GROUP BY Department

SELECT Department, Max(Salary) AS Highest 
FROM Employee
GROUP BY Department
Having Max(Salary) > 21000
Order by Department DESC

-- HAVING CLAUSE IS USED TO APPLY FILTER ON THE GROUP BY
-- HAVING CLAUSE ALWAYS HAVE AN AGGREGATE FUNCTION ASSOCIATED WITH IT

SELECT TOP 1 MAX(Salary) 
FROM Employee
ORDER BY MAX(Salary) DESC

-- 1. FIND OUR HOW MANY EMPLOYEES ARE IN EACH DEPARTMENT
SELECT Department, COUNT(Department)
FROM Employee
GROUP BY Department
HAVING COUNT(Department) > 2
ORDER BY 1 DESC

-- 2. CALCULATE THE AVERAGE SALARY FOR EMPLOYEE
SELECT Department, AVG(Salary)
FROM Employee
GROUP BY Department

-- 3. FIND THE TOTAL QUANTITY SOLD FOR EACH PRODUCT 
SELECT ProductName, SUM(Quantity)
FROM Product
GROUP BY ProductName

-- 4. MAXIMUM PRICE OF A PRODUCT IN EACH REGION
SELECT Region, MAX(Price)
FROM Product
GROUP BY Region

-- 5. MINIMUM AND MAXIMUM SALARY PER DEPARTMENT
SELECT Department, MIN(Salary), MAX(Salary)
FROM Employee
GROUP BY Department

-- 6. TOTAL SALES VALUE PER REGION
-- PRODUCT( PID, PNAME, QUANTITY, SALES, REGION)
SELECT REGION, SUM(QUANTITY * SALES)
FROM PRODUCT
GROUP BY REGION.
HAVING SUM(QUANTITY * PRICE) <= 50000

-- GROUP BY AND HAVING 
--1. FIND THE DEPARTMENTS WITH AN AVERAGE SALARY GREATER THAN 20000.

SELECT Department, AVG(Salary)
FROM Employee
GROUP BY Department
HAVING AVG(Salary) > 20000

--2.LIST THE CITIES WHERE THE AVERAGE EMPLOYEE AGE IS GREATER THAN 20.

SELECT Cities, AVG(Eage)
FROM Employee
GROUP BY Cities
HAVING AVG(Eage) > 20

--3.FIND THE DEPARTMENTS WITH MORE THAN 5 EMPLOYEES.

SELECT Department, Count(*) AS 'Total_Employees'
FROM Employee
GROUP BY Department
HAVING Count(*)>5

--4.LIST THE CITIES WHERE THE TOTAL SALARY OF ALL EMPLOYEES EXCEEEDS 30000.

SELECT Cities, SUM(Salary)
FROM Employee
GROUP BY Cities
HAVING SUM(Salary)>30000

--5. FIND THE DEPARTMENT WHERE THE AVERAGE AGE OF EMPLOYEES IS BETWEEN 20 AND 25.

SELECT Department, AVG(Eage)
FROM Employee
GROUP BY Department
HAVING AVG(Eage) BETWEEN 20 AND 25

-- Constraints
-- NOT NULL : Ensures that a column cannot have a NULL. duplicate values allowed
-- UNIQUE : Ensures that all values in a column are unique. NO duplicate values allowed, but it may allowed NULL Values
-- CHECK : Will check the given condition on a perticulat column
-- DEFAULT : Used to assign a default value in a Column when no value is specified

CREATE TABLE EMP1 (
  Eid INT ,
  Ename VARCHAR(20),
  Eage INT,
  Salary Money CHECK (Salary > 18000)
)


INSERT into EMP1 VALUES (1, 'Suresh', 20, 20000)
INSERT into EMP1 VALUES (2, 'Ramesh', 22, 15000) -- Error bcz Salary is less than 18000

-- Default Constraint

CREATE TABLE EMP1 (
  Eid INT ,
  Ename VARCHAR(20),
  Eage INT Default 18,

)

INSERT into EMP1 (Eid, Ename, Eage) VALUES (1, 'Suresh', 15) 
INSERT into EMP1 (Eid, Ename) VALUES (2, 'Ramesh')  -- Eage will be 18 by default

SELECT * FROM EMP1

DROP TABLE EMP1


-- Cobination of all 
CREATE TABLE EMP1 (
  Eid INT UNIQUE NOT NULL,
  Ename VARCHAR(20) NOT NULL,
  Eage INT CHECK (Eage >= 18),
  Salary Money DEFAULT 18000,
)


INSERT into EMP1 VALUES (1, 'Suresh', 20, 20000)
INSERT into EMP1 VALUES (1, 'Ramesh', 22, 15000) -- Error bcz duplicate value not allowed in UNIQUE constraint
INSERT into EMP1 (Eid, Ename, Eage) VALUES (2, 'Ramesh', 16) -- Error bcz Eage is less than 18
INSERT into EMP1 (Eid, Ename) VALUES (3, 'Mahesh')  -- Salary will be 18000 by default
SELECT * FROM EMP1



-- Product Table 
CREATE TABLE Product ( productID INT UNIQUE NOT NULL,
productName VARCHAR(50) NOT NULL,
productStatus VARCHAR(20) DEFAULT 'Pending' CHECK (productStatus IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
)

INSERT into Product (productID, productName, productStatus) VALUES (1, 'Laptop', 'Shipped')
INSERT into Product (productID, productName) VALUES (2, 'Mobile') -- productStatus will be 'Pending' by default
INSERT into Product (productID, productName, productStatus) VALUES (3, 'Tablet', 'In Transit') -- Error bcz productStatus not in the CHECK condition
SELECT * FROM Product



DROP TABLE EMP1

CREATE TABLE EMP1 (
  Eid INT PRIMARY KEY,
  Ename VARCHAR(20) NOT NULL,
  Eage INT
)


INSERT INTO EMP1 VALUES (1, 'Suresh', 20)

ALTER Table EMP1 Add EmailID VARCHAR(50) 

INSERT into EMP1 VALUES (3, 'Mahesh', 22, 'mahesh@gmailcom');
INSERT into EMP1 VALUES (2, 'Ramesh', 25, 'ramesh@gmailcom');

SELECT * FROM EMP1

Alter TABLE EMP1 ADD CONSTRAINT UC_Cons UNIQUE (EmailID)
-- UC means Unique Constraint
-- Now we cant able to add a same email id in the table
-- If the same email id is present in the table then we cant able to add constraint using alter in to the table 

ALTER TABLE EMP1 ADD CONSTRAINT CK_cons CHECK (Eage >= 18)

INSERT into EMP1 VALUES (4, 'Vikash', 16, 'vikash@gmailcom'); -- Error bcz Eage is less than 18

CREATE Table ProductDetails ( 
  PID INT,
  Pname VARCHAR(50),
  Quantity Int,
  Status Varchar(30)
)

INSERT into ProductDetails VALUES (1, 'Laptop', 10, 'Shipped')
INSERT into ProductDetails VALUES (2, 'Mobile', 20, 'In Transit')
INSERT into ProductDetails (PID, Pname, Quantity) VALUES (3, 'Tablet', 15)

SELECT * From ProductDetails

ALTER TABLE ProductDetails ADD CONSTRAINT DF_Status DEFAULT 'Pending' FOR Status
-- IN default we have to write for Status col only
-- Now if we dont provide any value for Status col then it will take 'Pending' as default value

INSERT into ProductDetails (PID, Pname, Quantity) VALUES (4, 'Desktop', 5)


-- Drop Constraints
ALTER Table EMP1 DROP CONSTRAINT UC_Cons
ALTER Table EMP1 DROP CONSTRAINT CK_cons

CREATE TABLE New_Emp (
  Eid INT Unique,
  Ename VARCHAR(20) NOT NULL,
  Eage INT,
  Bid INT UNIQUE
)

Alter TABLE New_Emp ADD EmailID VARCHAR(50) UNIQUE

-- IT remove this Unique
ALTER Table New_Emp ALTER COLUMN Eid INT 

Drop TABLE New_Emp
-- PRIMARY KEY (UNIQUE + NOTNULL)
-- FOREIGN KEY(IS USED TO ESTABLISH THE RELATIONSHIP BETWEEN 2 TABLES)
-- TO MAINTAIN REFERENTIAL DATA INTEGRITY
DROP TABLE EMP1
CREATE TABLE EMP1
(EID INT, ENAME VARCHAR(20) PRIMARY KEY)
INSERT INTO EMP1 VALUES
(4,'Suresh'),
(1,'Mahesh'),
(3,'Ramesh')
SELECT * FROM EMP1

CREATE TABLE Courses
(CID INT,
CNAME VARCHAR(20),
CFEE MONEY)

INSERT INTO Courses VALUES
(20,'QA',1000),
(20,'Cloud',2000),
(30,'GenAI',3000)

ALTER TABLE Courses
ALTER COLUMN CID INT NOT NULL

ALTER TABLE Courses
ADD CONSTRAINT PK_Cource PRIMARY KEY (CID)

SELECT * FROM Courses
DELETE FROM Courses

CREATE TABLE Student
(SID INT, Sname VARCHAR(20), CID INT FOREIGN KEY REFERENCES Courses (CID) ON UPDATE CASCADE ON DELETE CASCADE)
INSERT INTO Student VALUES
(1,'Suresh',10),
(2,'Mahesh',20),
(3,'Jayesh',30)

DELETE FROM Courses
WHERE CID=40
SELECT * FROM Courses
SELECT * FROM Student

UPDATE Courses
SET CID=40
WHERE CNAME='Full Stack'

DROP TABLE Courses
DROP TABLE Student

CREATE TABLE COURSES1 (CID INT,SID INT, CNAME VARCHAR(20), PRIMARY KEY(CID,SID))

CREATE TABLE STUDENT1 (CID INT, SID INT, SNAME VARCHAR(20), FOREIGN KEY(CID,SID) REFERENCES COURSES1 (CID,SID))

-- Atleast one commom column between tables
-- Datatype must be same
-- Two types of Joins (ANSI & Non-ANSI)
-- ANSI - using ON keyword
-- Non-ANSI- Using where keyword 

-- Syntax for inner join and remember that after mentioning 
--the join always mention the matching column between them just the way I have written A.Key = B.Key
--Inner Join(Macthing values)
--SELECT * FROM A INNER JOIN B ON A.Key = B.Key

--Left Join(Inner + Left)
--SELECT * FROM A LEFT JOIN B ON A.Key = B.Key

--Right Join(Inner + Right)
--SELECT * FROM A RIGHT JOIN B ON A.Key = B.Key

--Left Join Excluding Inner Join
--SELECT * FROM A LEFT JOIN B ON A.Key = B.Key WHERE B.Key is null

--Right Join Excluding Inner Join
--SELECT * FROM A RIGHT JOIN B ON A.Key = B.Key WHERE A.Key is null

--Full Outer Join(Inner+Left+Right)
--SELECT * FROM A FULL OUTER JOIN B ON A.Key = B.Key

--Findout employees working in same city
--Findout employee working on the same project
--Findout employees having the same salary

SELECT e1.Eid,e1.EnamE,e1.department from Employee1 e1
join Employee1 e2
on e1.department = e2.department
Where e1.eid <> e2.eid

CREATE TABLE Cource ( CID INT, Cname VARCHAR(255), Cfee MONEY)
INSERT INTO Cource VALUES
(10,'Full Stack',1000),
(20,'QA',1000),
(30,'Cloud',2000),
(40,'AI',3000)

CREATE TABLE Student (SID INT, Sname VARCHAR(20), CID INT)
INSERT INTO Student VALUES
(1,'Suresh',10),
(2,'Mahesh',20),
(3,'Jayesh',50)
SELECT * FROM Cource
SELECT * FROM Student

SELECT * FROM Cource 
FULL OUTER JOIN Student 
ON Cource.CID = Student.CID
WHERE Cource.CID IS NULL OR Student.CID is null

--Cross Join (Cartesian Product)
SELECT * FROM Cource,Student 
--This is the short format for appling the cartesian product

CREATE TABLE CUSTOMER (CID INT, CNAME VARCHAR(20), CNO INT)
INSERT INTO CUSTOMER VALUES
(1,'Kushal',25),
(2,'Shakti',26),
(3,'Deep',28),
(4,'Darshan',30),
(5,'Pranav',35)

CREATE TABLE ORD (OID INT, ONAME VARCHAR(20), CID INT,Promocode VARCHAR(20),PaymentMethod VARCHAR(20))
INSERT INTO ORD VALUES
(10,'PIZZA',1,'XYZABC','UPI'),
(20,'PASTA',2,'XYZABD','CASH'),
(30,'TACOS',3,'XZYABC','CARD'),
(40,'NACHOS',4,'ABCXYZ','CASH')


SELECT * FROM CUSTOMER,ORD

SELECT * FROM CUSTOMER
LEFT JOIN ORD
ON CUSTOMER.CID = ORD.CID

SELECT * FROM CUSTOMER
RIGHT JOIN ORD
ON CUSTOMER.CID = ORD.CID

-- NON-ANSI JOINS
--EQUI JOIN (uses only equality operator) =
--NON-EQUI JOIN (Except equality operator) >,<,

SELECT * FROM Cource, Student 
WHERE Cource.CID <> Student.CID 

--ASSIGNMENT RELATED TO JOINS
CREATE TABLE Employee1( EID VARCHAR(20), Ename VARCHAR(20), MID INT, DID INT)
INSERT INTO Employee1 VALUES
('E101','Yash',10,1),
('E102','Shakti',20,2),
('E103','Kushal',30,3),
('E104','Deep',40,4),
('E105','Pranav',50,5)


CREATE TABLE Manager(MID INT, Mname VARCHAR(20))
INSERT INTO Manager VALUES
(10,'Lokesh'),
(20,'Ramesh'),
(50,'Rahul'),
(60,'Kamlesh')

CREATE TABLE Project(PID VARCHAR(20),Pname VARCHAR(20), EID VARCHAR(20))
INSERT INTO Project VALUES
('P1','FINTECH','E101'),
('P2','HEALTH','E102'),
('P3','ADS','E103'),
('P4','SOFTWARE','E104')

CREATE TABLE Department(DID INT, Dname VARCHAR(20))
INSERT INTO Department VALUES
(1,'Full Stack'),
(2,'Data Analyst'),
(3,'BA'),
(4,'QA'),
(5,'AI')

-- 1. Display each employee's name and their corresponding department name.
SELECT E.Ename,D.Dname FROM Employee1 E INNER JOIN Department D ON E.DID = D.DID

--2. List all projects along with the name of the employee assigned to them.
SELECT P.PID,P.Pname,E.Ename from Project P JOIN Employee1 E ON P.EID = E.EID

--3. Show the names of employees and the names of their managers.
SELECT E.Ename,M.Mname from Employee1 E JOIN Manager M ON E.MID = M.MID

--4. Display the Project ID and the Department ID for every project.
SELECT P.PID, D.DID FROM Project P
JOIN Employee1 E 
ON P.EID = E.EID
JOIN Department D
ON E.DID = D.DID

--5. List employees who work in the 'IT' department.
SELECT E.Ename,D.Dname FROM Employee1 E 
JOIN Department D
ON E.DID = D.DID
WHERE D.Dname='BA'

--6. Display employee names and their manager names for all employees in departmentID 1.
SELECT E.Ename, M.Mname FROM Employee1 E 
JOIN Manager M 
ON E.MID = M.MID 
WHERE E.DID = 1

--7. Show all projects handled by ‘Deep’.
SELECT P.Pname, E.Ename FROM Project P
JOIN Employee1 E
ON P.EID = E.EID
WHERE E.Ename = 'Deep'

--8. Find the department name associated with Project ID P3.
SELECT D.Dname FROM Department D 
JOIN Employee1 E 
ON D.DID=E.DID
JOIN Project P 
ON E.EID=P.EID
WHERE P.PID = 'P3'

--9. List all employees whose manager's name is 'Rahul'.
SELECT E.Ename FROM Employee1 E
JOIN Manager M
ON E.MID = M.MID
WHERE M.Mname='Rahul'

--10.Display the count of employees in each department name.
SELECT D.Dname, COUNT(E.EID) FROM Department D 
LEFT JOIN Employee1 E
ON D.DID = E.DID
GROUP BY D.Dname

--11. List all departments and the employees working in them (including departments with no employees).
SELECT D.Dname, E.Ename FROM Department D 
LEFT JOIN Employee1 E
ON D.DID=E.DID

--12.Display all employees and the projects they are assigned to (including those with no projects).
SELECT E.Ename, P.Pname FROM Employee1 E 
LEFT JOIN Project P
ON E.EID = P.EID

--13. Show the names of employees, their department names, and their manager names in one result.
SELECT E.Ename, D.Dname, M.Mname FROM Employee1 E 
JOIN Department D 
ON E.DID = D.DID
JOIN Manager M 
ON E.MID = M.MID

--14. Find all projects and the department name they belong to.
SELECT P.Pname, D.Dname FROM Project P 
JOIN Employee1 E
ON P.EID=E.EID
JOIN Department D 
ON E.DID=D.DID

--15. List all managers and the names of employees reporting to them (including managers with no reporters).


SELECT * FROM Employee1
SELECT * FROM Department

--CREATE VIEW <VIEWNAME>
--AS
--
CREATE VIEW vw_Employeedetails
AS
SELECT Ename, EID
FROM Employee1

--ENCRYPTION CAN BE USED WITH CREATE AND UPDATE BOTH KEYWORDS
ALTER VIEW vw_Employeedetails
WITH ENCRYPTION
AS
SELECT EID, Ename, MID
FROM Employee1

UPDATE vw_Employeedetails
SET Department = 'AI'
WHERE EID = 1
-- YOU CAN UPDATE MORE THAN ONE FIELDS WHILE USING UPDATE 
-- VIEW IS LIMITIED TO UPDATE SINGLE TABLE AND CANNOT CHANGE TWO BASE TABLES
SELECT * FROM vw_EmployeeProjectdetails

DROP VIEW vw_Employeedetails 
sp_helptext 'vw_EmployeeProjectdetails'
sp_help 'vw_EmployeeDetails'
--This difference is mostly asked in interviews the difference between the sp_helptext and sp_help

--Fetch employee name, namager name, department name and project name

CREATE VIEW vw_Employeedetails
AS
SELECT E.Ename, P.Pname, D.Dname, M.Mname
FROM Employee1 E
JOIN Manager M
ON E.MID=M.MID
JOIN Department D
ON E.DID=D.DID
JOIN Project P
ON E.EID=P.EID

SELECT * FROM vw_Employeedetails

CREATE TABLE E1 ( Eid INT, EnamE VARCHAR(20), Did INT)
INSERT INTO E1 VALUES
(1,'Suresh',10),
(2,'Jayesh',10),
(3,'Mahesh',30)

CREATE TABLE D1 ( Did INT, DnamE VARCHAR(20))
INSERT INTO D1 VALUES
(10,'IT'),
(20,'Cloud'),
(30,'AI')
Drop table D1
CREATE VIEW vw_Employeeview
as
SELECT E.Eid,E.EnamE, D.DnamE
FROM E1 E
JOIN 
D1 D
ON E.Did=D.Did
DROP VIEW vw_Employeeview
SELECT * FROM vw_Employeeview

CREATE TABLE Test (TID INT, Tname VARCHAR(20), City VARCHAR(20))
INSERT INTO Test VALUES
(1,'Testing','Vadodara'),
(2,'QA','Surat'),
(3,'BA','Dakor')
Drop table Test
CREATE VIEW vw_hello
WITH SCHEMABINDING 
AS SELECT TID,Tname
FROM dbo.Test

drop view vw_hello

SELECT * FROM vw_hello
ALTER TABLE Test
DROP COLUMN TID

SELECT NAME FROM sys.views
--This query provides the names of the views used in the database.
--So that you can choose the view name accordingly

--Index (Clustered and Non Clustered)
--Clustored index is one and Non Clustered can be multiple
--Clustured index will refer the physical index of the table
--Syntax
--CREATE INDEX <IX_Indexname>
--on <Tablename> <Colname>

CREATE INDEX IX_EmpSalary
ON Employee1 (Eid ASC)

--Composite index
CREATE INDEX IX_
--Syntax to Drop the index
--DROP INDEX tablename.indexname
DROP INDEX Employee1.IX_EmpSalary

-- Clustered Index
CREATE CLUSTERED INDEX IX_EmpEID
ON Employee1 (Eid)

SELECT * FROM Employee1
INSERT INTO Employee1 VALUES
('E109','Naresh',70,9),
('E110','Saresh',90,10)

CREATE TABLE kush (KID INT PRIMARY KEY, KNAME VARCHAR(20),DID INT,ABC INT)
INSERT INTO kush VALUES
(1,'Pranav',89,90),
(4,'Madhav',78,52),
(2,'Unnati',71,85),
(3,'Hiral',75,93)

CREATE CLUSTERED INDEX IX_kushID
ON kush (DID)

SELECT * FROM kush
--Unique index
--CREATE UNIQUE INDEX IX_EID
--ON Employee(EID)


DROP TABLE kush

-- Functions
-- CAST (Convert datatype)
SELECT Ename, '$' + CAST(Esalary as varchar)
FROM Employee1
--The above query will add the dollar sign to the salary

--coalesce (to find first not null value)
SELECT EID, Ename, COALESCE(officeeemail,personalemail,'No email found')
--This query will check the officemail first if that is not found then it will heck the personalemail
--If personalemail is also not found then the message will be shown that no email found

datediff(Interval,Start_date,End_date)
-- For how long the employee is working in an organization
-- Find out employee age

SELECT Ename, DOB, datediff(year, DOB, getdata) From Employee1

replace (String,string_to_replace,newString)
Select Replace('Suresh  Patel','  ',' ')
SELECT replace('Phone','+91','0')

--trim (used for removing whitespaces)
SELECT LTRIM(Ename) FROM Employee1

--len (To get the length of the name)
Select len(Ename) from Employee1

--UPPER
SELECT UPPER(Ename) from Employee1

--LOWER
SELECT LOWER(Ename) FROM Employee1

--GETDATE()
--CONCAT
SELECT CONCAT ( 'Suresh', Null) --This is concatenation thats why it gives output of Suresh

SELECT 'Suresh' + ' ' + null --This is arithmetic operation and gives null as output

-- Advanced SQL
-- Stored Procedure
--There are 3 ways of running the procedure
CREATE Proc spGetEmpSalary
As
Begin
SELECT EID, Ename from Employee1
End

ALTER proc spGetEmpSalary
As
Begin
SELECT EID, Department,Esalary from Employee1
End
--Just replace CREATE with alter to alter the procedure if you want to change anything in it
--There are 3 ways of running the stored procedure
EXEC spGetEmpSalary
EXECUTE spGetEmpSalary

sp_helptext spGetEmpSalary
sp_help spGetEmpSalary

Drop proc spGetEmpSalary

CREATE proc <name>
@ID int 
As
Begin
Select * from Employee1 where EID=@ID
end

Select * from Employee1
--Stored procedure using 

-- Get orders placed by customers by order id 
spGetEmpSalary 

CREATE PROC spGetEmpDeptCount
@Deptname varchar(20),
@Empcount INT Output
AS
Begin
	SELECT @Empcount = count(EID) from Employee1
	WHERE Department = @Deptname
End

Declare @Total INT
EXECUTE spGetEmpDeptCount 'Cloud', @Total  
Print @Total

CREATE proc spGetCustomerSpending
As
Begin
Select @TotalSpend = 

-- Total revenue by Customer
Create proc AddingNewProduct
@Productname
as
Begin
Insert into Product(productName, price

spUpdateProductPrice 1, 
--Delete from product where product id is equal to 
