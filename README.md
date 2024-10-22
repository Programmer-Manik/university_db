
you will work with PostgreSQL, a powerful open-source relational database management system. Your task involves creating 03 tables based on the provided sample data and then writing and executing queries to perform various database operations such as creating, reading, updating, and deleting data. Additionally, you will explore concepts like LIMIT and OFFSET, JOIN operations, GROUP BY, aggregation, and LIKE.
---

**Instructions:**

1. **Database Setup:**

   -  Install PostgreSQL on your system if not already installed.
   -  Create a fresh database titled "university_db" or any other appropriate name.

2. **Table Creation:**

   **Create a "students" table with the following fields:**

   -  `student_id (Primary Key)`: Integer, unique identifier for students.
   -  `student_name`: String, representing the student's name.
   -  `age`: Integer, indicating the student's age.
   -  `email`: String, storing the student's email address.
   -  `frontend_mark`: Integer, indicating the student's frontend assignment marks.
   -  `backend_mark`: Integer, indicating the student's backend assignment marks.
   -  `status`: String, storing the student's result status.

   **Create a "courses" table with the following fields:**

   -  `course_id (Primary Key)`: Integer, unique identifier for courses.
   -  `course_name`: String, indicating the course's name.
   -  `credits`: Integer, signifying the number of credits for the course.

   **Create an "enrollment" table with the following fields:**

   -  `enrollment_id (Primary Key)`: Integer, unique identifier for enrollments.
   -  `student_id (Foreign Key)`: Integer, referencing `student_id` in the "Students" table.
   -  `course_id (Foreign Key)`: Integer, referencing `course_id` in the "Courses" table.

---

### Sample Data

**Insert the following sample data into the "students" table:**

| student_id | student_name | age | email              | frontend_mark | backend_mark | status |
| ---------- | ------------ | --- | ------------------ | ------------- | ------------ | ------ |
| 1          | Sameer       | 21  | sameer@example.com | 48            | 60           | NULL   |
| 2          | Zoya         | 23  | zoya@example.com   | 52            | 58           | NULL   |
| 3          | Nabil        | 22  | nabil@example.com  | 37            | 46           | NULL   |
| 4          | Rafi         | 24  | rafi@example.com   | 41            | 40           | NULL   |
| 5          | Sophia       | 22  | sophia@example.com | 50            | 52           | NULL   |
| 6          | Hasan        | 23  | hasan@gmail.com    | 43            | 39           | NULL   |

**Insert the following sample data into the "courses" table:**

| course_id | course_name | credits |
| --------- | ----------- | ------- |
| 1         | Next.js     | 3       |
| 2         | React.js    | 4       |
| 3         | Databases   | 3       |
| 4         | Prisma      | 3       |

**Insert the following sample data into the "enrollment" table:**

| enrollment_id | student_id | course_id |
| ------------- | ---------- | --------- |
| 1             | 1          | 1         |
| 2             | 1          | 2         |
| 3             | 2          | 1         |
| 4             | 3          | 2         |

---

### Run SQL queries to complete the following tasks:

#### Query 1:

Insert a new student record with the following details:

-  Name: YourName
-  Age: YourAge
-  Email: YourEmail
-  Frontend-Mark: YourMark
-  Backend-Mark: YourMark
-  Status: NULL

**Note:** You can choose random values for the frontend_mark, backend_mark, and other fields (except NULL for the status).

#### Query 2:

Retrieve the names of all students who are enrolled in the course titled 'Next.js'.

**Sample Output:**

| student_name |
| ------------ |
| Sameer       |
| Zoya         |

#### Query 3:

Update the status of the student with the highest total (`frontend_mark + backend_mark`) to 'Awarded'.

#### Query 4:

Delete all courses that have no students enrolled.

#### Query 5:

Retrieve the names of students using a limit of 2, starting from the 3rd student.

**Sample Output:**

| student_name |
| ------------ |
| Nabil        |
| Rafi         |

#### Query 6:

Retrieve the course names and the number of students enrolled in each course.

**Sample Output:**

| course_name | students_enrolled |
| ----------- | ----------------- |
| Next.js     | 2                 |
| React.js    | 2                 |

#### Query 7:

Calculate and display the average age of all students.

**Sample Output:**

| average_age |
| ----------- |
| 22.33       |

#### Query 8:

Retrieve the names of students whose email addresses contain 'example.com'.

**Sample Output:**

| student_name |
| ------------ |
| Sameer       |
| Zoya         |
| Nabil        |
| Rafi         |
| Sophia       |

---

### Prepare the SQL code for table creation, sample data insertion, and the eight queries in a text document or your preferred format. Include comments explaining each query's purpose and functionality. Save your document as "PostgreSQL.sql" or any other appropriate name.

---

-------------------------------------------------------------------------
----------< Questions (Answer 10 Questions) Section start >--------------
-------------------------------------------------------------------------



###1 What is PostgreSQL? <Br>
"PostgreSQL is an open-source object-relational database management system It is based on Structured Query Language and handles database management PostgreSQL provides powerful data types transaction support and multiple user support" --



###2 What is the purpose of a database schema in PostgreSQL?
A database schema is the structure or design of the database defining tables views indexes and relationships. It indicates the organization and structure of the data



###3 Explain the primary key and foreign key concepts in PostgreSQL.
#1 Primary Key => This is a unique identifier that distinctly identifies each record in a table It cannot be null and must be unique for each record
#2 Foreign Key => This is a column  in one table that establishes a relationship with the Primary Key of another table. It helps maintain relationships within the database



###4 What is the difference between the VARCHAR and CHAR data types?
#1 CHAR => This is a fixed-length string where if the string's length is shorter it is automatically padded
# 2 VARCHAR=> This is a variable-length string that only retains the actual length making it space-efficient



###5 Explain the purpose of the WHERE clause in a SELECT statement.
The WHERE clause specifies conditions for the selection It is used to filter records based on one or more criteria



###6 What are the LIMIT and OFFSET clauses used for?
#1 LIMIT => This restricts the number of results returned
#2 OFFSET => This is used to skip a specified number of results before starting to return results



###7 How can you perform data modification using UPDATE statements?
The UPDATE statement is used to change the values of records in a specific table with the WHERE clause determining which records to modify



###8 What is the significance of the JOIN operation, and how does it work in PostgreSQL?
The JOIN operation is used to combine related data from multiple tables It produces a combined result set from different tables information



###9 Explain the GROUP BY clause and its role in aggregation operations.
The GROUP BY clause groups data based on specific columns It helps generate group-based results using aggregate functions



 ###10 How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?
Aggregate functions like COUNT, SUM and AVG can be calculated using the GROUP BY clause or based on conditions in the WHERE clause



 ###11 What is the purpose of an index in PostgreSQL, and how does it optimize query performance?
An index is used to speed up the search and ordering processes for a database table It enhances query performance by allowing quick access to data



###12 Explain the concept of a PostgreSQL view and how it differs from a table 
A view is a defined query that behaves like a table but does not store actual data. It serves as a virtual representation of data used for security and storage purposes

-------------------------------------------------------------------------
----------< Questions (Answer 10 Questions) Section end >--------------
-------------------------------------------------------------------------
