-- ***********************
-- Name: Sang Jun Park
-- ID: 112293170
-- Date: 2018-06-17
-- Purpose: Lab 6 DBS301
-- ***********************

-- Q1. SET AUTOCOMMIT ON (do this each time you log on)
--     so any updates, deletes and inserts are automatically committed before you exit from Oracle.
-- Q1. SOLUTION --
SET AUTOCOMMIT ON

-- Q2. Create an INSERT statement to do this. 
--     Add yourself as an employee with a NULL salary, 0.2 commission_pct, in department 90, and Manager 100.  You started TODAY.  
-- Q2. SOLUTION --
INSERT INTO employees
VALUES (777, 'Sang Jun', 'Park', 'SPARK', '123.456.7890', '18-06-17', 'IT_PROG', NULL, 0.2, 90, 100);

-- Q3. Create an Update statement to: Change the salary of the employees with a last name of Matos and Whalen to be 2500.
-- Q3. SOLUTION --
UPDATE employees
SET salary = 2500
WHERE UPPER(last_name) IN ('MATOS', 'WHALEN');

-- Q4. Display the last names of all employees who are in the same department as the employee named Abel.
-- Q4. SOLUTION --
SELECT last_name AS "Last Name"
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM employees
    WHERE UPPER(last_name) = 'ABEL' OR UPPER(first_name) = 'ABEL');

-- Q5. Display the last name of the lowest paid employee(s)
-- Q5. SOLUTION --
SELECT last_name AS "Last Name"
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees);

-- Q6  Display the city that the lowest paid employee(s) are located in.
-- Q6. SOLUTION --
SELECT DISTINCT city AS "City"
FROM locations 
WHERE location_id IN (
    SELECT location_id
    FROM departments
    WHERE department_id IN (
        SELECT department_id
        FROM employees
        WHERE salary = ( 
            SELECT MIN(salary)
            FROM employees)));

-- Q7. Display the last name, department_id, and salary of the lowest paid employee(s) in each department.
--     Sort by Department_ID. (HINT: careful with department 60) 
-- Q7. SOLUTION --
SELECT last_name AS "Last Name",
department_id AS "Department Number",
salary AS "Salary"
FROM employees
WHERE (salary, department_id) IN (
    SELECT MIN(salary), department_id
    FROM employees
    GROUP BY department_id)
ORDER BY department_id;

-- Q8. Display the last name of the lowest paid employee(s) in each city
-- Q8. SOLUTION --
SELECT last_name AS "Last Name"
FROM employees
WHERE salary IN (SELECT MIN(salary)
           FROM locations
           JOIN departments USING (location_id)
           JOIN employees USING (department_id)
           GROUP BY city);
 
-- Q9. Display last name and salary for all employees who earn less than the lowest salary in ANY department.  
--     Sort the output by top salaries first and then by last name.
-- Q9. SOLUTION --
SELECT last_name AS "Last Name",
salary AS "Salary"
FROM employees
WHERE salary < 
    ANY(SELECT MIN(salary)
    FROM employees
    GROUP BY department_id)
ORDER BY salary DESC, last_name;

-- Q10. Display last name, job title and salary for all employees whose salary matches any of the salaries from the IT Department.
--      Do NOT use Join method.
--      Sort the output by salary ascending first and then by last_name
-- Q10. SOLUTION --
SELECT last_name AS "Last Name",
job_id AS "Job title",
salary AS "Salary"
FROM employees
WHERE salary IN(
    SELECT salary
    FROM employees
    WHERE department_id =(
        SELECT department_id
        FROM departments
        WHERE UPPER(department_name) = 'IT'))
ORDER BY salary, last_name;
