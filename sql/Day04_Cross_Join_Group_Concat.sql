/*
==========================================================
Day 04 - CROSS JOIN & GROUP_CONCAT()
Author : Krishna Vamsi
Goal   : Learn CROSS JOIN and GROUP_CONCAT()
==========================================================
*/

----------------------------------------------------------
1. CROSS JOIN
----------------------------------------------------------

-- CROSS JOIN is also known as Cartesian Product.
-- It combines every row from the first table
-- with every row from the second table.

Syntax:

SELECT *
FROM table1
CROSS JOIN table2;


Example:

SELECT *
FROM employees
CROSS JOIN departments;


If:
employees = 8 rows
departments = 5 rows

Result = 8 × 5 = 40 rows


----------------------------------------------------------
Difference Between INNER JOIN and CROSS JOIN
----------------------------------------------------------

INNER JOIN

✔ Requires ON condition
✔ Returns matching rows only
✔ Based on common column values

Example:

SELECT *
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;


CROSS JOIN

✔ No ON condition required
✔ Returns every possible combination
✔ Result = m × n rows

Example:

SELECT *
FROM employees
CROSS JOIN departments;


----------------------------------------------------------
Real-World Use Cases of CROSS JOIN
----------------------------------------------------------

1. Product × Size combinations
2. Product × Color combinations
3. Restaurant Menu (Item × Variant)
4. Calendar Dates × Employees
5. Test Data Generation


----------------------------------------------------------
Why CROSS JOIN Should Be Used Carefully
----------------------------------------------------------

• Generates a very large number of rows
• Can consume more memory
• Slower query execution
• May return unnecessary data
• Use only when every possible combination is required


----------------------------------------------------------
2. GROUP_CONCAT()
----------------------------------------------------------

GROUP_CONCAT() combines multiple row values
into a single string.

Usually used with GROUP BY.

Syntax:

SELECT column_name,
       GROUP_CONCAT(column_name)
FROM table_name
GROUP BY column_name;


----------------------------------------------------------
Example 1
----------------------------------------------------------

SELECT dept_id,
       GROUP_CONCAT(emp_name)
FROM employees
GROUP BY dept_id;


Output:

dept_id   employees
-------   -----------------------
10        Krishna,Rahul,Priya
20        John,Alice


----------------------------------------------------------
Custom Separator
----------------------------------------------------------

SELECT dept_id,
       GROUP_CONCAT(emp_name SEPARATOR ' | ')
FROM employees
GROUP BY dept_id;


Output:

10   Krishna | Rahul | Priya


----------------------------------------------------------
Using GROUP_CONCAT() with JOIN
----------------------------------------------------------

SELECT
    d.dept_name,
    GROUP_CONCAT(e.emp_name SEPARATOR ', ') AS Employees
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;


Output:

IT        Krishna, Rahul, Priya
HR        Alice, John


----------------------------------------------------------
GROUP_CONCAT() Without GROUP BY
----------------------------------------------------------

SELECT GROUP_CONCAT(emp_name)
FROM employees;


Output:

Krishna,Rahul,Priya,Alice,John


Since there is no GROUP BY,
all rows are treated as one group.


----------------------------------------------------------
Interview Questions
----------------------------------------------------------

1. What is CROSS JOIN?

2. Why is CROSS JOIN called Cartesian Product?

3. How many rows will CROSS JOIN return
   if table A has 12 rows and table B has 6 rows?

4. Difference between INNER JOIN and CROSS JOIN?

5. When should CROSS JOIN be avoided?

6. What is GROUP_CONCAT()?

7. Can GROUP_CONCAT() be used without GROUP BY?

8. How do you change the separator in GROUP_CONCAT()?

9. Give real-world use cases of GROUP_CONCAT().

10. Explain a scenario where you would use CROSS JOIN
    in a Data Engineering project.


----------------------------------------------------------
Commands Learned So Far
----------------------------------------------------------

Day 01
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


----------------------------------------------------------
Git Commands
----------------------------------------------------------

git add .

git commit -m "Add SQL Day 04 CROSS JOIN and GROUP_CONCAT notes"

git push