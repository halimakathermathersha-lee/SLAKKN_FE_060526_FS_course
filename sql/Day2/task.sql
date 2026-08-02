CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Employees (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

INSERT INTO Employees VALUES
(1, 'Arun', 'Developer', 45000, 'Chennai'),
(2, 'Priya', 'Developer', 50000, 'Chennai'),
(3, 'Karthik', 'Tester', 40000, 'Bangalore'),
(4, 'Divya', 'HR', 35000, 'Coimbatore'),
(5, 'Rahul', 'Developer', 55000, 'Madurai');

SELECT * FROM Employees;


CREATE TABLE Students (
    student_id INT,
    student_name VARCHAR(50),
    course VARCHAR(50),
    age INT,
    city VARCHAR(50)
);

INSERT INTO Students VALUES
(1, 'Aisha', 'BCA', 19, 'Chennai'),
(2, 'Vijay', 'BSc', 21, 'Madurai'),
(3, 'Sneha', 'BCA', 20, 'Chennai'),
(4, 'Ajay', 'BCom', 18, 'Coimbatore'),
(5, 'Meena', 'BSc', 22, 'Chennai'),
(6, 'Ravi', 'BCA', 19, 'Salem'),
(7, 'Nisha', 'BCom', 21, 'Chennai'),
(8, 'Surya', 'BSc', 23, 'Trichy');

SELECT * FROM Students;


UPDATE Employees
SET salary = 75000
WHERE id = 3;

SELECT * FROM Employees
WHERE id = 3;


UPDATE Employees
SET department = 'Team Lead', city = 'Bangalore'
WHERE id = 2;

SELECT * FROM Employees
WHERE id = 2;


DELETE FROM Employees
WHERE id = 5;

SELECT * FROM Employees;


UPDATE Employees
SET salary = salary + 10000
WHERE department = 'Developer';

SELECT * FROM Employees
WHERE department = 'Developer';


UPDATE Students
SET city = 'Coimbatore'
WHERE city = 'Chennai';

SELECT * FROM Students
WHERE city = 'Coimbatore';


DELETE FROM Students
WHERE age < 20;

SELECT * FROM Students;


CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(50),
    price INT,
    category VARCHAR(50)
);

INSERT INTO Products VALUES
(1, 'Laptop', 60000, 'Electronics'),
(2, 'Mobile', 25000, 'Electronics'),
(3, 'Chair', 5000, 'Furniture'),
(4, 'Watch', 3000, 'Accessories'),
(5, 'Keyboard', 1500, 'Electronics');

UPDATE Products
SET price = 28000
WHERE product_id = 2;

DELETE FROM Products
WHERE product_id = 4;

SELECT * FROM Products;


DROP TABLE Employees;

CREATE TABLE Employees (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

INSERT INTO Employees VALUES
(1, 'Arun', 'Developer', 45000, 'Chennai'),
(2, 'Priya', 'Tester', 52000, 'Bangalore'),
(3, 'Karthik', 'Developer', 60000, 'Chennai'),
(4, 'Divya', 'HR', 40000, 'Coimbatore'),
(5, 'Rahul', 'Developer', 55000, 'Madurai'),
(6, 'Meena', 'Tester', 48000, 'Chennai'),
(7, 'Vijay', 'Support', 42000, 'Bangalore'),
(8, 'Nisha', 'Developer', 65000, 'Chennai'),
(9, 'Surya', 'HR', 38000, 'Salem'),
(10, 'Aisha', 'Manager', 80000, 'Chennai');

UPDATE Employees
SET salary = 70000
WHERE id = 4;

UPDATE Employees
SET department = 'Developer'
WHERE id = 7;

DELETE FROM Employees
WHERE id = 9;

SELECT * FROM Employees;

SELECT * FROM Employees
WHERE city = 'Chennai';

SELECT * FROM Employees
WHERE salary > 50000;


DROP TABLE Students;

CREATE TABLE Students (
    student_id INT,
    student_name VARCHAR(50),
    course VARCHAR(50),
    age INT,
    city VARCHAR(50)
);

CREATE TABLE Teachers (
    teacher_id INT,
    teacher_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

INSERT INTO Students VALUES
(1, 'Arun', 'BCA', 20, 'Chennai'),
(2, 'Priya', 'BSc', 21, 'Madurai'),
(3, 'Karthik', 'BCom', 19, 'Chennai'),
(4, 'Divya', 'BCA', 22, 'Coimbatore'),
(5, 'Rahul', 'BSc', 20, 'Salem'),
(6, 'Meena', 'BCA', 21, 'Chennai'),
(7, 'Vijay', 'BCom', 23, 'Bangalore'),
(8, 'Nisha', 'BSc', 20, 'Chennai'),
(9, 'Surya', 'BCA', 22, 'Trichy'),
(10, 'Aisha', 'BCom', 21, 'Chennai');

INSERT INTO Teachers VALUES
(1, 'Ramesh', 'Computer Science', 50000, 'Chennai'),
(2, 'Suresh', 'Commerce', 45000, 'Madurai'),
(3, 'Lakshmi', 'Computer Science', 55000, 'Chennai'),
(4, 'Anitha', 'Mathematics', 48000, 'Coimbatore'),
(5, 'Kumar', 'English', 42000, 'Salem'),
(6, 'Geetha', 'Commerce', 52000, 'Chennai'),
(7, 'Raj', 'Mathematics', 60000, 'Bangalore'),
(8, 'Mala', 'English', 47000, 'Chennai'),
(9, 'Bala', 'Computer Science', 58000, 'Trichy'),
(10, 'Deepa', 'Commerce', 50000, 'Chennai');

UPDATE Students
SET city = 'Bangalore'
WHERE student_id = 2;

UPDATE Students
SET course = 'BCA'
WHERE student_id = 5;

UPDATE Teachers
SET salary = 65000
WHERE teacher_id = 3;

DELETE FROM Students
WHERE student_id = 9;

DELETE FROM Teachers
WHERE teacher_id = 8;

SELECT * FROM Students;

SELECT * FROM Teachers;

SELECT * FROM Students
WHERE city = 'Chennai';

SELECT * FROM Teachers
WHERE salary > 50000;

SELECT * FROM Students
WHERE course = 'BCA' AND city = 'Chennai';

SELECT * FROM Teachers
WHERE department = 'Computer Science' AND salary > 50000;

SELECT * FROM Students
WHERE city = 'Chennai' OR city = 'Bangalore';

SELECT * FROM Teachers
WHERE department = 'Commerce' OR department = 'Mathematics';