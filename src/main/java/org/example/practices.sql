-- Insert data into departments table
INSERT INTO departments (id, name, location) VALUES
(1, 'Software Development', 'San Francisco'),
(2, 'Quality Assurance', 'New York'),
(3, 'IT Support', 'Chicago'),
(4, 'DevOps', 'Austin'),
(5, 'Product Management', 'Seattle');

-- Insert data into jobs table
INSERT INTO jobs (id, title, min_salary, max_salary) VALUES
(1, 'Software Engineer', 70000, 120000),
(2, 'QA Engineer', 60000, 100000),
(3, 'IT Specialist', 50000, 90000),
(4, 'DevOps Engineer', 80000, 130000),
(5, 'Product Manager', 90000, 150000);

-- Insert data into employees table
INSERT INTO employees (id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '123-456-7890', '2022-01-15', 1, 96000, 1),
(2, 'Bob', 'Smith', 'bob.smith@example.com', '123-456-7891', '2021-03-10', 1, 90000, 1),
(3, 'Charlie', 'Brown', 'charlie.brown@example.com', '123-456-7892', '2020-07-20', 1, 85000, 1),
(4, 'Diana', 'White', 'diana.white@example.com', '123-456-7893', '2022-05-25', 2, 80000, 2),
(5, 'Eve', 'Black', 'eve.black@example.com', '123-456-7894', '2021-11-30', 2, 78000, 2),
(6, 'Frank', 'Green', 'frank.green@example.com', '123-456-7895', '2020-09-15', 2, 77000, 2),
(7, 'Grace', 'Adams', 'grace.adams@example.com', '123-456-7896', '2022-03-01', 3, 70000, 3),
(8, 'Hank', 'Miller', 'hank.miller@example.com', '123-456-7897', '2021-06-10', 3, 72000, 3),
(9, 'Ivy', 'Wilson', 'ivy.wilson@example.com', '123-456-7898', '2020-12-05', 3, 71000, 3),
(10, 'Jack', 'Taylor', 'jack.taylor@example.com', '123-456-7899', '2022-08-15', 4, 95000, 4),
(11, 'Karen', 'Anderson', 'karen.anderson@example.com', '123-456-7800', '2021-04-20', 4, 94000, 4),
(12, 'Leo', 'Thomas', 'leo.thomas@example.com', '123-456-7801', '2020-10-30', 4, 93000, 4),
(13, 'Mia', 'Moore', 'mia.moore@example.com', '123-456-7802', '2022-02-18', 5, 88000, 5),
(14, 'Noah', 'Martin', 'noah.martin@example.com', '123-456-7803', '2021-09-12', 5, 87000, 5),
(15, 'Olivia', 'Clark', 'olivia.clark@example.com', '123-456-7804', '2020-05-25', 5, 86000, 5),
(16, 'Paul', 'Lewis', 'paul.lewis@example.com', '123-456-7805', '2022-07-01', 1, 92000, 1),
(17, 'Quinn', 'Walker', 'quinn.walker@example.com', '123-456-7806', '2021-01-15', 2, 79000, 2),
(18, 'Rachel', 'Hall', 'rachel.hall@example.com', '123-456-7807', '2020-03-10', 3, 73000, 3),
(19, 'Steve', 'Allen', 'steve.allen@example.com', '123-456-7808', '2022-11-05', 4, 97000, 4),
(20, 'Tina', 'Young', 'tina.young@example.com', '123-456-7809', '2021-08-20', 5, 85000, 5);

-- Insert data into projects table
INSERT INTO projects (id, name, start_date, end_date, budget) VALUES
(1001, 'Cloud Migration', '2023-01-01', '2023-06-30', 300000),
(1002, 'AI Development', '2023-02-01', '2023-12-31', 500000),
(1003, 'Cybersecurity Upgrade', '2023-03-01', '2023-09-30', 200000),
(1004, 'Mobile App Launch', '2023-04-01', '2023-11-30', 400000);

-- Insert data into employee_projects table
INSERT INTO employee_projects (employee_id, project_id) VALUES
(1, 1001),
(2, 1001),
(3, 1002),
(4, 1002),
(5, 1003),
(6, 1003),
(7, 1004),
(8, 1004),
(9, 1001),
(10, 1002),
(11, 1003),
(12, 1004),
(13, 1001),
(14, 1002),
(15, 1003),
(16, 1004),
(17, 1001),
(18, 1002),
(19, 1003),
(20, 1004);


-- File: hr_management_practices.sql

-- 3. Joins, Subqueries, and Set Operators

-- 15. Types of Joins
-- INNER JOIN: Retrieve employees and their respective departments
SELECT e.id AS employee_id, e.first_name, e.last_name, d.name AS department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;

-- 17. LEFT JOIN: Retrieve all employees and their departments (even if no department is assigned)
SELECT e.id AS employee_id, e.first_name, e.last_name, d.name AS department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id;

-- 18. RIGHT JOIN: Retrieve all departments and their employees (even if no employees are assigned)
SELECT e.id AS employee_id, e.first_name, e.last_name, d.name AS department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.id;

