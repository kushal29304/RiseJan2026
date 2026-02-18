CREATE DATABASE StudentDB
USE StudentDB

CREATE TABLE Student_Assessments (
    assessment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    student_name VARCHAR(50) NOT NULL,
    course_name VARCHAR(50) NOT NULL,
    assessment_type VARCHAR(20),
    assessment_date DATE NOT NULL,
    total_marks INT,
    obtained_marks INT,
    attendance_status VARCHAR(10),
    trainer_name VARCHAR(50),
    remarks VARCHAR(100)
)

INSERT INTO Student_Assessments VALUES
(1,101,'Amit','Power BI','Quiz','2024-01-10',100,80,'Present','Rahul Sharma',NULL),
(2,101,'Amit','Power BI','Assignment','2024-01-20',100,90,'Present','Rahul Sharma',NULL),
(3,102,'Anita','SQL','Quiz','2024-01-15',50,45,'Present','Ramesh Jain',NULL),
(4,102,'Anita','SQL','Exam','2024-02-15',100,35,'Present','Ramesh Jain','needs improvement'),
(5,103,'Ravi','Azure','Assignment','2023-12-10',100,0,'Absent','Anand Patel',NULL),
(6,103,'Ravi','Azure','Exam','2024-01-25',100,60,'Present','Anand Patel',NULL),
(7,104,'Akash','Power BI','Exam','2024-02-20',100,100,'Present','Rahul Sharma','excellent'),
(8,104,'Akash','Power BI','Quiz','2024-01-05',50,50,'Present','Rahul Sharma',NULL),
(9,105,'Meena','SQL','Project','2024-03-10',100,70,'Present','Ramesh Jain',NULL),
(10,105,'Meena','SQL','Quiz','2024-01-18',50,45,'Present','Ramesh Jain',NULL),
(11,106,'Neha','Azure','Quiz','2024-01-12',50,0,'Absent','Anand Patel',NULL),
(12,106,'Neha','Azure','Assignment','2024-02-01',100,55,'Present','Anand Patel',NULL),
(13,107,'Arjun','Power BI','Assignment','2024-02-05',100,65,'Present','Rahul Sharma',NULL),
(14,107,'Arjun','Power BI','Exam','2024-03-01',100,30,'Present','Rahul Sharma','failed'),
(15,108,'Asha','SQL','Quiz','2024-01-08',50,40,'Present','Ramesh Jain',NULL),
(16,108,'Asha','SQL','Exam','2024-02-18',100,75,'Present','Ramesh Jain',NULL),
(17,109,'Kiran','Azure','Project','2024-03-12',100,85,'Present','Anand Patel',NULL),
(18,109,'Kiran','Azure','Quiz','2024-01-22',50,0,'Absent','Anand Patel',NULL),
(19,110,'Anil','Power BI','Quiz','2024-01-11',50,38,'Present','Rahul Sharma',NULL),
(20,110,'Anil','Power BI','Assignment','2024-02-11',100,42,'Present','Rahul Sharma',NULL),
(21,111,'Rohit','SQL','Exam','2024-02-22',100,90,'Present','Ramesh Jain',NULL),
(22,112,'Ananya','Power BI','Quiz','2024-01-14',50,48,'Present','Rahul Sharma','late submission'),
(23,113,'Amit','Azure','Exam','2024-03-15',100,88,'Present','Anand Patel',NULL),
(24,114,'Pooja','SQL','Assignment','2024-01-30',100,0,'Absent','Ramesh Jain',NULL),
(25,115,'Dev','Power BI','Project','2024-03-18',100,92,'Present','Rahul Sharma',NULL)


SELECT * FROM Student_Assessments

--1. Display records with obtained marks > 70%.
SELECT * FROM Student_Assessments WHERE obtained_marks > 40

--2. Students scoring full marks.
SELECT * FROM Student_Assessments WHERE obtained_marks = total_marks

--3. Absent students.
SELECT * FROM Student_Assessments WHERE attendance_status = 'Absent'

