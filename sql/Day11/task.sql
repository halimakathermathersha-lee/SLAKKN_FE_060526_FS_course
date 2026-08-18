-- ============================================================
-- SQL INTERVIEW PRACTICAL TASKS - INDIVIDUAL TASKS
-- MySQL Practice File
-- ============================================================

-- ============================================================
-- DDL TASKS
-- ============================================================

-- TASK 1
-- Create database CompanyDB and Employees table

CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100) NOT NULL,
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    City VARCHAR(50)
);


-- TASK 2
-- Create Department, Employee and City tables
-- Apply Primary Key and Foreign Key relationships

DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS City;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE City (
    CityID INT PRIMARY KEY AUTO_INCREMENT,
    CityName VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100) NOT NULL,
    Salary DECIMAL(10,2),
    DepartmentID INT,
    CityID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);


-- TASK 3
-- Add column
ALTER TABLE Employees
ADD Email VARCHAR(100);

-- Modify column datatype
ALTER TABLE Employees
MODIFY Salary DECIMAL(12,2);

-- Rename column
ALTER TABLE Employees
RENAME COLUMN EmployeeName TO FullName;

-- Drop column
ALTER TABLE Employees
DROP COLUMN Email;


-- TASK 4
-- Rename, truncate and drop Employees table

ALTER TABLE Employees
RENAME TO EmployeeDetails;

TRUNCATE TABLE EmployeeDetails;

DROP TABLE EmployeeDetails;


-- ============================================================
-- DML SETUP
-- Recreate Employee-related tables because Task 4 dropped
-- the original Employees table.
-- ============================================================

DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS City;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE City (
    CityID INT PRIMARY KEY AUTO_INCREMENT,
    CityName VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100) NOT NULL,
    Salary DECIMAL(10,2),
    DepartmentID INT,
    CityID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

INSERT INTO Department (DepartmentName) VALUES
('IT'),
('HR'),
('Finance'),
('Sales'),
('Marketing');

INSERT INTO City (CityName) VALUES
('Chennai'),
('Salem'),
('Madurai'),
('Coimbatore'),
('Trichy');


-- TASK 5
-- Insert 15 employee records

INSERT INTO Employee
(EmployeeName, Salary, DepartmentID, CityID)
VALUES
('Arun', 55000, 1, 1),
('Rahul', 48000, 1, 2),
('Karthik', 62000, 1, 3),
('Anand', 45000, 1, 1),
('Varun', 38000, 1, 4),

('Ravi', 42000, 2, 1),
('Mohan', 35000, 2, 2),
('Arjun', 47000, 2, 3),

('Priya', 52000, 3, 1),
('Divya', 44000, 3, 4),
('Sneha', 58000, 3, 5),

('Kiran', 30000, 4, 2),
('Vijay', 65000, 4, 3),
('Saran', 25000, 5, 1),
('John', 19000, 5, 4);


-- TASK 6
-- Increase salary of IT employees by 5000

UPDATE Employee
SET Salary = Salary + 5000
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Department
    WHERE DepartmentName = 'IT'
);


-- TASK 7
-- Update city of HR employees to Chennai

UPDATE Employee
SET CityID = (
    SELECT CityID
    FROM City
    WHERE CityName = 'Chennai'
)
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Department
    WHERE DepartmentName = 'HR'
);


-- TASK 8
-- Delete employees whose salary is less than 20000

DELETE FROM Employee
WHERE Salary < 20000;


-- ============================================================
-- DQL TASKS
-- ============================================================

-- TASK 9
-- Salary > 40000, salary < 60000 and Chennai

SELECT e.*
FROM Employee e
INNER JOIN City c
ON e.CityID = c.CityID
WHERE e.Salary > 40000
AND e.Salary < 60000
AND c.CityName = 'Chennai';


-- TASK 10
-- Top 5 highest-paid employees

SELECT *
FROM Employee
ORDER BY Salary DESC
LIMIT 5;

-- Top 3 lowest-paid employees

SELECT *
FROM Employee
ORDER BY Salary ASC
LIMIT 3;


-- TASK 11
-- Names starting with A

SELECT *
FROM Employee
WHERE EmployeeName LIKE 'A%';

-- Names ending with n

SELECT *
FROM Employee
WHERE EmployeeName LIKE '%n';

-- Names containing ar

SELECT *
FROM Employee
WHERE EmployeeName LIKE '%ar%';


-- TASK 12
-- Employees from Chennai, Salem and Madurai

SELECT e.*
FROM Employee e
INNER JOIN City c
ON e.CityID = c.CityID
WHERE c.CityName IN ('Chennai', 'Salem', 'Madurai');


-- ============================================================
-- AGGREGATE FUNCTION TASKS
-- ============================================================

-- TASK 13
-- Total Employees, Total Salary, Average, Highest, Lowest

SELECT
    COUNT(*) AS TotalEmployees,
    SUM(Salary) AS TotalSalary,
    AVG(Salary) AS AverageSalary,
    MAX(Salary) AS HighestSalary,
    MIN(Salary) AS LowestSalary
FROM Employee;


-- TASK 14
-- Department-wise employee count

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Department d
LEFT JOIN Employee e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;


-- TASK 15
-- City-wise average salary

SELECT
    c.CityName,
    AVG(e.Salary) AS AverageSalary
FROM City c
INNER JOIN Employee e
ON c.CityID = e.CityID
GROUP BY c.CityID, c.CityName;