-- 19. FULL OUTER JOIN: Retrieve all employees and departments, including unmatched rows
# SELECT e.id AS employee_id, e.first_name, e.last_name, d.name AS department_name
# FROM employees e
# FULL OUTER JOIN departments d ON e.department_id = d.id;
-- Note: FULL OUTER JOIN is not supported in MySQL. Use UNION of LEFT JOIN and RIGHT JOIN instead.
-- Simulate FULL OUTER JOIN using LEFT JOIN and RIGHT JOIN with UNION
SELECT e.id AS employee_id, e.first_name, e.last_name, d.name AS department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id
UNION
SELECT e.id AS employee_id, e.first_name, e.last_name, d.name AS department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.id;

-- 20. SELF JOIN: Find employees who share the same department
SELECT e1.first_name AS employee_1, e2.first_name AS employee_2, d.name AS department_name
FROM employees e1
INNER JOIN employees e2 ON e1.department_id = e2.department_id AND e1.id != e2.id
INNER JOIN departments d ON e1.department_id = d.id;

-- 21. CROSS JOIN: Assign all employees to all projects (Cartesian product)
SELECT e.first_name, p.name AS project_name
FROM employees e
CROSS JOIN projects p;

-- 22. UNION: Combine employees and departments into a single list of names
SELECT first_name AS name FROM employees
UNION
SELECT name FROM departments;

-- UNION ALL: Same as above but includes duplicates
SELECT first_name AS name FROM employees
UNION ALL
SELECT name FROM departments;

-- 23. INTERSECT: Find common names between employees and departments (if any)
# SELECT first_name AS name FROM employees
# INTERSECT
# SELECT name FROM departments;
-- Note: INTERSECT is not supported in MySQL. Use INNER JOIN instead.
-- Simulate INTERSECT using INNER JOIN
SELECT e.first_name AS name
FROM employees e
INNER JOIN departments d ON e.first_name = d.name;


-- 24. EXCEPT: Find employees whose names are not department names
# SELECT first_name AS name FROM employees
# EXCEPT
# SELECT name FROM departments;
-- Note: EXCEPT is not supported in MySQL. Use LEFT JOIN instead.
-- Simulate EXCEPT using LEFT JOIN
SELECT e.first_name AS name
FROM employees e
LEFT JOIN departments d ON e.first_name = d.name
WHERE d.name IS NULL;


-- 25. Subquery: Find employees working in the "HR" department
SELECT first_name, last_name
FROM employees
WHERE department_id = (SELECT id FROM departments WHERE name = 'DevOps');

-- 26. Nested Query: Find employees working on projects with a budget greater than $100,000
SELECT first_name, last_name
FROM employees
WHERE id IN (
    SELECT employee_id
    FROM employee_projects
    WHERE project_id IN (
        SELECT id
        FROM projects
        WHERE budget > 100000
    )
);

-- 4. Aggregate Functions & Grouping

-- 27. Aggregate Functions: Examples
-- COUNT: Count the number of employees
SELECT COUNT(*) AS total_employees FROM employees;

-- SUM: Calculate the total salary of all employees
SELECT SUM(salary) AS total_salary FROM employees;

-- AVG: Calculate the average salary of employees
SELECT AVG(salary) AS average_salary FROM employees;

-- MIN: Find the minimum salary
SELECT MIN(salary) AS minimum_salary FROM employees;

-- MAX: Find the maximum salary
SELECT MAX(salary) AS maximum_salary FROM employees;

-- 33. GROUP BY: Group employees by department and count them
SELECT d.name AS department_name, COUNT(e.id) AS employee_count
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
GROUP BY d.name;

-- 34. HAVING: Filter departments with more than 5 employees
SELECT d.name AS department_name, COUNT(e.id) AS employee_count
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
GROUP BY d.name
HAVING COUNT(e.id) > 3;

-- 35. WHERE vs HAVING
-- WHERE: Filter employees with salary greater than $50,000
SELECT first_name, last_name, salary
FROM employees
WHERE salary > 50000;

-- HAVING: Filter departments with an average salary greater than $60,000
SELECT d.name AS department_name, AVG(e.salary) AS average_salary
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
GROUP BY d.name
HAVING AVG(e.salary) > 60000;

-- find third-highest salary
SELECT DISTINCT salary, employees.first_name, employees.last_name
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- find second-highest salary
SELECT DISTINCT salary, employees.first_name, employees.last_name
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- find top 3 salaries
SELECT DISTINCT salary, employees.first_name, employees.last_name
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- find top 3 salaries with rank
SELECT DISTINCT salary, employees.first_name, employees.last_name,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- update salaries of Steve Allen and Alice Johnson
UPDATE employees
SET salary = CASE
                 WHEN first_name = 'Steve' AND last_name = 'Allen' THEN 97000.00
                 WHEN first_name = 'Alice' AND last_name = 'Johnson' THEN 96000.00
    END
WHERE (first_name = 'Steve' AND last_name = 'Allen') OR (first_name = 'Alice' AND last_name = 'Johnson');


