-- ASSIGNMENT 3
USE A1

SELECT * FROM Employee

--A. Arithmetic Operators (+, -, , /)
--1. Display the Ename and a 10% bonus amount for every employee
SELECT Ename, Salary * 0.10 AS 'Bonus_Amount' FROM Employee

--2. Calculate the new salary for all employees if everyone gets a flat raise of ?5,000.
SELECT Ename, Salary + 5000 AS 'New_Salary' FROM Employee

--3. If an employee's age is increased by 2, what would it be? Display Ename and ProjectedAge.
SELECT Ename, Eage + 2 AS 'Projected_Age' FROM Employee

--4. Show the Ename and the monthly salary deduction if a 2% professional tax is applied to the current salary.
SELECT Ename, Salary - (Salary * 0.02) AS 'Monthly_Salary_After_Tax' FROM Employee

--B. Comparison Operators (=, <>, !=, <, >, <=, >=)
--6. List all employees who are exactly 20 years old.
SELECT * FROM Employee Where Eage = 20

--7. Find all employees whose salary is greater than 20,000.
SELECT * FROM Employee WHERE Salary > 20000

--8. Display details of employees who do not belong to the 'Cloud' department.
SELECT * FROM Employee Where Department <> 'Cloud'

--9. List employees who were hired at an age of 25 or younger.
SELECT Ename FROM Employee WHERE Eage <= 25

--10. Find employees whose salary is less than or equal to 25,000.
SELECT Ename FROM Employee WHERE Salary <= 235000

--11. List employees who work in the 'IT' department AND have a salary greater than 30,000.
