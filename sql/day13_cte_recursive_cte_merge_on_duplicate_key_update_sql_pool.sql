/*
============================================================
DAY 13 - MySQL / Data Engineering SQL
============================================================

Topics Covered:
1. CTE (Common Table Expression)
2. Recursive CTE
3. MERGE
4. INSERT ... ON DUPLICATE KEY UPDATE
5. SQL Pool

============================================================
1. CTE (COMMON TABLE EXPRESSION)
============================================================

A CTE is a temporary named result set that can be used
within a single SQL statement.

Syntax:

WITH cte_name AS (
    SELECT ...
)
SELECT ...
FROM cte_name;

Why use CTEs?
- Makes complex queries easier to read
- Breaks a complex query into smaller logical steps
- Makes SQL easier to maintain

Example table:

employees
------------------------------------------------
emp_id | name    | department | salary
------------------------------------------------
1      | Alice   | IT         | 70000
2      | Bob     | HR         | 50000
3      | Charlie | IT         | 80000
4      | David   | Finance    | 60000
5      | Eva     | HR         | 55000
------------------------------------------------

Example:
Find the average salary for each department.

*/

WITH department_avg_salary AS (
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT
    department,
    avg_salary
FROM department_avg_salary;


/*
============================================================
CTE WITH FILTERING
============================================================

Find departments whose average salary is greater than
55000.
*/

WITH department_avg_salary AS (
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT
    department,
    avg_salary
FROM department_avg_salary
WHERE avg_salary > 55000;


/*
Expected result:

department | avg_salary
-----------|-----------
IT         | 75000
Finance    | 60000


Important:

A CTE exists only for the duration of the SQL statement.
It is not a permanent table.
*/


/*
============================================================
2. RECURSIVE CTE
============================================================

A recursive CTE is a CTE that refers to itself.

It is useful for hierarchical data such as:

Employee -> Manager
Employee -> Department hierarchy
Parent -> Child
Folder -> Subfolder
Category -> Subcategory

A recursive CTE normally has two parts:

1. Anchor query
   - Starting point

2. Recursive query
   - Finds the next level

General syntax:

WITH RECURSIVE cte_name AS (

    -- Anchor query
    SELECT ...

    UNION ALL

    -- Recursive query
    SELECT ...
    FROM table
    JOIN cte_name
        ON ...
)
SELECT *
FROM cte_name;


Example table:

employees
--------------------------------
emp_id | name    | manager_id
--------------------------------
1      | Alice   | NULL
2      | Bob     | 1
3      | Charlie | 2
4      | David   | 2
5      | Eva     | 4
--------------------------------

Hierarchy:

Alice
  |
  Bob
 /   \
Charlie David
          |
          Eva

Goal:

Start with Alice and find all employees who report to Alice,
directly or indirectly.
*/

WITH RECURSIVE employee_hierarchy AS (

    -- Anchor query
    -- Start with Alice
    SELECT
        emp_id,
        name,
        manager_id
    FROM employees
    WHERE emp_id = 1

    UNION ALL

    -- Recursive query
    -- Find employees whose manager is the current employee
    SELECT
        e.emp_id,
        e.name,
        e.manager_id
    FROM employees e
    JOIN employee_hierarchy eh
        ON e.manager_id = eh.emp_id
)

SELECT
    emp_id,
    name,
    manager_id
FROM employee_hierarchy;


/*
Expected hierarchy:

emp_id | name    | manager_id
-------|---------|-----------
1      | Alice   | NULL
2      | Bob     | 1
3      | Charlie | 2
4      | David   | 2
5      | Eva     | 4


Important point:

The direction of the JOIN matters.

Correct:

e.manager_id = eh.emp_id

This means:

Find employees whose manager is the employee
currently present in the recursive result.


============================================================
3. MERGE
============================================================

MERGE is commonly used in database systems to combine
INSERT and UPDATE logic based on whether a matching row
already exists.

Conceptually:

If matching row exists:
    UPDATE

If matching row does not exist:
    INSERT

MERGE is commonly associated with systems such as:

- SQL Server
- Oracle
- Other database / data warehouse platforms

IMPORTANT FOR MYSQL:

MySQL does NOT support the standard MERGE statement.

Instead, MySQL commonly uses:

INSERT ... ON DUPLICATE KEY UPDATE


Example concept:

Source data:

emp_id | name | salary
-------|------|-------
2      | Bob  | 60000

Target table already contains:

emp_id | name | salary
-------|------|-------
2      | Bob  | 50000

Desired result:

emp_id | name | salary
-------|------|-------
2      | Bob  | 60000

The MySQL approach for this is shown in the next section.


============================================================
4. INSERT ... ON DUPLICATE KEY UPDATE
============================================================

MySQL provides:

INSERT ... ON DUPLICATE KEY UPDATE

It is used when we want to:

1. Insert a new row if the key does not exist.
2. Update the existing row if a duplicate key is found.

This is often called an "upsert" pattern.

UPsert = UPDATE + INSERT concept.


Example table:

employees
--------------------------------
emp_id | name | salary
--------------------------------
1      | Alice| 70000
2      | Bob  | 50000
--------------------------------

Now we want to insert:

emp_id = 2
name   = Bob
salary = 60000

But emp_id = 2 already exists.

Instead of getting a duplicate key error,
we want Bob's salary to become 60000.

Query:

*/

INSERT INTO employees (emp_id, name, salary)
VALUES (2, 'Bob', 60000)
ON DUPLICATE KEY UPDATE
    salary = 60000;


/*
Result:

emp_id | name  | salary
-------|-------|-------
1      | Alice | 70000
2      | Bob   | 60000


Important:

The duplicate key must be based on a PRIMARY KEY or UNIQUE KEY.

For example:

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2)
);


============================================================
USING THE INSERTED VALUE
============================================================

In modern MySQL versions, the INSERT value can also be
referenced using the INSERT ... VALUES() form, depending
on the exact MySQL version and syntax being used.

A commonly seen form is:

INSERT INTO employees (emp_id, name, salary)
VALUES (2, 'Bob', 60000)
ON DUPLICATE KEY UPDATE
    salary = VALUES(salary);


NOTE:

The VALUES() function in the ON DUPLICATE KEY UPDATE clause
is deprecated in newer MySQL releases. For new code, prefer
the row-alias syntax supported by your MySQL version.

Example:

INSERT INTO employees (emp_id, name, salary)
VALUES (2, 'Bob', 60000) AS new
ON DUPLICATE KEY UPDATE
    salary = new.salary;


/*
============================================================
5. SQL POOL
============================================================

A SQL pool is a collection of compute resources that work
together to process SQL queries.

SQL pools are mainly associated with large-scale analytical
and data warehouse workloads.

The main idea is:

Large amount of data
        |
        v
Distributed across compute resources
        |
        v
Multiple resources process the workload
        |
        v
Large analytical queries can be executed efficiently


Example:

Instead of one machine processing 10 TB of data:

Machine
   |
10 TB
   |
Process everything


A distributed SQL pool can use multiple compute resources:

Compute 1 --> Part of data
Compute 2 --> Part of data
Compute 3 --> Part of data
Compute 4 --> Part of data

Results are combined.

This distributed processing model is useful for
large analytical workloads.


IMPORTANT:

"SQL pool" is not a native MySQL feature.

The term is strongly associated with cloud data warehouse
platforms such as Azure Synapse Analytics.

A dedicated SQL pool in Azure Synapse uses distributed
compute resources for analytical workloads.


============================================================
INTERVIEW DEFINITIONS
============================================================

CTE:

A CTE (Common Table Expression) is a temporary named result
set that improves readability and simplifies complex SQL
queries.


Recursive CTE:

A recursive CTE is a CTE that references itself and is
commonly used to process hierarchical data such as
employee-manager relationships.


MERGE:

MERGE is a statement used in some database systems to
combine INSERT, UPDATE, and matching logic into one operation.
MySQL does not support the standard MERGE statement.


ON DUPLICATE KEY UPDATE:

MySQL's ON DUPLICATE KEY UPDATE allows us to insert a row
when no duplicate key exists and update the existing row
when a duplicate primary or unique key is detected.


SQL Pool:

A SQL pool is a collection of distributed compute resources
used to process SQL queries, especially large-scale analytical
workloads.


============================================================
KEY DIFFERENCES
============================================================

CTE
- Temporary named result
- Exists only for one SQL statement
- Improves readability
- Can be recursive

Recursive CTE
- Self-referencing CTE
- Useful for hierarchical data
- Has anchor + recursive parts

MERGE
- Combines match + INSERT/UPDATE logic
- Supported by some database systems
- Standard MERGE is not supported by MySQL

ON DUPLICATE KEY UPDATE
- MySQL-specific upsert pattern
- INSERT if key does not exist
- UPDATE if duplicate key exists

SQL Pool
- Distributed compute resources
- Mainly for large analytical workloads
- Common in cloud data warehouse platforms


============================================================
DAY 13 SUMMARY
============================================================

What I learned today:

1. CTE
   - WITH
   - Temporary named result
   - Improves query readability

2. Recursive CTE
   - WITH RECURSIVE
   - Anchor query
   - Recursive query
   - UNION ALL
   - Useful for hierarchical data

3. MERGE
   - Combines INSERT/UPDATE logic
   - Common in other database platforms
   - Not supported as standard MERGE in MySQL

4. ON DUPLICATE KEY UPDATE
   - MySQL upsert pattern
   - Handles duplicate PRIMARY KEY / UNIQUE KEY

5. SQL Pool
   - Collection of distributed compute resources
   - Used for large-scale analytical workloads

============================================================
END OF DAY 13
============================================================
*/