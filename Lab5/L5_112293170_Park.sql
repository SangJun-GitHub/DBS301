-- ***********************
-- Name: Sang Jun Park
-- ID: 112293170
-- Date: 2018-06-10
-- Purpose: Lab 5 DBS301
-- ***********************

-- Q1. Display the department name, city, street address and postal code for departments sorted by city and department name.
-- Q1. SOLUTION --
SElECT D.department_name AS "Departmet Name", 
L.city AS "City", 
L.street_address AS "Street Address", 
L.postal_code AS "Postal Code"
FROM departments D JOIN locations L ON D.location_id = L.location_id
ORDER BY L.city, D.department_name;

-- Q2.Display full name of employees as a single field using format of Last, First, their hire date, salary, department name and city,
--    but only for departments with names starting with an A or S sorted by department name and employee name.
-- Q2. SOLUTION --
SELECT E.last_name ||' '|| E.first_name AS "Full Name",
E.hire_date AS "Hire Date",
to_char (E.salary, '$999,999.99') as "Salary",
D.department_name AS "Department Name",
L.city AS "City"
FROM employees E JOIN departments D ON E.department_id = D.department_id
JOIN locations L ON D.location_id = L.location_id
WHERE UPPER(D.department_name) LIKE 'A%' OR UPPER(D.department_name) LIKE 'S%'
ORDER BY D.department_name, E.last_name;

-- Q3. Display the full name of the manager of each department in states/provinces of Ontario, California and Washington along with the department name, city, postal code and province name.   
--     Sort the output by city and then by department name.
-- Q3. SOLUTION --
SELECT E.last_name||' '|| E.first_name AS "Full Name",
D.department_name AS "Department Name",
L.city AS "City",
L.postal_code AS "Postal Code",
L.state_province AS "Province Name"
FROM departments D JOIN employees E ON D.manager_id = E.employee_id
JOIN locations L ON D.location_id = L.location_id
WHERE l.state_province IN('Ontario', 'California', 'Washington')
ORDER BY L.city, D.department_name;

-- Q4. Display employee’s last name and employee number along with their manager’s last name and manager number. 
--     Label the columns Employee, Emp#, Manager, and Mgr# respectively.
-- Q4. SOLUTION --
SELECT E.last_name AS "Employee", 
E.employee_id AS "Emp#",
M.last_name AS "Manager",
M.employee_id AS "Mgr#"
FROM employees E
JOIN employees M ON E.manager_id = M.employee_id;

-- Q5. Display the department name, city, street address, postal code and country name for all Departments. 
--     Use the JOIN and USING form of syntax.  
--     Sort the output by department name descending.
-- Q5. SOLUTION --
SELECT D.department_name AS "Department Name",
L.city AS "City",
L.street_address AS "Street Address",
L.postal_code AS "Postal Code",
C.country_name AS "Country Name"
FROM departments D JOIN locations L USING (location_id)
JOIN countries C USING (country_id)
ORDER BY D.department_name DESC;

-- Q6. Display full name of the employees, their hire date and salary together with their department name, but only for departments which names start with A or S. 
--     Full name should be in format of:
--     a. First / Last. Use the JOIN and ON form of syntax.
--     b. Sort the output by department name and then by last name.
-- Q6. SOLUTION --
SELECT E.first_name||' '||E.last_name AS "Full Name",
E.hire_date||' '||to_char(E.salary, '$999,999.99')||' '||D.department_name AS "Informations"
FROM employees E JOIN departments D ON E.department_id = D.department_id
WHERE UPPER(D.department_name) LIKE 'A%' OR UPPER(D.department_name) LIKE 'S%'
ORDER BY D.department_name, E.last_name;

-- Q7. Rewrite the previous question by using Standard (Old -- prior to Oracle9i) Join method.
-- Q7. SOLUTION --
SELECT E.first_name||' '||E.last_name AS "Full Name",
E.hire_date||' '||to_char(E.salary, '$999,999.99')||' '||D.department_name AS "Informations"
FROM employees E, departments D
WHERE (E.department_id = D.department_id) AND (UPPER(D.department_name) LIKE 'A%' OR UPPER(D.department_name) LIKE 'S%')
ORDER BY D.department_name, E.last_name;

-- Q8. Display full name of the manager of each department in provinces Ontario, California and Washington plus department name, city, postal code and province name. 
--     Full name should be in format as follows:
--     a. Last, First.  Use the JOIN and ON form of syntax.
--     b. Sort the output by city and then by department name.
-- Q8. SOLUTION --
SELECT E.last_name||' '||E.first_name AS "Full Name",
D.department_name AS "Department Name",
L.city AS "City",
L.postal_code AS "Postal Code",
L.state_province AS "Province Name"
FROM departments D JOIN employees E ON (D.department_id = E.department_id)
JOIN locations L ON (D.location_id = L.location_id)
WHERE (L.state_province IN('Ontario', 'California', 'Washington')) AND (E.employee_id = D.manager_id)
ORDER BY L.city, D.department_name;

-- Q9. Rewrite the previous question by using Standard (Old -- prior to Oracle9i) Join method.
-- Q9. SOLUTION --
SELECT E.last_name||' '||E.first_name AS "Full Name",
D.department_name AS "Department Name",
L.city AS "City",
L.postal_code AS "Postal Code",
L.state_province AS "Province Name"
FROM departments D, employees E, locations L
WHERE (D.department_id = E.department_id) AND (D.location_id = L.location_id) AND
(l.state_province IN('Ontario', 'California', 'Washington')) AND (E.employee_id = D.manager_id)
ORDER BY L.city, D.department_name;

-- Q10. Display the department name and Highest, Lowest and Average pay per each department. Name these results High, Low and Avg.
--      a. Use JOIN and ON form of the syntax.
--      b. Sort the output so that department with highest average salary are shown first.
-- Q10. SOLUTION --
SELECT D.department_name AS "Department Name",
to_char(MAX(E.salary), '$999,999.99') AS "Highest",
to_char(MIN(E.salary), '$999,999.99') AS "Lowest",
to_char(AVG(E.salary), '$999,999.99') AS "Average"
FROM departments D JOIN employees E ON E.department_id = D.department_id 
GROUP BY D.department_name
ORDER BY "Average" DESC;

-- Q11. Display the employee last name and employee number along with their manager’s last name and manager number. Label the columns Employee, 
--      a. Emp#, Manager, and Mgr#, respectively. Include also employees who do
--      b. NOT have a manager and also employees who do NOT supervise anyone (or you could say managers without employees to supervise).
-- Q11. SOLUTION --
SELECT E.last_name AS "Employee",
E.employee_id "Emp#",
M.last_name AS "Manager",
E.manager_id AS "Mgr#"
FROM employees E 
FULL OUTER JOIN employees M ON E.manager_id = M.employee_id;
