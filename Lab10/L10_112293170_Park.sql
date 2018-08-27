-- ***********************
-- Name: Sang Jun Park
-- ID: 112293170
-- Date: 2018-07-31
-- Purpose: Lab 10 DBS301
-- ***********************

--Q1. 
--Create a VIEW called  DepartmentEmployeeCount_View that will display the total number of employees in each department (show only employees that have been assigned to a department).
--Only the columns shown should be in the view. Sort by department name in alphabetical order.

--A1.
CREATE VIEW DepartmentEmployeeCount_View AS 
SELECT D.department_name AS "DEPARTMENT",
COUNT(E.employee_id) AS "# of Employees"
FROM departments D INNER JOIN employees E
ON D.department_id = E.department_id
GROUP BY D.department_name
ORDER BY D.department_name;

--Q2. 	
--You MUST do question 1 before doing this question.
--Modify the existing view called DepartmentEmployeeCount_View to display the number of employees in each department and if an employee has not been assigned to a department they should be classified in a department called "Not Yet Assigned".
--Sort alphabetically by Department Name.

--A2
CREATE OR REPLACE VIEW DepartmentEmployeeCount_View AS
SELECT NVL(D.department_name, 'Not Yet Assigned') AS "DEPARTMENT", 
COUNT(E.employee_id) AS "# of Employees"
FROM employees E LEFT JOIN departments D
ON E.department_id = D.department_id
GROUP BY D.department_name
ORDER BY D.department_name;
SELECT * FROM DepartmentEmployeeCount_View;

--Q3.
--Create a view called DepartmentEmployees_View.  It should show all employees and their associated departments.  
--If an employee has not yet been assigned to a department it should display "Not Yet Assigned" in the department name column.
--Note: There are 2 different Jonathan Taylor's in the Sales department.
--Order by Department and Employee name in alphabetical order.  The view should only contain the 2 columns shown.

--A3
CREATE VIEW DepartmentEmployees_View AS
SELECT NVL(D.department_name, 'Not Yet Assigned') AS "Department",E.first_name ||' '|| E.last_name AS "EMPLOYEE"
FROM employees E LEFT JOIN departments D
ON E.department_id = D.department_id
ORDER BY D.department_name, E.first_name, E.last_name ;
SELECT * FROM DepartmentEmployees_View;

