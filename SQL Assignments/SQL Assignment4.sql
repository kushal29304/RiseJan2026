USE JANUARY2026
CREATE TABLE Employee_details ( ID INT, NAME VARCHAR(20),AGE INT, SALARY MONEY, DEPARTMENT VARCHAR(20), CITY VARCHAR(20))
INSERT INTO Employee_details VALUES
(1,'Kushal',21,200000,'Full Stack','Vadodara'),
(2,'Shakti',20,250000,'Full Stack','Dakor'),
(3, 'Happin',22,100000,'DA','Gondal'),
(4, 'Happy',18,20000,'Gen AI','New York'),
(5, 'Suresh',24,300000,'QA','Surat'),
(6, 'Shiv',20,210000,'Mern Stack','Pavagadh'),
(7, 'Deep',25,270000,'Cyber Security','Vadodara'),
(8, 'Darshan',21,200000,'Laravel','Godhra'),
(9, 'Pranav',21,20000,'Power BI','Vadodara'),
(10, 'Shashwat',21,200000,'Full Stack','Vadodara')

SELECT * FROM Employee_details

--1) Return the Name column from Employeedetails where the Name column is equal to "Suresh".
SELECT * FROM Employee_details WHERE NAME='Suresh'

--2) Find the top 100 rows from Employeedetails where the Salary is not equal to 0.
SELECT TOP 100 * FROM Employee_details WHERE SALARY <> 0

--3) Return all rows and columns from Employeedetails where the employee’s Name starts with a letter less than “D”.
SELECT * FROM Employee_details WHERE NAME LIKE '[A-C]%'

--4) Return all rows and columns from Employeedetails where the City column is equal to "New York".
SELECT * FROM Employee_details WHERE CITY = 'New York'

--5) Return the Name column from Employeedetails where the Name is equal to "Ramesh". Give the column alias "Employee Name".
SELECT NAME AS 'Employee Name' FROM Employee_details WHERE NAME='Ramesh'

--6) Using the Employeedetails table, find all employees with a Department equal to "QA" or all employees who have an Age greater than 23 and a Salary less than 50000.
SELECT * FROM Employee_details WHERE DEPARTMENT = 'QA' OR (AGE>23 AND SALARY<50000)

--7) Find all employees from Employeedetails who have a Department in the list of: "DA", "FS",
--and "DE". Complete this query twice – once using the IN operator in the WHERE clause and a
--second time using multiple OR operators.

SELECT * FROM Employee_details WHERE DEPARTMENT IN ('DA','FS','DE')

SELECT * FROM Employee_details WHERE DEPARTMENT = 'DA' OR  DEPARTMENT= 'FS' OR  DEPARTMENT= 'DE'

--8) Find all employees from Employeedetails whose Name starts with the letter “A”.
SELECT * FROM Employee_details WHERE NAME= 'A%'

--9) Find all employees from Employeedetails whose Name ends with the letter “a”.
SELECT * FROM Employee_details WHERE NAME= '%a'

--10) Return all columns from the Employeedetails table for all employees who have a
--Department. That is, return all rows where the Department column does not contain a NULL
--value.
SELECT * FROM Employee_details WHERE DEPARTMENT IS NOT NULL 

--11) Return the EID and Salary columns from Employeedetails for all employees who have a
--Department and whose Salary exceeds 20,000.
SELECT ID,SALARY FROM Employee_details WHERE DEPARTMENT IS NOT NULL AND SALARY>20000