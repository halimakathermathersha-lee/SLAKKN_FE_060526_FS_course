CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

ALTER TABLE Employees
ADD email VARCHAR(100);

ALTER TABLE Employees
MODIFY salary BIGINT;

ALTER TABLE Employees
RENAME COLUMN city TO location;

INSERT INTO Employees (name, department, salary, location, email)
VALUES
('Sudhan', 'Developer', 65000, 'Chennai', 'sudhan@gmail.com'),
('Rahul', 'Tester', 40000, 'Madurai', 'rahul@gmail.com'),
('Karthik', 'Developer', 55000, 'Chennai', 'karthik@gmail.com'),
('Ajay', 'HR', 35000, 'Salem', 'ajay@gmail.com'),
('Vijay', 'Manager', 85000, 'Coimbatore', 'vijay@gmail.com'),
('Arun', 'Developer', 60000, 'Bangalore', 'arun@gmail.com'),
('Priya', 'Tester', 45000, 'Chennai', 'priya@gmail.com'),
('Divya', 'HR', 30000, 'Madurai', 'divya@gmail.com'),
('Surya', 'Developer', 70000, 'Salem', 'surya@gmail.com'),
('Anitha', 'Manager', 90000, 'Chennai', 'anitha@gmail.com');

SELECT * FROM Employees;

UPDATE Employees
SET salary = 75000
WHERE id = 3;

UPDATE Employees
SET department = 'Senior Tester'
WHERE id = 2;

UPDATE Employees
SET salary = 50000, location = 'Bangalore'
WHERE id = 7;

DELETE FROM Employees
WHERE id = 8;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Employees
WHERE location = 'Madurai';

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM Employees;

SELECT name, salary
FROM Employees;

SELECT DISTINCT department
FROM Employees;

SELECT * FROM Employees
WHERE salary > 40000;


SELECT * FROM Employees
WHERE department = 'Developer'
AND salary > 50000;

SELECT * FROM Employees
WHERE location = 'Chennai'
OR location = 'Salem';

SELECT * FROM Employees
WHERE location IN ('Chennai', 'Bangalore');

SELECT * FROM Employees
WHERE department NOT IN ('HR', 'Tester');

SELECT * FROM Employees
WHERE salary BETWEEN 50000 AND 80000;

SELECT * FROM Employees
WHERE name LIKE 'A%';


SELECT * FROM Employees
ORDER BY salary DESC
LIMIT 1;

SELECT * FROM Employees
ORDER BY salary ASC
LIMIT 1;

SELECT * FROM Employees
ORDER BY salary DESC
LIMIT 5;

SELECT * FROM Employees
ORDER BY id DESC
LIMIT 3;


SELECT COUNT(*) AS employee_count
FROM Employees;

SELECT SUM(salary) AS total_salary
FROM Employees;

SELECT AVG(salary) AS average_salary
FROM Employees;

SELECT MAX(salary) AS highest_salary
FROM Employees;

SELECT MIN(salary) AS lowest_salary
FROM Employees;


SELECT department, COUNT(*) AS employee_count
FROM Employees
GROUP BY department;

SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department;

SELECT location, AVG(salary) AS average_salary
FROM Employees
GROUP BY location;

SELECT department, MAX(salary) AS highest_salary
FROM Employees
GROUP BY department;


SELECT department, COUNT(*) AS employee_count
FROM Employees
GROUP BY department
HAVING COUNT(*) > 2;

SELECT location, AVG(salary) AS average_salary
FROM Employees
GROUP BY location
HAVING AVG(salary) > 50000;

SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department
HAVING SUM(salary) > 200000;


SELECT UPPER(name)
FROM Employees;

SELECT LOWER(name)
FROM Employees;

SELECT name, LENGTH(name)
FROM Employees;

SELECT CONCAT(name, ' - ', department)
FROM Employees;

SELECT name, SUBSTRING(name, 1, 3)
FROM Employees;

SELECT name, REPLACE(name, 'a', '@')
FROM Employees;

SELECT name, LEFT(name, 3)
FROM Employees;

SELECT name, RIGHT(name, 3)
FROM Employees;

SELECT name, REVERSE(name)
FROM Employees;

SELECT TRIM('   SQL Practice   ');


SELECT CURDATE();

SELECT NOW();

SELECT YEAR(CURDATE());

SELECT MONTH(CURDATE());

SELECT DAY(CURDATE());

SELECT DATE_FORMAT(CURDATE(), '%d-%m-%Y');

SELECT DATEDIFF('2026-12-31', CURDATE());


