-- ============================================================
-- Day 03 - SQL JOINs
-- Author: Krishna
-- ============================================================

/*
Topics Covered:
1. INNER JOIN
2. LEFT JOIN
3. RIGHT JOIN
4. FULL OUTER JOIN (using UNION)
5. USING Clause
6. Employees without Department
7. Departments without Employees
8. UNION vs UNION ALL
9. CROSS JOIN
*/

-- ============================================================
-- INNER JOIN
-- Returns only matching rows from both tables.
-- ============================================================

SELECT e.emp_name,
       d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;


-- ============================================================
-- LEFT JOIN
-- Returns all rows from the left table and matching rows
-- from the right table.
-- ============================================================

SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;


-- ============================================================
-- RIGHT JOIN
-- Returns all rows from the right table and matching rows
-- from the left table.
-- (Not supported in SQLite)
-- ============================================================

SELECT e.emp_name,
       d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;


-- ============================================================
-- FULL OUTER JOIN
-- SQLite/MySQL workaround using UNION
-- ============================================================

SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id

UNION

SELECT e.emp_name,
       d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;


-- ============================================================
-- USING Clause
-- Can be used when both tables contain a column
-- with the same name.
-- ============================================================

SELECT e.emp_name,
       d.dept_name
FROM employees e
INNER JOIN departments d
USING (dept_id);


-- ============================================================
-- Employees without any Department
-- ============================================================

SELECT e.emp_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;


-- ============================================================
-- Departments without Employees
-- ============================================================

SELECT d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;


-- ============================================================
-- UNION
-- Removes duplicate rows.
-- ============================================================

SELECT dept_id
FROM employees

UNION

SELECT dept_id
FROM departments;


-- ============================================================
-- UNION ALL
-- Keeps duplicate rows.
-- Faster than UNION because duplicates are not removed.
-- ============================================================

SELECT dept_id
FROM employees

UNION ALL

SELECT dept_id
FROM departments;


-- ============================================================
-- CROSS JOIN
-- Returns every possible combination of rows from
-- both tables (Cartesian Product).
-- ============================================================

SELECT *
FROM employees
CROSS JOIN departments;


-- ============================================================
-- Interview Notes
-- ============================================================

/*
INNER JOIN
-----------
Returns only matching rows from both tables.

LEFT JOIN
----------
Returns all rows from the left table.
If there is no matching row in the right table,
NULL values are returned for right table columns.

RIGHT JOIN
-----------
Returns all rows from the right table.
If there is no matching row in the left table,
NULL values are returned for left table columns.

FULL OUTER JOIN
---------------
Returns all rows from both tables.
Matching rows are merged.
Unmatched rows contain NULL values.

USING Clause
------------
Used when both tables have a column with the same name.

UNION
-----
Removes duplicate rows.

UNION ALL
---------
Keeps duplicate rows.
Faster than UNION.

CROSS JOIN
----------
Returns Cartesian Product.
If Table A has 5 rows and Table B has 4 rows,
result = 5 × 4 = 20 rows.
*/