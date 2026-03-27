use xyz;

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

-- 1
SELECT 
    FIRST_NAME AS "First Name",
    LAST_NAME AS "Last Name"
FROM employees;

-- 2
SELECT DISTINCT DEPARTMENT_ID 
FROM employees;

-- 3
SELECT * 
FROM employees
ORDER BY FIRST_NAME DESC;

-- 4
SELECT 
    FIRST_NAME,
    LAST_NAME,
    SALARY,
    SALARY * 0.15 AS PF
FROM employees;

-- 5
SELECT 
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    SALARY
FROM employees
ORDER BY SALARY ASC;

-- 6
SELECT 
    SUM(SALARY) AS Total_Salary
FROM employees;

-- 7
SELECT 
    MAX(SALARY) AS Max_Salary,
    MIN(SALARY) AS Min_Salary
FROM employees;

-- 8
SELECT 
    AVG(SALARY) AS Avg_Salary,
    COUNT(*) AS Total_Employees
FROM employees;

-- 9
SELECT 
    COUNT(*) AS Number_of_Employees
FROM employees;

-- 10
SELECT 
    COUNT(DISTINCT JOB_ID) AS Number_of_Jobs
FROM employees;

-- Question 2

CREATE TABLE employee (
    employee_name VARCHAR(100) PRIMARY KEY,
    street        VARCHAR(100),
    city          VARCHAR(100)
);

CREATE TABLE works (
    employee_name VARCHAR(100),
    company_name  VARCHAR(100),
    salary        DECIMAL(10, 2),
    PRIMARY KEY (employee_name)
);

CREATE TABLE company (
    company_name VARCHAR(100),
    city         VARCHAR(100),
    PRIMARY KEY (company_name, city)
);

CREATE TABLE manages (
    employee_name VARCHAR(100),
    manager_name  VARCHAR(100),
    PRIMARY KEY (employee_name)
);

-- 2.1
SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'First Bank Corporation'
  AND w.salary > 10000;
  
  -- 2.2
  SELECT e.employee_name
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
JOIN company c ON w.company_name = c.company_name
WHERE e.city = c.city;

-- 2.3
SELECT e.employee_name
FROM employee e
JOIN manages m ON e.employee_name = m.employee_name
JOIN employee mgr ON m.manager_name = mgr.employee_name
WHERE e.city = mgr.city
  AND e.street = mgr.street;
  
  -- 2.4
  SELECT e.employee_name
FROM works e
WHERE e.salary > ALL (
    SELECT salary
    FROM works
    WHERE company_name = 'Small Bank Corporation'
);

-- 2.5
SELECT c.company_name
FROM company c
WHERE c.company_name != 'Small Bank Corporation'
GROUP BY c.company_name
HAVING SUM(
    c.city NOT IN (
        SELECT city FROM company WHERE company_name = 'Small Bank Corporation'
    )
) = 0
AND COUNT(DISTINCT c.city) = (
    SELECT COUNT(DISTINCT city)
    FROM company
    WHERE company_name = 'Small Bank Corporation'
);

-- 2.6
SELECT w.employee_name
FROM works w
WHERE w.salary > (
    SELECT AVG(w2.salary)
    FROM works w2
    WHERE w2.company_name = w.company_name
);