USE A1
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

--5. List employees who work in the 'BA' department.
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

-- 15. List all managers and the names of employees reporting to them (including
--     managers with no reporters).
SELECT M.Mname, E.Ename FROM Manager M 
LEFT JOIN Employee1 E 
on E.MID=M.MID

-- 16. Find employees who are NOT assigned to any project.
Select E.Ename AS 'Employee with no Project'
From Employee E
Left Join Project P
ON P.EID = E.EID
Where P.PID IS NUll

--17.Display the names of all employees and the names of projects, but only for those in the ‘QA’ department.
Select P.Pname, E.Ename
From Project P
Inner Join Employee E
ON P.EID = E.EID
Inner Join Department D
ON E.DID = D.DID
Where D.Dname = 'IT'

--18. Show the names of managers who are managing employees in the 'Finance' department.
Select M.Mname , E.Ename
FROM Manager M
INNER JOIN Employee E
ON M.MID = E.MID
Inner Join Department D
ON D.DID = E.DID
where D.Dname = 'Finance'

--19.Display Department Name, Employee Name, and Project Name for all matches.
Select D.Dname, E.Ename, P.Pname
From Department D
Inner JOIN Employee E
ON D.DID = E.DID
Inner Join Project P
ON P.EID = E.EID

--20. List all projects and the manager's name responsible for the employee assigned to that project.
Select P.Pname, M.Mname
From Project P
Inner Join Employee E
ON P.EID = E.EID
Inner Join Manager M
ON M.MID = E.MID