--4. Marks between 40 and 60.
SELECT * FROM Student_Assessments WHERE obtained_marks BETWEEN 40 AND 60

--5. Assessments after 1 Jan 2024.
SELECT * FROM Student_Assessments WHERE assessment_date > '2024-01-01'

--6. Assessments not by Rahul Sharma.
SELECT * FROM Student_Assessments WHERE student_name <> 'Rahul Sharma'

--7. Power BI Project assessments.
SELECT * FROM Student_Assessments WHERE course_name = 'Power BI' AND assessment_type = 'Project'

--8. SQL or Azure course records.
SELECT * FROM Student_Assessments WHERE course_name IN  ('SQL', 'Azure') 

--9. Students not absent.
SELECT * FROM Student_Assessments WHERE attendance_status <> 'Absent'

--10. Marks <50 and present.
SELECT * FROM Student_Assessments WHERE obtained_marks < 50 AND attendance_status = 'Present'

--11. Names starting with A.
SELECT * FROM Student_Assessments WHERE student_name LIKE 'A%'

--12. Trainers containing 'an'.
SELECT * FROM Student_Assessments WHERE trainer_name LIKE '%an%'

--13. Courses ending with BI.
SELECT * FROM Student_Assessments WHERE course_name LIKE '%BI'

--14. Remarks containing 'late'.
SELECT * FROM Student_Assessments WHERE remarks LIKE '%late%'

--15. Calculate percentage
SELECT student_name, student_id, (obtained_marks  * 100.0 / total_marks) AS percentage FROM Student_Assessments

--16. Failed students (<40%).
SELECT student_name AS 'Failed Students' FROM Student_Assessments WHERE (obtained_marks  * 100.0 / total_marks) < 40

--17. Grace marks for 35–39.
SELECT assessment_id, student_name, obtained_marks, (obtained_marks + 5) AS 'Grace Marks'  FROM Student_Assessments WHERE obtained_marks BETWEEN 35 AND 39

--18. Add 5% marks to quizzes (display).
SELECT assessment_id, student_name, obtained_marks, (obtained_marks + (obtained_marks * 0.05)) AS 'Increased Marks by 5%'  FROM Student_Assessments WHERE assessment_type = 'quiz' 

--19. Average marks per course.
SELECT course_name, (SUM(obtained_marks) * 100.0 / SUM(total_marks)) AS 'Course Average Percentage' FROM Student_Assessments GROUP BY course_name

--20. Max & Min per assessment type.
SELECT assessment_type, MAX(obtained_marks) AS 'Max Marks', MIN(obtained_marks) AS 'Min Marks' FROM Student_Assessments GROUP BY assessment_type

--21. Total absents per course.
SELECT course_name, COUNT(*) AS 'Total Absents' FROM Student_Assessments WHERE attendance_status = 'Absent' GROUP BY course_name

--22. Total assessments per trainer.
SELECT trainer_name, COUNT(*) AS 'Total Assessments' FROM Student_Assessments GROUP BY trainer_name

--23. Pass count per course.
SELECT course_name, COUNT(*) AS 'Passed Students' FROM Student_Assessments WHERE (obtained_marks * 100.0 / total_marks) >= 40 GROUP BY course_name

--24. Trainers with >5 assessments.
SELECT trainer_name, COUNT(*) AS 'Total Assessments' FROM Student_Assessments GROUP BY trainer_name HAVING COUNT(*) > 5

--25. Students with >3 assessments.
SELECT student_name, COUNT(*) AS 'Total Assessments' FROM Student_Assessments GROUP BY student_name HAVING COUNT(*) > 3

--26. Courses with avg >65.
SELECT course_name, (SUM(obtained_marks) * 100.0 / SUM(total_marks)) AS 'Course Average Percentage' FROM Student_Assessments GROUP BY course_name HAVING (SUM(obtained_marks) * 100.0 / SUM(total_marks)) > 65

--27. Assessment types with >20% absentees.


--28. Students above overall average.