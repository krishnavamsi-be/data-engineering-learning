/*
===========================================
 Day 02 - SQL HAVING Clause Practice
 Author : Krishna Vamsi
 Topic  : HAVING Clause
===========================================
*/

-------------------------------------------------------
-- Create Employee Table
-------------------------------------------------------

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT
);

-------------------------------------------------------
-- Insert Sample Data
-------------------------------------------------------

INSERT INTO employees VALUES
(101, 'Alice', 'IT', 60000),
(102, 'Bob', 'IT', 70000),
(103, 'Charlie', 'HR', 45000),
(104, 'David', 'HR', 50000),
(105, 'Eva', 'Finance', 80000),
(106, 'Frank', 'Finance', 90000),
(107, 'Grace', 'IT', 65000),
(108, 'Helen', 'HR', 48000);

-------------------------------------------------------
-- Question 1
-- Display average salary of each department
-------------------------------------------------------

SELECT department,
       AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-------------------------------------------------------
-- Question 2
-- Display departments whose average salary
-- is greater than 55000
-------------------------------------------------------

SELECT department,
       AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 55000;

-------------------------------------------------------
-- Question 3
-- Display departments having more than
-- 2 employees
-------------------------------------------------------

SELECT department,
       COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

-------------------------------------------------------
-- Question 4
-- Display departments whose maximum salary
-- is greater than 75000
-------------------------------------------------------

SELECT department,
       MAX(salary) AS highest_salary
FROM employees
GROUP BY department
HAVING MAX(salary) > 75000;

-------------------------------------------------------
-- Question 5
-- Display departments whose minimum salary
-- is less than 50000
-------------------------------------------------------

SELECT department,
       MIN(salary) AS minimum_salary
FROM employees
GROUP BY department
HAVING MIN(salary) < 50000;

-------------------------------------------------------
-- Question 6
-- Display departments whose total salary
-- is greater than 150000
-------------------------------------------------------

SELECT department,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 150000;

-------------------------------------------------------
-- Question 7
-- Difference between WHERE and HAVING
-------------------------------------------------------

-- WHERE filters rows BEFORE grouping

SELECT *
FROM employees
WHERE salary > 60000;

-- HAVING filters groups AFTER grouping

SELECT department,
       AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;