SELECT * FROM Employees;

SELECT name, department, salary
FROM Employees;

SELECT DISTINCT city
FROM Employees;

SELECT * FROM Employees
WHERE city = 'Chennai';

SELECT * FROM Employees
WHERE salary > 60000;

SELECT * FROM Employees
WHERE salary <= 45000;

SELECT * FROM Employees
WHERE department = 'Developer' AND city = 'Chennai';

SELECT * FROM Employees
WHERE city = 'Madurai' OR city = 'Salem';

SELECT * FROM Employees
WHERE name LIKE 'A%';

SELECT * FROM Employees
WHERE name LIKE '%a';

SELECT * FROM Employees
WHERE name LIKE '%ya%';

SELECT * FROM Employees
WHERE city IN ('Chennai', 'Salem');

SELECT * FROM Employees
WHERE salary BETWEEN 45000 AND 70000;

SELECT * FROM Employees
ORDER BY salary DESC;

SELECT * FROM Employees
ORDER BY name ASC;

SELECT * FROM Employees
LIMIT 5;

SELECT * FROM Employees
ORDER BY salary DESC
LIMIT 3;