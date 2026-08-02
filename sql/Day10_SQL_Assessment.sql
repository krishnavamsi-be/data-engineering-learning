# SQL Learning - Day 10 Assessment

**Date:** 01 August 2026

## Objective

This assessment was created to test my understanding of SQL fundamentals after completing the first 10 days of my Data Engineering learning journey.

Topics Covered:

- SELECT
- WHERE
- LIKE
- Aggregate Functions
- GROUP BY
- HAVING
- CASE WHEN
- Joins
- Subqueries
- Correlated Subqueries
- EXPLAIN ANALYZE

---

# Question 1 - Aggregate Functions

## Table: employees

| emp_id | name | department | salary |
|--------|------|------------|-------:|
|101|Alice|HR|45000|
|102|Bob|IT|70000|
|103|Charlie|IT|65000|
|104|David|Finance|80000|
|105|Eva|HR|55000|

### Task

Write a query to display:

- Employee Name
- Salary
- Salary rounded to 2 decimal places
- Sort the result by salary in descending order.

---

# Question 2 - LIKE Operator

## Table: customers

| customer_id | customer_name |
|------------|---------------|
|1|Arjun|
|2|Aman|
|3|Rahul|
|4|Allen|
|5|Anand|
|6|Robin|
|7|Ayaan|

### Tasks

Write separate SQL queries to find:

- Names starting with 'A'
- Names ending with 'n'
- Names containing 'ul'
- Names having exactly five characters

---

# Question 3 - GROUP BY & HAVING

## Table: orders

| order_id | customer_id | amount |
|----------|-------------|-------:|
|1|101|5000|
|2|101|7000|
|3|102|3000|
|4|103|9000|
|5|103|4000|
|6|104|2000|

### Task

Display

- Customer ID
- Total Purchase Amount

Show only customers whose total purchase amount is greater than 10000.

---

# Question 4 - INNER JOIN

## Table: employees

| emp_id | name | dept_id |
|--------|------|---------|
|1|Alice|10|
|2|Bob|20|
|3|Charlie|30|
|4|David|20|
|5|Eva|NULL|

## Table: departments

| dept_id | department_name |
|---------|-----------------|
|10|HR|
|20|IT|
|40|Finance|

### Task

Display

- Employee Name
- Department Name

Only matching records should appear.

---

# Question 5 - LEFT JOIN

Using the same tables above,

Display

- Employee Name
- Department Name

Show every employee.

If the department is missing, display

```
No Department
```

instead of NULL.

---

# Question 6 - Subquery

## Table: employees

| emp_id | name | salary |
|--------|------|-------:|
|1|Alice|50000|
|2|Bob|70000|
|3|Charlie|60000|
|4|David|90000|
|5|Eva|55000|

### Task

Display employees whose salary is greater than the average salary of all employees.

---

# Question 7 - Correlated Subquery

## Table: employees

| emp_id | name | dept_id | salary |
|--------|------|---------|-------:|
|1|Alice|10|50000|
|2|Bob|10|70000|
|3|Charlie|20|60000|
|4|David|20|80000|
|5|Eva|30|55000|

### Task

Display employees whose salary is greater than the average salary of their own department.

---

# Question 8 - CASE WHEN

## Table: students

| student_id | student_name | marks |
|------------|--------------|------:|
|1|Krishna|95|
|2|Rahul|82|
|3|John|71|
|4|Anil|66|
|5|Priya|89|
|6|Ajay|55|

### Task

Display:

| Marks | Grade |
|-------:|-------|
|90+|A|
|75-89|B|
|60-74|C|
|Below 60|Fail|

Sort by marks in descending order.

---

# Question 9 - EXPLAIN ANALYZE

The following query is running slowly.

```sql
SELECT *
FROM orders
WHERE customer_id = 102;
```

Answer the following:

1. Which command would you use to analyze this query?
2. What is the purpose of that command?
3. Mention four things you would look for in the execution plan.
4. What does a Sequential Scan indicate on a large table?

---

# Question 10 - SQL Execution Order

Given the following query:

```sql
SELECT department,
       AVG(salary) AS avg_salary
FROM employees
WHERE salary > 50000
GROUP BY department
HAVING AVG(salary) > 60000
ORDER BY avg_salary DESC;
```

Answer the following:

1. Explain the logical SQL execution order.
2. Why is SQL written in one order but executed in another?
3. Why can't aggregate functions like AVG() be used in the WHERE clause?

---

# Day 10 Summary

## Topics Revised

- SELECT
- WHERE
- LIKE
- Aggregate Functions
- GROUP BY
- HAVING
- CASE WHEN
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL JOIN
- CROSS JOIN
- USING
- Subqueries
- Correlated Subqueries
- EXPLAIN ANALYZE
- SQL Logical Execution Order

---

## Self Assessment

### Strengths

- Aggregate Functions
- GROUP BY & HAVING
- Joins
- CASE WHEN
- Regular Subqueries

### Topics to Improve

- Correlated Subqueries
- SQL Logical Execution Order
- Reading EXPLAIN ANALYZE output

---

## Progress

Day 10 marks the completion of the SQL fundamentals phase. The next focus area will be strengthening correlated subqueries and SQL execution order before moving on to Common Table Expressions (CTEs), followed by Window Functions.