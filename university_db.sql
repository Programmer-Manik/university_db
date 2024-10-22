-- Active: 1723122519319@@127.0.0.1@5432@university_db

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
