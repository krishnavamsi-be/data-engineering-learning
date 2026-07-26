/*
==========================================================
Day 07 - SQL Practice
Topic: Joins & Subqueries
==========================================================
*/

-- ========================================================
-- Question 1
-- Display Employee Name and Department Name.
-- ========================================================

SELECT
    e.emp_name,
    d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

------------------------------------------------------------

-- ========================================================
-- Question 2
-- Display Employee Name, Department Name and City.
-- ========================================================

SELECT
    e.emp_name,
    d.dept_name,
    d.city
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

------------------------------------------------------------

-- ========================================================
-- Question 3
-- Display employees working in Hyderabad.
-- ========================================================

SELECT
    e.emp_name,
    d.city
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.city='Hyderabad';

------------------------------------------------------------

-- ========================================================
-- Question 4
-- Display Employee Name and Manager ID.
-- ========================================================

SELECT
    emp_name,
    manager_id
FROM employees;

------------------------------------------------------------

-- ========================================================
-- Question 5
-- Display Employee Name and Manager Name.
-- (SELF JOIN)
-- ========================================================

SELECT
    e.emp_name AS Employee,
    m.emp_name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

------------------------------------------------------------

-- ========================================================
-- Question 6
-- Find departments having at least one employee.
-- ========================================================

SELECT DISTINCT
    d.dept_name
FROM departments d
JOIN employees e
ON d.dept_id=e.dept_id;

------------------------------------------------------------

-- ========================================================
-- Question 7
-- Find departments having more than one employee.
-- ========================================================

SELECT
    d.dept_name,
    COUNT(*) AS total_employees
FROM employees e
JOIN departments d
ON e.dept_id=d.dept_id
GROUP BY d.dept_name
HAVING COUNT(*)>1;

------------------------------------------------------------

-- ========================================================
-- Question 8
-- Employees earning more than average salary.
-- (Single Value Subquery)
-- ========================================================

SELECT *
FROM employees
WHERE salary >
(
SELECT AVG(salary)
FROM employees
);

------------------------------------------------------------

-- ========================================================
-- Question 9
-- Employee(s) earning highest salary.
-- ========================================================

SELECT *
FROM employees
WHERE salary=
(
SELECT MAX(salary)
FROM employees
);

------------------------------------------------------------

-- ========================================================
-- Question 10
-- Employees earning more than Priya.
-- ========================================================

SELECT *
FROM employees
WHERE salary>
(
SELECT salary
FROM employees
WHERE emp_name='Priya'
);

------------------------------------------------------------

-- ========================================================
-- Question 11
-- Employees working in Mumbai.
-- ========================================================

SELECT
    e.emp_name
FROM employees e
JOIN departments d
ON e.dept_id=d.dept_id
WHERE d.city='Mumbai';

------------------------------------------------------------

-- ========================================================
-- Question 12
-- Employees working in the same department as Krishna.
-- ========================================================

SELECT *
FROM employees
WHERE dept_id=
(
SELECT dept_id
FROM employees
WHERE emp_name='Krishna'
);

------------------------------------------------------------

-- ========================================================
-- Question 13
-- Departments having no employees.
-- (LEFT JOIN)
-- ========================================================

SELECT
    d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id=e.dept_id
WHERE e.emp_id IS NULL;

------------------------------------------------------------

-- ========================================================
-- Question 14
-- Display Employee Name, Department Name and Salary
-- for employees earning more than average salary of
-- Hyderabad employees.
-- ========================================================

SELECT
    e.emp_name,
    d.dept_name,
    e.salary
FROM employees e
JOIN departments d
ON e.dept_id=d.dept_id
WHERE e.salary>
(
SELECT AVG(e2.salary)
FROM employees e2
JOIN departments d2
ON e2.dept_id=d2.dept_id
WHERE d2.city='Hyderabad'
);

------------------------------------------------------------

-- ========================================================
-- Question 15
-- Find employee(s) hired before Krishna.
-- ========================================================

SELECT *
FROM employees
WHERE hire_date<
(
SELECT hire_date
FROM employees
WHERE emp_name='Krishna'
);

------------------------------------------------------------

-- ========================================================
-- Question 16
-- Display departments whose IDs exist in Employees table.
-- (Multiple Value Subquery)
-- ========================================================

SELECT *
FROM departments
WHERE dept_id IN
(
SELECT dept_id
FROM employees
);

------------------------------------------------------------

-- ========================================================
-- Question 17
-- Display departments that do not have employees.
-- (Multiple Value Subquery)
-- ========================================================

SELECT *
FROM departments
WHERE dept_id NOT IN
(
SELECT dept_id
FROM employees
);

------------------------------------------------------------

-- ========================================================
-- Question 18
-- Table Subquery
-- Display employees earning more than 60,000
-- using a derived table.
-- ========================================================

SELECT *
FROM
(
SELECT
emp_name,
salary
FROM employees
) emp
WHERE salary>60000;

------------------------------------------------------------

-- ========================================================
-- Question 19
-- Find department with highest average salary.
-- ========================================================

SELECT
d.dept_name,
AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d
ON e.dept_id=d.dept_id
GROUP BY d.dept_name
ORDER BY avg_salary DESC
LIMIT 1;

------------------------------------------------------------

-- ========================================================
-- Question 20 (Interview Question)
-- Find employee(s) with highest salary
-- without using MAX() in the outer query.
-- ========================================================

SELECT *
FROM employees
WHERE salary>=ALL
(
SELECT salary
FROM employees
);

------------------------------------------------------------

/*
==========================================================

Concepts Practiced

✔ INNER JOIN
✔ LEFT JOIN
✔ SELF JOIN
✔ GROUP BY
✔ HAVING
✔ Aggregate Functions
✔ Single Value Subqueries
✔ Multiple Value Subqueries
✔ Table Subqueries
✔ IN
✔ NOT IN
✔ ALL
✔ ORDER BY
✔ LIMIT

==========================================================
*/