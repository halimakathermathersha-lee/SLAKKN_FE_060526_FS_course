CREATE DATABASE CompanyDB; 

SHOW DATABASES;

USE CompanyDB;

CREATE TABLE Employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

DESC Employees;

ALTER TABLE Employees ADD email VARCHAR(100);
ALTER TABLE Employees ADD phone INT;
ALTER TABLE Employees ADD experience INT;

DESC Employees;

ALTER TABLE Employees MODIFY salary BIGINT;
ALTER TABLE Employees MODIFY phone BIGINT;

DESC Employees;

ALTER TABLE Employees RENAME COLUMN emp_name TO employee_name;
ALTER TABLE Employees RENAME COLUMN city TO location;

DESC Employees;

ALTER TABLE Employees DROP COLUMN experience;
ALTER TABLE Employees DROP COLUMN email;

DESC Employees;

RENAME TABLE Employees TO EmployeeDetails;

SHOW TABLES;

DESC EmployeeDetails;

CREATE TABLE Students (
    student_id INT,
    student_name VARCHAR(50),
    course VARCHAR(50),
    age INT,
    city VARCHAR(50)
);

DESC Students;

ALTER TABLE Students ADD mobile BIGINT;

DESC Students;

RENAME TABLE Students TO StudentDetails;

TRUNCATE TABLE StudentDetails;

SELECT * FROM StudentDetails;

DESC StudentDetails;

DROP TABLE StudentDetails;

DROP TABLE EmployeeDetails;

SHOW TABLES;

DROP DATABASE CompanyDB;

SHOW DATABASES;
