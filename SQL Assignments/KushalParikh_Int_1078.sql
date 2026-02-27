CREATE DATABASE KushalParikh_Int_1078;
USE KushalParikh_Int_1078;

CREATE TABLE Specializations ( SpecializationID INT PRIMARY KEY, SpecializationName VARCHAR(50) );
INSERT INTO Specializations VALUES
(1, 'BA'),
(2, 'IT'),
(3, 'SE'),
(4, 'AI');

CREATE TABLE Students ( StudentID INT PRIMARY KEY, FirstName VARCHAR(20), LastName VARCHAR(20),
age INT, SpecializationID INT);
INSERT INTO Students VALUES
(1, 'Kushal', 'Parikh', 20, 1),
(2, 'Deep', 'Patel', 22, 2),
(3, 'Shakti', 'Raolji', 21, 3),
(4, 'Happy', 'Patel', 19, 4);

CREATE TABLE Cources (CourseID INT PRIMARY KEY, CourseName VARCHAR(20), Credits INT);
INSERT INTO Cources VALUES
(1, 'Database', 3),
(2, 'Java', 4),
(3, 'Software Engineering', 3),
(4, 'Artificial Intelligence', 4);

CREATE TABLE Enrollments ( EnrollmentID INT PRIMARY KEY, StudentID INT,
 CourseID INT, GRADE VARCHAR(20));
INSERT INTO Enrollments VALUES
(1, 1, 1, 'A'),
(2, 2, 2, 'C'),
(3, 3, 3, 'B'),
(4, 4, 4, 'A');

-- 1. Retrieve a list of Students and their Specialization names. 
SELECT s.FirstName, s.LastName, sp.SpecializationName
FROM Students s
JOIN Specializations sp ON s.SpecializationID = sp.SpecializationID;

-- 2. List all cource names that 'Deep Patel' is enrolled in.
SELECT c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Cources c ON e.CourseID = c.CourseID
WHERE s.FirstName = 'Deep' AND s.LastName = 'Patel';

-- 3. Display Student names along with the Grade they received in 'Java'.
SELECT s.FirstName, s.LastName, e.GRADE
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Cources c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Java';

-- 4. Show all specializations that currently have no students assigned.
SELECT sp.SpecializationName
FROM Specializations sp
LEFT JOIN Students s ON sp.SpecializationID = s.SpecializationID
WHERE s.StudentID IS NULL;

-- 5. List every Enrollment ID with the corresponding 
--    Student's full name and the course credits.
SELECT e.EnrollmentID, s.FirstName, s.LastName AS StudentName, c.Credits
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Cources c ON e.CourseID = c.CourseID;

-- 6. Count how many students are enrolled in each specialization, 
--    but only show specialization with more than 5 students.
SELECT sp.SpecializationName, COUNT(s.StudentID) AS StudentCount
FROM Specializations sp
JOIN Students s ON sp.SpecializationID = s.SpecializationID
GROUP BY sp.SpecializationName
HAVING COUNT(s.StudentID) > 5;

-- 7. Find Studnets that are involved in 3 or more courses.
SELECT s.FirstName, s.LastName, COUNT(e.CourseID) AS CourseCount
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(e.CourseID) >= 3; 

-- 8. Calculate the total number of credits assigned to StudentID 1.


-- 9. Select all Students whose age is between 18 and 22.
SELECT * FROM Students WHERE age BETWEEN 18 and 22;

-- 10. Find the name of Students who are enrolled in 'Java' course.
SELECT s.Firstname, s.Lastname from Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Cources c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Java';