SELECT
department,
COUNT(*) AS employee_count,
SUM(salary) AS total_salary,
AVG(salary) AS average_salary,
MAX(salary) AS highest_salary,
MIN(salary) AS lowest_salary
FROM Employees
GROUP BY department
ORDER BY total_salary DESC;


SELECT
location,
COUNT(*) AS employee_count,
AVG(salary) AS average_salary
FROM Employees
WHERE salary > 40000
GROUP BY location
HAVING COUNT(*) > 2;


SELECT
department,
SUM(salary) AS total_salary,
MAX(salary) AS highest_salary,
MIN(salary) AS lowest_salary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 60000;


SELECT
department,
location,
COUNT(*) AS employee_count,
SUM(salary) AS total_salary
FROM Employees
GROUP BY department, location
ORDER BY employee_count DESC;


SELECT
department,
COUNT(*) AS employee_count,
SUM(salary) AS total_salary,
AVG(salary) AS average_salary
FROM Employees
WHERE salary > 35000
AND location = 'Chennai'
GROUP BY department
HAVING COUNT(*) > 2
AND AVG(salary) > 50000
ORDER BY total_salary DESC
LIMIT 3;


CREATE DATABASE EmployeeManagementDB;

USE EmployeeManagementDB;

CREATE TABLE Employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

ALTER TABLE Employees
ADD email VARCHAR(100);

ALTER TABLE Employees
ADD joining_date DATE;

INSERT INTO Employees
(name, department, salary, city, email, joining_date)
VALUES
('Arun', 'Developer', 65000, 'Chennai', 'arun@gmail.com', '2022-01-10'),
('Priya', 'Tester', 45000, 'Chennai', 'priya@gmail.com', '2023-02-15'),
('Karthik', 'Developer', 70000, 'Chennai', 'karthik@gmail.com', '2021-03-20'),
('Divya', 'HR', 40000, 'Madurai', 'divya@gmail.com', '2024-04-12'),
('Vijay', 'Manager', 90000, 'Chennai', 'vijay@gmail.com', '2020-05-18'),
('Anitha', 'Developer', 60000, 'Bangalore', 'anitha@gmail.com', '2022-06-25'),
('Rahul', 'Tester', 48000, 'Salem', 'rahul@gmail.com', '2023-07-14'),
('Surya', 'Developer', 75000, 'Chennai', 'surya@gmail.com', '2021-08-11'),
('Meena', 'HR', 42000, 'Coimbatore', 'meena@gmail.com', '2024-09-05'),
('Ajay', 'Manager', 85000, 'Chennai', 'ajay@gmail.com', '2020-10-22'),
('Nisha', 'Developer', 58000, 'Madurai', 'nisha@gmail.com', '2022-11-19'),
('Deepa', 'Tester', 50000, 'Chennai', 'deepa@gmail.com', '2023-12-01'),
('Ravi', 'Developer', 68000, 'Salem', 'ravi@gmail.com', '2021-01-30'),
('Bala', 'HR', 45000, 'Chennai', 'bala@gmail.com', '2024-02-17'),
('Sanjay', 'Manager', 95000, 'Bangalore', 'sanjay@gmail.com', '2019-03-08');

UPDATE Employees
SET salary = 80000
WHERE id = 3;

UPDATE Employees
SET department = 'Senior Developer'
WHERE id = 6;

DELETE FROM Employees
WHERE id = 9;

SELECT * FROM Employees
WHERE salary > 50000;

SELECT * FROM Employees
ORDER BY salary DESC;

SELECT * FROM Employees
ORDER BY salary DESC
LIMIT 5;

SELECT
COUNT(*) AS employee_count,
SUM(salary) AS total_salary,
AVG(salary) AS average_salary,
MAX(salary) AS highest_salary,
MIN(salary) AS lowest_salary
FROM Employees;

SELECT department, COUNT(*) AS employee_count
FROM Employees
GROUP BY department;

SELECT department, AVG(salary) AS average_salary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 50000;

SELECT UPPER(name)
FROM Employees;

SELECT CONCAT(name, ' - ', department)
FROM Employees;

SELECT name, LENGTH(name)
FROM Employees;

SELECT name, joining_date, YEAR(joining_date)
FROM Employees;

SELECT name, joining_date,
DATEDIFF(CURDATE(), joining_date) AS days_worked
FROM Employees;

SELECT
department,
COUNT(*) AS employee_count,
SUM(salary) AS total_salary,
AVG(salary) AS average_salary,
MAX(salary) AS highest_salary,
MIN(salary) AS lowest_salary
FROM Employees
GROUP BY department
ORDER BY total_salary DESC;


