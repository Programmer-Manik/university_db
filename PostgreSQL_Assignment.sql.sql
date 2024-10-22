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



--Query 8:Retrieve the names of students whose email addresses contain 'example.com'.
SELECT student_name
FROM students
WHERE email LIKE '%example.com%';




-------------------------------------------------------------------------
----------< Questions (Answer 10 Questions) Section start >--------------
-------------------------------------------------------------------------



-- 1 What is PostgreSQL?
"PostgreSQL is an open-source object-relational database management system It is based on Structured Query Language and handles database management PostgreSQL provides powerful data types transaction support and multiple user support" --



-- 2 What is the purpose of a database schema in PostgreSQL?
"A database schema is the structure or design of the database defining tables views indexes and relationships. It indicates the organization and structure of the data"



-- 3 Explain the primary key and foreign key concepts in PostgreSQL.
"1 Primary Key => This is a unique identifier that distinctly identifies each record in a table It cannot be null and must be unique for each record
2 Foreign Key => This is a column  in one table that establishes a relationship with the Primary Key of another table. It helps maintain relationships within the database"



-- 4 What is the difference between the VARCHAR and CHAR data types?
"1 CHAR => This is a fixed-length string where if the string's length is shorter it is automatically padded
 2 VARCHAR=> This is a variable-length string that only retains the actual length making it space-efficient"



-- 5 Explain the purpose of the WHERE clause in a SELECT statement.
"The WHERE clause specifies conditions for the selection It is used to filter records based on one or more criteria"



-- 6 What are the LIMIT and OFFSET clauses used for?
"1 LIMIT => This restricts the number of results returned
 2 OFFSET => This is used to skip a specified number of results before starting to return results"



-- 7 How can you perform data modification using UPDATE statements?
"The UPDATE statement is used to change the values of records in a specific table with the WHERE clause determining which records to modify"



-- 8 What is the significance of the JOIN operation, and how does it work in PostgreSQL?
"The JOIN operation is used to combine related data from multiple tables It produces a combined result set from different tables information"



-- 9 Explain the GROUP BY clause and its role in aggregation operations.
"The GROUP BY clause groups data based on specific columns It helps generate group-based results using aggregate functions"



-- 10 How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?
"Aggregate functions like COUNT, SUM and AVG can be calculated using the GROUP BY clause or based on conditions in the WHERE clause"



-- 11 What is the purpose of an index in PostgreSQL, and how does it optimize query performance?
"An index is used to speed up the search and ordering processes for a database table It enhances query performance by allowing quick access to data"



-- 12 Explain the concept of a PostgreSQL view and how it differs from a table
"A view is a defined query that behaves like a table but does not store actual data. It serves as a virtual representation of data used for security and storage purposes"

-------------------------------------------------------------------------
----------< Questions (Answer 10 Questions) Section end >--------------
-------------------------------------------------------------------------