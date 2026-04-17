use employeedb;
-- Procedures

-- 1. Create a procedure to insert a new employee.
DELIMITER $$
CREATE PROCEDURE employeeaddition(
    IN empname VARCHAR(50),
    IN empdepartment VARCHAR(25),
    IN empsalary DECIMAL(10,2)
)
BEGIN
    INSERT INTO employees(name, department, salary)
    VALUES(empname, empdepartment, empsalary);
END $$
DELIMITER ;

CALL employeeaddition('Kushal', 'IT', 123456);

-- 2. Fetch employees details of a specific department.
DELIMITER $$
CREATE PROCEDURE employees_by_department(
    IN empdepartment VARCHAR(100)
)
BEGIN
    SELECT * FROM employees
    WHERE department = empdepartment;
END $$
DELIMITER ;

CALL employees_by_department('IT');

-- 3. Increase employees' salaries by a given percentage.
DELIMITER $$
CREATE PROCEDURE increase_salary(
    IN p_percentage DECIMAL(5,2)
)
BEGIN
    UPDATE employees
    SET salary = salary + (salary * p_percentage / 100);
END $$
DELIMITER ;

CALL increase_salary(10); 

-- 4. Return Maximum salary of employees across all department.
DELIMITER $$
CREATE PROCEDURE maximum_salary()
BEGIN
    SELECT MAX(salary) AS max_salary FROM employees;
END $$
DELIMITER ;

CALL maximum_salary();

-- 5. Delete employee by emp id.
DELIMITER $$
CREATE PROCEDURE delete_employee(
    IN p_emp_id INT
)
BEGIN
    DELETE FROM employees WHERE emp_id = p_emp_id;
END $$
DELIMITER ;

CALL delete_employee(1);

-- Triggers

-- 1. Log whenever a new employee is added to the table.
DELIMITER $$
CREATE TRIGGER after_employee
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_log(action, emp_id, new_salary)
    VALUES('INSERT', NEW.emp_id, NEW.salary);
END $$
DELIMITER ;

-- 2. Prevent negative salary, stop insertion if salary < 0.
-- 3. Log the action when employee is deleted.
DELIMITER $$
CREATE TRIGGER after_deletingemployee
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_log(action, emp_id, old_salary)
    VALUES('DELETE', OLD.emp_id, OLD.salary);
END $$
DELIMITER ;

-- 4. Track salary updates by logging old & new salary
-- 5. Prevent salary increase of the employees by more than 50%.
