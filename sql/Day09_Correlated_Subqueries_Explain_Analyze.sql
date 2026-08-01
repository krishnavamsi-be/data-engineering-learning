# SQL Learning - Day 09

**Date:** 31 July 2026

# Topic

- Correlated Subqueries
- EXPLAIN ANALYZE

---

# Question 1

## What is the difference between a Subquery and a Correlated Subquery?

### Answer

| Subquery | Correlated Subquery |
|----------|----------------------|
| Executes independently. | Depends on the outer query. |
| Executes only once. | Executes once for every row processed by the outer query. |
| Can run independently. | Cannot execute independently. |
| Generally performs better. | Can be slower because it runs repeatedly. |

Example of a normal subquery:

```sql
SELECT *
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);
```

Example of a correlated subquery:

```sql
SELECT *
FROM employees e1
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees e2
    WHERE e1.dept_id = e2.dept_id
);
```

---

# Question 2

## Output Prediction

Table

| emp_id | name | dept_id | salary |
|--------|------|---------|--------|
|1|Alice|10|50000|
|2|Bob|10|70000|
|3|Charlie|20|60000|
|4|David|20|80000|
|5|Eva|30|55000|

Query

```sql
SELECT e1.name
FROM employees e1
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees e2
    WHERE e1.dept_id = e2.dept_id
);
```

### Explanation

Department 10

Average salary

```
(50000 + 70000) / 2 = 60000
```

Bob earns 70000 > 60000

Department 20

Average salary

```
(60000 + 80000) / 2 = 70000
```

David earns 80000 > 70000

Department 30

Average salary

```
55000
```

Eva earns exactly the average, not greater.

### Output

| name |
|------|
|Bob|
|David|

---

# Question 3

## Employees with Highest Salary in Each Department

```sql
SELECT *
FROM employees e1
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees e2
    WHERE e1.dept_id = e2.dept_id
);
```

### Output

| name |
|------|
|Bob|
|David|
|Eva|

Eva is the highest-paid employee in Department 30 because she is the only employee.

---

# Question 4

## What is EXPLAIN ANALYZE?

### Answer

`EXPLAIN ANALYZE` executes the SQL query and displays its execution plan along with the actual execution statistics.

It helps understand how the database processes a query and identify performance bottlenecks.

---

## Information Provided

- Execution Plan
- Sequential Scan
- Index Scan
- Join Type
- Cost
- Estimated Rows
- Actual Rows
- Planning Time
- Execution Time

Example

```sql
EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE salary > 50000;
```

---

# Question 5

## True or False

Statement

> Correlated subqueries are generally slower than equivalent JOIN solutions because the inner query may execute once for each row of the outer query.

### Answer

**True**

### Reason

For every row processed by the outer query, the correlated subquery may execute again.

For large datasets this can increase execution time.

Modern database optimizers can sometimes rewrite correlated subqueries internally, but in many cases JOINs remain more efficient.

---

# Question 6

## Why do Correlated Subqueries Exist?

### Interview Answer

Correlated subqueries exist because they solve row-by-row comparison problems naturally.

They make some queries easier to write and understand, especially when each row needs to be compared with related rows.

Although they may be slower, database optimizers often improve their execution, and for many business problems they provide a clear and readable solution.

When performance becomes critical, developers can rewrite them using JOINs, Common Table Expressions (CTEs), or window functions if appropriate.

---

# Interview Tips

### When should you use a Correlated Subquery?

- Compare each employee with their department average.
- Find the highest or lowest value within each group.
- Perform row-by-row comparisons.

---

### When should you avoid it?

- Very large tables.
- Performance-critical ETL jobs.
- When an equivalent JOIN or window function is more efficient.

---

# Real-World Data Engineering Usage

- Compare employee salary with department average.
- Data quality validation.
- Duplicate record detection.
- Fraud detection.
- Customer transaction analysis.
- ETL validation rules.

---

# Summary

✅ Learned Correlated Subqueries

✅ Learned EXPLAIN ANALYZE

Key Takeaways:

- Subqueries execute independently.
- Correlated subqueries depend on the outer query.
- Correlated subqueries may execute once for each outer row.
- EXPLAIN ANALYZE shows the actual execution plan and performance metrics.
- Prefer JOINs or window functions when performance is important.