-- ============================================================
-- GROUP BY & HAVING
-- ============================================================

-- TASK 16
-- Departments having more than 3 employees

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Department d
INNER JOIN Employee e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
HAVING COUNT(e.EmployeeID) > 3;


-- TASK 17
-- Cities whose average salary is greater than 45000

SELECT
    c.CityName,
    AVG(e.Salary) AS AverageSalary
FROM City c
INNER JOIN Employee e
ON c.CityID = e.CityID
GROUP BY c.CityID, c.CityName
HAVING AVG(e.Salary) > 45000;


-- ============================================================
-- SUBQUERY TASKS
-- ============================================================

-- TASK 18
-- Employees whose salary is greater than average salary

SELECT *
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
);


-- TASK 19
-- Employees working in same department as Rahul

SELECT *
FROM Employee
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Employee
    WHERE EmployeeName = 'Rahul'
);


-- ============================================================
-- JOIN TASK
-- ============================================================

-- TASK 20
-- Employee Report using INNER JOIN

SELECT
    e.EmployeeName,
    d.DepartmentName,
    c.CityName
FROM Employee e
INNER JOIN Department d
ON e.DepartmentID = d.DepartmentID
INNER JOIN City c
ON e.CityID = c.CityID;


-- ============================================================
-- BONUS INTERVIEW TASKS
-- ============================================================

-- TASK 21 - HOSPITAL DATABASE DESIGN
-- Tables:
-- 1. Patient
-- 2. Doctor
-- 3. Department
-- 4. Appointment
-- 5. Room

CREATE TABLE IF NOT EXISTS HospitalDepartment (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Patient (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    PatientName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    City VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Doctor (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    DoctorName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES HospitalDepartment(DepartmentID)
);

CREATE TABLE IF NOT EXISTS Appointment (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Room has its own Primary Key.
CREATE TABLE IF NOT EXISTS HospitalRoom (
    RoomID INT PRIMARY KEY AUTO_INCREMENT,
    RoomNumber VARCHAR(20),
    PatientID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);


-- TASK 22 - TEA SHOP DATABASE NORMALIZATION UP TO 3NF
-- Example normalized structure:
--
-- Customer(CustomerID, CustomerName, Phone)
-- Product(ProductID, ProductName, Price)
-- Orders(OrderID, CustomerID, OrderDate)
-- OrderItem(OrderItemID, OrderID, ProductID, Quantity)

CREATE TABLE IF NOT EXISTS TeaCustomer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS TeaProduct (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS TeaOrder (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES TeaCustomer(CustomerID)
);

CREATE TABLE IF NOT EXISTS TeaOrderItem (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES TeaOrder(OrderID),
    FOREIGN KEY (ProductID) REFERENCES TeaProduct(ProductID)
);


-- TASK 23 - AFTER INSERT TRIGGER
-- Back up employee records

DROP TABLE IF EXISTS EmployeeBackup;

CREATE TABLE EmployeeBackup (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(10,2),
    DepartmentID INT,
    CityID INT,
    BackupDate DATETIME
);

DROP TRIGGER IF EXISTS trg_employee_after_insert;

DELIMITER $$

CREATE TRIGGER trg_employee_after_insert
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO EmployeeBackup
    VALUES (
        NEW.EmployeeID,
        NEW.EmployeeName,
        NEW.Salary,
        NEW.DepartmentID,
        NEW.CityID,
        NOW()
    );
END$$

DELIMITER ;


-- TASK 24 - TRANSACTION
-- START TRANSACTION
-- SAVEPOINT
-- ROLLBACK
-- COMMIT

START TRANSACTION;

UPDATE Employee
SET Salary = Salary + 1000
WHERE EmployeeID = 1;

SAVEPOINT salary_update;

UPDATE Employee
SET Salary = Salary + 2000
WHERE EmployeeID = 2;

ROLLBACK TO salary_update;

COMMIT;


-- TASK 25 - DCL
-- Create user, grant SELECT and INSERT, then revoke INSERT.
-- Run these commands only if you have sufficient privileges.

-- CREATE USER 'interview_user'@'localhost'
-- IDENTIFIED BY 'Interview@123';

-- GRANT SELECT, INSERT
-- ON CompanyDB.*
-- TO 'interview_user'@'localhost';

-- REVOKE INSERT
-- ON CompanyDB.*
-- FROM 'interview_user'@'localhost';


-- ============================================================
-- INTERVIEW CHALLENGE
-- ============================================================

-- Employee Management System should contain:
--
-- DDL
-- DML
-- DQL
-- Aggregate Functions
-- GROUP BY
-- HAVING
-- Subquery
-- Normalization
-- Primary Key
-- Foreign Key
-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- Trigger
-- DCL


-- LEFT JOIN example

SELECT
    e.EmployeeName,
    d.DepartmentName,
    c.CityName
FROM Employee e
LEFT JOIN Department d
ON e.DepartmentID = d.DepartmentID
LEFT JOIN City c
ON e.CityID = c.CityID;


-- RIGHT JOIN example

SELECT
    e.EmployeeName,
    d.DepartmentName,
    c.CityName
FROM Employee e
RIGHT JOIN Department d
ON e.DepartmentID = d.DepartmentID
LEFT JOIN City c
ON e.CityID = c.CityID;


-- ============================================================
-- END OF SQL INTERVIEW PRACTICAL TASKS
-- ============================================================
