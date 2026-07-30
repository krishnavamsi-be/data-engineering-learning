# SQL Learning - Day 08

**Date:** 30 July 2026

## Topics Covered

- ALL Operator
- ANY / SOME Operator

---

# 1. ALL Operator

The `ALL` operator compares a value with every value returned by a subquery.

The condition is true only if it satisfies the comparison for **all** values.

## Syntax

```sql
SELECT column_name
FROM table_name
WHERE expression comparison_operator ALL
(
    subquery
);
```

---

## Example

### Employees Table

| Employee | Salary |
|----------|--------|
| Krishna | 50000 |
| Rahul | 70000 |
| John | 60000 |

### Departments Table

| Department | Budget |
|-----------|--------|
| HR | 40000 |
| IT | 55000 |
| Finance | 65000 |

Find employees whose salary is greater than every department budget.

```sql
SELECT employee_name, salary
FROM employees
WHERE salary > ALL
(
    SELECT budget
    FROM departments
);
```

### Output

| Employee | Salary |
|----------|--------|
| Rahul | 70000 |

Because

```
70000 > 40000
70000 > 55000
70000 > 65000
```

The condition is true for every value.

---

# 2. ANY / SOME Operator

`ANY` and `SOME` have the same meaning in SQL.

The condition is true if it satisfies the comparison with **at least one** value returned by the subquery.

## Syntax

```sql
SELECT column_name
FROM table_name
WHERE expression comparison_operator ANY
(
    subquery
);
```

---

## Example

Find employees whose salary is greater than at least one department budget.

```sql
SELECT employee_name, salary
FROM employees
WHERE salary > ANY
(
    SELECT budget
    FROM departments
);
```

### Output

| Employee | Salary |
|----------|--------|
| Krishna | 50000 |
| Rahul | 70000 |
| John | 60000 |

Because every salary is greater than at least one budget (40000).

---

# Difference Between ALL and ANY

| ALL | ANY / SOME |
|------|------------|
| Must satisfy every value | Must satisfy at least one value |
| More restrictive | Less restrictive |
| Often used with `>` or `<` | Used with all comparison operators |

---

# Interview Questions

## What is the difference between ALL and ANY?

- `ALL` requires the condition to be true for every value returned by the subquery.
- `ANY` (or `SOME`) requires the condition to be true for at least one value.

---

## Is THERE a difference between ANY and SOME?

No.

They are synonyms in SQL and produce the same result.

---

## When is ALL useful?

- Finding values greater than the maximum value from another table.
- Finding values smaller than the minimum value from another table.

---

## Real-World Data Engineering Usage

- Compare salaries, sales, or metrics against thresholds from another table.
- Build validation rules in ETL pipelines.
- Filter records based on values returned by subqueries.
- Used in data quality checks and reporting queries.

---

# Commands Practiced

```sql
SELECT employee_name, salary
FROM employees
WHERE salary > ALL
(
    SELECT budget
    FROM departments
);

SELECT employee_name, salary
FROM employees
WHERE salary > ANY
(
    SELECT budget
    FROM departments
);
```

---

# Day 08 Summary

✅ Learned `ALL` and `ANY/SOME` operators.

These operators are useful when comparing a value against the results returned by a subquery. `ALL` requires the condition to be true for every returned value, while `ANY` (or `SOME`) requires it to be true for at least one value.