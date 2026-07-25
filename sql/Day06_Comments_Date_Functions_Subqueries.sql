/*
===========================================================
Day 06 - Comments, Date Functions & Subqueries
Date: 2026-07-25
===========================================================
*/

-- =========================================================
-- Topics Covered
-- =========================================================

/*

1. Single Line Comments
2. Multi Line Comments
3. CURDATE()
4. YEAR()
5. Single Value Subqueries
6. Multiple Value Subqueries
7. Table Subqueries
8. Interview Questions

*/

-- =========================================================
-- 1. Comments
-- =========================================================

-- Single Line Comment

# This is also a single line comment (MySQL)

/*

This is a
Multi Line
Comment

*/

-- Comments are ignored by MySQL.
-- They are used to improve readability and documentation.


-- =========================================================
-- 2. CURDATE()
-- =========================================================

-- Returns current system date

SELECT CURDATE();

-- Example Output

/*
2026-07-25
*/


-- =========================================================
-- 3. YEAR()
-- =========================================================

-- Returns only the year from a date

SELECT YEAR(CURDATE());

-- Example Output

/*
2026
*/

-- Another Example

SELECT YEAR('2023-08-15');


-- =========================================================
-- 4. Single Value Subquery
-- =========================================================

-- A single value subquery returns exactly one value.
-- It is commonly used with =, >, <, >=, <= operators.

-- Example 1

SELECT *
FROM employees
WHERE salary >
(
SELECT AVG(salary)
FROM employees
);

-- Example 2

SELECT *
FROM movies
WHERE imdb_rating =
(
SELECT MAX(imdb_rating)
FROM movies
);

-- =========================================================
-- 5. Multiple Value Subquery
-- =========================================================

-- Returns multiple values.
-- Commonly used with:
-- IN
-- NOT IN

-- Example

SELECT *
FROM employees
WHERE dept_id IN
(
SELECT dept_id
FROM departments
WHERE city='Hyderabad'
);

-- Another Example

SELECT *
FROM employees
WHERE dept_id NOT IN
(
SELECT dept_id
FROM departments
WHERE city='Mumbai'
);

-- =========================================================
-- 6. Table Subquery
-- =========================================================

-- A table subquery returns multiple rows and columns.
-- It is usually placed inside the FROM clause.
-- The result behaves like a temporary table.

SELECT *
FROM
(
SELECT
name,
YEAR(CURDATE())-birth_year AS age
FROM actors
) AS actor_age
WHERE age BETWEEN 70 AND 85;

-- =========================================================
-- Difference Between Subqueries
-- =========================================================

/*

Single Value Subquery

Returns:
One value

Operators:
= > < >= <=

Example

SELECT *
FROM employees
WHERE salary >
(
SELECT AVG(salary)
FROM employees
);

--------------------------------------------------------

Multiple Value Subquery

Returns:
Multiple values

Operators:
IN
NOT IN

Example

SELECT *
FROM employees
WHERE dept_id IN
(
SELECT dept_id
FROM departments
);

--------------------------------------------------------

Table Subquery

Returns:
Rows and Columns

Usually used in:
FROM clause

Example

SELECT *
FROM
(
SELECT name, salary
FROM employees
) emp;

*/

-- =========================================================
-- Common Interview Questions
-- =========================================================

-- Q1 Find employees earning above average salary

SELECT *
FROM employees
WHERE salary >
(
SELECT AVG(salary)
FROM employees
);

------------------------------------------------------------

-- Q2 Find employees working in Hyderabad

SELECT emp_id,
       emp_name
FROM employees
WHERE dept_id IN
(
SELECT dept_id
FROM departments
WHERE city='Hyderabad'
);

------------------------------------------------------------

-- Q3 Find employee(s) earning highest salary

SELECT *
FROM employees
WHERE salary =
(
SELECT MAX(salary)
FROM employees
);

------------------------------------------------------------

-- Q4 Find departments having no employees

SELECT *
FROM departments
WHERE dept_id NOT IN
(
SELECT dept_id
FROM employees
);

------------------------------------------------------------

-- Q5 Find all actors whose age is between 70 and 85

SELECT *
FROM
(
SELECT
name,
YEAR(CURDATE())-birth_year AS age
FROM actors
) actor_age
WHERE age BETWEEN 70 AND 85;

-- =========================================================
-- Key Points to Remember
-- =========================================================

/*

1. Comments are ignored by MySQL.

2. CURDATE() returns current system date.

3. YEAR() extracts only the year.

4. Use '=' only when subquery returns one value.

5. Use IN or NOT IN when subquery returns multiple values.

6. Table subqueries are generally used in the FROM clause.

7. A table subquery behaves like a temporary table.

8. Aggregate functions like MAX(), MIN(), AVG(), COUNT() are commonly used inside subqueries.

*/

-- =========================================================
-- Revision Summary
-- =========================================================

/*

Completed SQL Topics

Day 01
✔ SQL Basics
✔ SELECT
✔ WHERE
✔ ORDER BY

Day 02
✔ GROUP BY
✔ HAVING
✔ Aggregate Functions

Day 03
✔ INNER JOIN
✔ LEFT JOIN
✔ RIGHT JOIN
✔ FULL OUTER JOIN

Day 04
✔ CROSS JOIN
✔ GROUP_CONCAT()

Day 05
✔ Complete SQL Revision

Day 06
✔ Comments
✔ CURDATE()
✔ YEAR()
✔ Single Value Subqueries
✔ Multiple Value Subqueries
✔ Table Subqueries

*/

-- =========================================================
-- Assessment
-- =========================================================

/*

Day 06 Assessment Score

8.5 / 10

Strengths

✔ Comments
✔ Date Functions
✔ Single Value Subqueries
✔ Table Subqueries

Need More Practice

✔ Choosing between '=' and 'IN'
✔ Identifying when a subquery returns multiple rows
✔ Writing multiple-value subqueries confidently

*/

-- =========================================================
-- Git Commands
-- =========================================================

/*

git status

git add .

git commit -m "Add SQL Day 06 comments date functions and subqueries"

git push

*/