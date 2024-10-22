-- Active: 1723122519319@@127.0.0.1@5432@university_db

--Create Database 
CREATE DATABASE university_db;


-- Students Table Create   
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INTEGER,
    email VARCHAR(100) UNIQUE,
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(20)
);
-- Students Table Data Insert 
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES 
('Sameer', 21, 'sameer@example.com', 48, 60, NULL),
('Zoya', 23, 'zoya@example.com', 52, 58, NULL),
('Nabil', 22, 'nabil@example.com', 37, 46, NULL),
('Rafi', 24, 'rafi@example.com', 41, 40, NULL),
('Sophia', 22, 'sophia@example.com', 50, 52, NULL),
('Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);
-- Students Table Data Showing
SELECT * FROM students;


-- Course Table Create
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50),
    credits INTEGER
);
-- Course Table data Insert 
INSERT INTO courses (course_name, credits)
VALUES 
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3);
-- Course Table Data Showing
SELECT * FROM courses;


-- Enrollment Table Create 
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id),
    course_id INTEGER REFERENCES courses(course_id)
);
--Enrollment Table Data Insert
INSERT INTO enrollment (student_id, course_id)
VALUES (1, 1),(1, 2),(2, 1),(3, 2);
-- Enrollment Table Data Showing
SELECT * FROM enrollment;


--Query 1:Insert a new student record with the following details
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES ('Manik', 22, 'semanik@gmail.com', 55, 68, NULL);



--Query 2:Retrieve the names of all students who are enrolled in the course titled Next.js.
SELECT student_name
FROM students
JOIN enrollment ON students.student_id = enrollment.student_id
JOIN courses ON enrollment.course_id = courses.course_id
WHERE courses.course_name = 'Next.js';



--Query 3:Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
UPDATE students
SET status = 'Awarded'
WHERE student_id = (
    SELECT student_id
    FROM students
    ORDER BY (frontend_mark + backend_mark) DESC
    LIMIT 1
);


--Query 4:Delete all courses that have no students enrolled.
DELETE FROM courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id FROM enrollment
);


--Query 5:Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_name
FROM students
ORDER BY student_id
LIMIT 2 OFFSET 2;


--Query 6:Retrieve the course names and the number of students enrolled in each course.
SELECT c.course_name, COUNT(e.student_id) AS students_enrolled
FROM courses c
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;


--Query 7:Calculate and display the average age of all students.
SELECT ROUND(AVG(age), 2) AS average_age FROM students;



