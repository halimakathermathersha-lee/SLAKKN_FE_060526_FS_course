SELECT
    department,
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM Employees
GROUP BY department;


SELECT
    city,
    COUNT(*) AS total_employees,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary,
    AVG(salary) AS average_salary
FROM Employees
GROUP BY city
ORDER BY highest_salary DESC;


SELECT
    department,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary
FROM Employees
GROUP BY department
ORDER BY total_salary DESC;


SELECT
    department,
    city,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary
FROM Employees
GROUP BY department, city;


SELECT
    department,
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM Employees
GROUP BY department
ORDER BY total_salary DESC
LIMIT 3;


SELECT
    department,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM Employees
GROUP BY department
ORDER BY average_salary DESC
LIMIT 2;