Here is everything you need to document your learning for GitHub. I've created a comprehensive Markdown file template that covers all the SQL concepts you learned today, structured cleanly with explanations, examples, and code snippets.

Create a file named **`day12_insert_select_dates_drop_auto_increment_bitwise_compound_ddl_dml.md`** (or a shorter version like **`day12_sql_advanced_concepts.md`**) in your repository and paste the following content into it:

---

# Day 12: Advanced SQL Concepts (Inserts, Dates, Operators, and Table Management)

Welcome to Day 12 of my SQL learning journey! Today's focus was on advanced data manipulation, handling dates, working with various operators, and understanding the crucial differences between database cleanup and deletion commands.

---

## 1. INSERT INTO SELECT

Instead of inserting manual rows using `VALUES`, you can copy data directly from one table into another using a `SELECT` statement. This is extremely useful for backups, migrations, or data aggregation.

```sql
-- Example: Copying inactive users into an archive table
INSERT INTO archived_users (user_id, username, email)
SELECT id, username, email 
FROM users 
WHERE status = 'inactive';

```

---

## 2. Working with Dates

SQL databases have built-in functions to handle date and time data types effectively.

* **Current Date/Time:** `CURRENT_DATE`, `CURRENT_TIMESTAMP`, or `NOW()` depending on the SQL dialect (MySQL, PostgreSQL, SQL Server).
* **Date Arithmetic:** You can add or subtract intervals.

```sql
-- Example: Finding users who registered in the last 30 days (PostgreSQL style)
SELECT * 
FROM users 
WHERE registration_date >= CURRENT_DATE - INTERVAL '30 days';

```

---

## 3. DROP DATABASE

The `DROP` command is a **Data Definition Language (DDL)** operation that completely destroys an entire database, including all its tables, views, stored procedures, and data. *Use with extreme caution!*

```sql
-- Completely removes the database and all its contents
DROP DATABASE test_db;

-- Safer approach: prevents errors if the database doesn't exist
DROP DATABASE IF EXISTS test_db;

```

---

## 4. AUTO INCREMENT

An `AUTO_INCREMENT` (or `IDENTITY` / `SERIAL` depending on the SQL flavor) constraint automatically generates a unique sequential integer whenever a new row is inserted into a table. It is typically used for Primary Keys.

```sql
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100)
);

-- When inserting, you don't need to specify emp_id
INSERT INTO employees (emp_name) VALUES ('Alice Smith');

```

---

## 5. Bitwise Operators

Bitwise operators perform manipulations on data at the bit level (binary representation). Common operators include:

* `&` (Bitwise AND)
* `|` (Bitwise OR)
* `^` (Bitwise XOR)
* `<<` (Left Shift)
* `>>` (Right Shift)

```sql
-- Example: Finding rows where permission flags match
SELECT * 
FROM permissions 
WHERE user_access & 4 = 4;

```

---

## 6. Compound Operators

Compound operators combine an arithmetic operation with an assignment. They are frequently used in `UPDATE` statements to modify existing numeric values.

* `+=`, `-=`, `*=`, `/=` (supported in languages like T-SQL / SQL Server)

```sql
-- Example: Increasing all product prices by 10% in SQL Server
UPDATE products 
SET price *= 1.10;

```

---

## 7. DROP vs. DELETE vs. TRUNCATE

Understanding the difference between these three commands is crucial for database management and performance:

| Feature | `DROP` | `TRUNCATE` | `DELETE` |
| --- | --- | --- | --- |
| **Type** | DDL (Data Definition) | DDL (Data Definition) | DML (Data Manipulation) |
| **Scope** | Deletes the **entire table/database** structure and data. | Removes **all rows** from a table, keeping the structure intact. | Removes **specific rows** (or all rows) based on a `WHERE` clause. |
| **Speed** | Instant | Very fast | Slower (logs each row deletion) |
| **Rollback** | Cannot be rolled back easily. | Cannot be rolled back in most databases. | Can be rolled back using transactions (`ROLLBACK`). |
| **Where Clause** | Not allowed. | Not allowed. | Allowed. |

```sql
-- 1. DELETE: Removes specific rows (can use WHERE)
DELETE FROM orders WHERE status = 'cancelled';

-- 2. TRUNCATE: Wipes all data instantly, keeps table skeleton
TRUNCATE TABLE logs;

-- 3. DROP: Erases the table completely from the database
DROP TABLE temporary_data;

