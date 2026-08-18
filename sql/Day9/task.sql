-- SQL Subquery - Answers (Basic Level)
-- Table: teaemp

-- Task 1 - Above Average Salary
-- Display all employees whose salary is greater than the average salary.
SELECT *
FROM teaemp
WHERE empsalary >
(
    SELECT AVG(empsalary)
    FROM teaemp
);


-- Task 2 - Highest Salary Employee
-- Display the employee who has the highest salary.
SELECT *
FROM teaemp
WHERE empsalary =
(
    SELECT MAX(empsalary)
    FROM teaemp
);


-- Task 3 - Lowest Salary Employee
-- Display the employee who has the lowest salary.
SELECT *
FROM teaemp
WHERE empsalary =
(
    SELECT MIN(empsalary)
    FROM teaemp
);


-- Task 4 - Employees in the Same Department as 'Rahul Singh'
-- Display all employees who work in the same department as Rahul Singh.
SELECT *
FROM teaemp
WHERE empdepart =
(
    SELECT empdepart
    FROM teaemp
    WHERE empname = 'Rahul Singh'
);


-- Task 5 - Multiple Row Subquery
-- Display all employees who work in departments where at least one
-- employee earns more than 40,000.
SELECT *
FROM teaemp
WHERE empdepart IN
(
    SELECT empdepart
    FROM teaemp
    WHERE empsalary > 40000
);


-- Bonus Query 1
-- Display employees whose salary is less than the highest salary.
SELECT *
FROM teaemp
WHERE empsalary <
(
    SELECT MAX(empsalary)
    FROM teaemp
);


-- Bonus Query 2
-- Display employees whose salary is greater than the lowest salary.
SELECT *
FROM teaemp
WHERE empsalary >
(
    SELECT MIN(empsalary)
    FROM teaemp
);


-- Concepts Used:
-- AVG()
-- MAX()
-- MIN()
-- =
-- IN
-- Single Row Subquery
-- Multiple Row Subquery