-- find third-highest salary after update
SELECT DISTINCT salary, employees.first_name, employees.last_name
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- find second-highest salary after update
SELECT DISTINCT salary, employees.first_name, employees.last_name
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- find top 3 salaries after update
SELECT DISTINCT salary, employees.first_name, employees.last_name
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- find top 3 salaries with rank after update
SELECT DISTINCT salary, employees.first_name, employees.last_name,
                DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees
ORDER BY salary DESC
LIMIT 3;



-- 1. String Functions
-- LENGTH: Get the length of a string
SELECT LENGTH('Hello World') AS string_length;

-- REPLACE: Replace part of a string
SELECT REPLACE('Hello World', 'World', 'SQL') AS replaced_string;

-- CONCAT: Concatenate strings
SELECT CONCAT('Hello', ' ', 'World') AS concatenated_string;

-- LOWER: Convert a string to lowercase
SELECT LOWER('HELLO WORLD') AS lowercase_string;

-- UPPER: Convert a string to uppercase
SELECT UPPER('hello world') AS uppercase_string;

-- TRIM: Remove leading and trailing spaces
SELECT TRIM('   Hello World   ') AS trimmed_string;

-- SUBSTRING: Extract a portion of a string
SELECT SUBSTRING('Hello World', 1, 5) AS substring_example;

-- 2. Date Functions
-- CURRENT_DATE: Get the current date
SELECT CURRENT_DATE() AS today;

-- DATE_ADD: Add days to a date
SELECT DATE_ADD('2023-01-01', INTERVAL 30 DAY) AS new_date;

-- DATEDIFF: Calculate the difference between two dates
SELECT DATEDIFF('2023-12-31', '2023-01-01') AS date_difference;

-- 3. Joins
-- INNER JOIN: Retrieve employees and their respective departments
SELECT e.id AS employee_id, e.first_name, e.last_name, d.name AS department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;

-- LEFT JOIN: Retrieve all employees and their departments (even if no department is assigned)
SELECT e.id AS employee_id, e.first_name, e.last_name, d.name AS department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id;

-- RIGHT JOIN: Retrieve all departments and their employees (even if no employees are assigned)
SELECT e.id AS employee_id, e.first_name, e.last_name, d.name AS department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.id;

-- FULL OUTER JOIN: Simulate using UNION of LEFT JOIN and RIGHT JOIN
SELECT e.id AS employee_id, e.first_name, e.last_name, d.name AS department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id
UNION
SELECT e.id AS employee_id, e.first_name, e.last_name, d.name AS department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.id;

-- SELF JOIN: Find employees who share the same department
SELECT e1.first_name AS employee_1, e2.first_name AS employee_2, d.name AS department_name
FROM employees e1
INNER JOIN employees e2 ON e1.department_id = e2.department_id AND e1.id != e2.id
INNER JOIN departments d ON e1.department_id = d.id;

-- CROSS JOIN: Assign all employees to all projects (Cartesian product)
SELECT e.first_name, p.name AS project_name
FROM employees e
CROSS JOIN projects p;

-- 4. Subqueries
-- Subquery: Find employees working in the "DevOps" department
SELECT first_name, last_name
FROM employees
WHERE department_id = (SELECT id FROM departments WHERE name = 'DevOps');

-- Nested Query: Find employees working on projects with a budget greater than $100,000
SELECT first_name, last_name
FROM employees
WHERE id IN (
    SELECT employee_id
    FROM employee_projects
    WHERE project_id IN (
        SELECT id
        FROM projects
        WHERE budget > 100000
    )
);

-- 5. Aggregate Functions
-- COUNT: Count the number of employees
SELECT COUNT(*) AS total_employees FROM employees;

-- SUM: Calculate the total salary of all employees
SELECT SUM(salary) AS total_salary FROM employees;

-- AVG: Calculate the average salary of employees
SELECT AVG(salary) AS average_salary FROM employees;

-- MIN: Find the minimum salary
SELECT MIN(salary) AS minimum_salary FROM employees;

-- MAX: Find the maximum salary
SELECT MAX(salary) AS maximum_salary FROM employees;

-- 6. Grouping and Filtering
-- GROUP BY: Group employees by department and count them
SELECT d.name AS department_name, COUNT(e.id) AS employee_count
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
GROUP BY d.name;

-- HAVING: Filter departments with more than 3 employees
SELECT d.name AS department_name, COUNT(e.id) AS employee_count
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
GROUP BY d.name
HAVING COUNT(e.id) > 3;

-- 7. Ranking and Window Functions
-- Find top 3 salaries with rank
SELECT DISTINCT salary, employees.first_name, employees.last_name,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- 8. Update Queries
-- Update salaries of Steve Allen and Alice Johnson
UPDATE employees
SET salary = CASE
                 WHEN first_name = 'Steve' AND last_name = 'Allen' THEN 97000.00
                 WHEN first_name = 'Alice' AND last_name = 'Johnson' THEN 96000.00
    END
WHERE (first_name = 'Steve' AND last_name = 'Allen') OR (first_name = 'Alice' AND last_name = 'Johnson');