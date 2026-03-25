use xyz;
-- 1
CREATE TABLE employees (
    EMPLOYEE_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    EMAIL VARCHAR(100),
    PHONE_NUMBER VARCHAR(20),
    HIRE_DATE DATE,
    JOB_ID VARCHAR(20),
    SALARY DECIMAL(10,2),
    COMMISSION_PCT DECIMAL(5,2),
    MANAGER_ID INT,
    DEPARTMENT_ID INT
);

-- 2
SELECT 
    FIRST_NAME AS "First Name",
    LAST_NAME AS "Last Name"
FROM employees;

-- 3
SELECT DISTINCT DEPARTMENT_ID 
FROM employees;

-- 4
SELECT * 
FROM employees
ORDER BY FIRST_NAME DESC;

-- 5
SELECT 
    FIRST_NAME,
    LAST_NAME,
    SALARY,
    SALARY * 0.15 AS PF
FROM employees;

-- 6
SELECT 
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    SALARY
FROM employees
ORDER BY SALARY ASC;

-- 7
SELECT 
    SUM(SALARY) AS Total_Salary
FROM employees;

-- 8
SELECT 
    MAX(SALARY) AS Max_Salary,
    MIN(SALARY) AS Min_Salary
FROM employees;

-- 9
SELECT 
    AVG(SALARY) AS Avg_Salary,
    COUNT(*) AS Total_Employees
FROM employees;

-- 10
SELECT 
    COUNT(*) AS Number_of_Employees
FROM employees;

-- 11
SELECT 
    COUNT(DISTINCT JOB_ID) AS Number_of_Jobs
FROM employees;