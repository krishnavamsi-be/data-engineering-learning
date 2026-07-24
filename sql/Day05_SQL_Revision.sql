# Day 05 - SQL Revision

**Date:** 2026-07-24

---

# Topics Revised

- SQL Execution Order
- WHERE vs HAVING
- Aggregate Functions
- COUNT(*) vs COUNT(column)
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- CROSS JOIN
- GROUP_CONCAT()

---

# SQL Execution Order (Interview Question)

SQL logically executes queries in the following order:

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
7. LIMIT

Example:

```sql
SELECT dept_name, COUNT(*)
FROM employees
WHERE salary > 50000
GROUP BY dept_name
HAVING COUNT(*) > 5
ORDER BY dept_name;
```

---

# WHERE vs HAVING

| WHERE | HAVING |
|--------|---------|
| Filters rows | Filters groups |
| Executed before GROUP BY | Executed after GROUP BY |
| Cannot use aggregate functions | Can use aggregate functions |

Example:

```sql
SELECT dept_name, COUNT(*)
FROM employees
WHERE salary > 50000
GROUP BY dept_name
HAVING COUNT(*) > 3;
```

---

# COUNT(*) vs COUNT(column)

COUNT(*)

- Counts every row
- Includes rows containing NULL values

COUNT(column)

- Counts only NON-NULL values in that column

Example

| Name |
|------|
| Krishna |
| Rahul |
| NULL |

```sql
SELECT COUNT(*) FROM employees;
-- Returns 3

SELECT COUNT(name) FROM employees;
-- Returns 2
```

---

# Aggregate Functions

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()

Example

```sql
SELECT
COUNT(*),
SUM(salary),
AVG(salary),
MIN(salary),
MAX(salary)
FROM employees;
```

---

# JOIN Revision

## INNER JOIN

Returns only matching records.

```sql
SELECT *
FROM employees e
INNER JOIN departments d
ON e.dept_id=d.dept_id;
```

---

## LEFT JOIN

Returns all rows from the left table.

```sql
SELECT *
FROM employees e
LEFT JOIN departments d
ON e.dept_id=d.dept_id;
```

---

## RIGHT JOIN

Returns all rows from the right table.

```sql
SELECT *
FROM employees e
RIGHT JOIN departments d
ON e.dept_id=d.dept_id;
```

---

## FULL OUTER JOIN (MySQL)

MySQL does not support FULL OUTER JOIN directly.

Workaround:

```sql
SELECT *
FROM employees e
LEFT JOIN departments d
ON e.dept_id=d.dept_id

UNION

SELECT *
FROM employees e
RIGHT JOIN departments d
ON e.dept_id=d.dept_id;
```

---

## CROSS JOIN

Returns every possible combination.

Formula

```
Rows = m × n
```

Example

12 employees

6 departments

```
12 × 6 = 72 rows
```

```sql
SELECT *
FROM employees
CROSS JOIN departments;
```

---

# GROUP_CONCAT()

Combines multiple row values into a single string.

Example

```sql
SELECT dept_name,
GROUP_CONCAT(emp_name)
FROM employees
GROUP BY dept_name;
```

Custom separator

```sql
SELECT dept_name,
GROUP_CONCAT(emp_name SEPARATOR ' | ')
FROM employees
GROUP BY dept_name;
```

Without GROUP BY

```sql
SELECT GROUP_CONCAT(emp_name)
FROM employees;
```

All rows are treated as one group.

Default separator:

```
Comma (,)
```

---

# Frequently Asked Interview Questions

### Difference between WHERE and HAVING?

WHERE filters rows.

HAVING filters groups.

---

### Difference between COUNT(*) and COUNT(column)?

COUNT(*) counts every row.

COUNT(column) ignores NULL values.

---

### Which JOIN returns all possible combinations?

CROSS JOIN.

---

### Which JOIN finds unmatched rows?

LEFT JOIN with IS NULL.

Example

```sql
SELECT *
FROM employees e
LEFT JOIN departments d
ON e.dept_id=d.dept_id
WHERE d.dept_id IS NULL;
```

---

### Which JOIN returns only matching rows?

INNER JOIN.

---

# Mistakes Corrected Today

- SQL execution order is:
  FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT

- COUNT(column) ignores NULL values.

- GROUP_CONCAT() works with or without GROUP BY.

- Default separator in GROUP_CONCAT() is comma (,).

- GROUP BY creates groups.

- HAVING filters groups.

- LEFT JOIN + IS NULL is commonly used to find unmatched rows.

---

# Revision Score

SQL Day 05 Revision Test

**Score: 16.5 / 20**

Status:

✅ Passed

Ready to continue with:

- SELF JOIN
- UNION
- UNION ALL

---

# Git Commands

```bash
git status
git add .
git commit -m "Add SQL Day 05 revision notes"
git push
```