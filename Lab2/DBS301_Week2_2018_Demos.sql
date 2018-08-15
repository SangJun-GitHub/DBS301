-- Week 2 Lecture Notes
-- Generic SELECT Syntax to this point

-- SELECT <FieldList comma separated>
--     FROM <tablename>
--     WHERE <one or more conditions>
--     ORDER BY <field list, comma separated, ASC, DESC>

-- Example 1
SELECT * 
    FROM employees
    WHERE SALARY >= 6000;
    
SELECT employee_id, first_name, last_name, hire_date ,job_id, salary 
    FROM employees
    WHERE SALARY >= 6000;
    
    
SELECT employee_id, first_name, last_name, hire_date ,job_id, salary 
    FROM employees
    WHERE SALARY >= 6000
    ORDER BY Salary DESC;
    
-- Example 2 - strings
SELECT employee_id, first_name, last_name, job_id
    FROM employees
    WHERE last_name = 'Fay';
    
    -- let's add wildcard
SELECT employee_id, first_name, last_name, job_id
    FROM employees
    WHERE last_name LIKE 'D%';
    
        -- let's add wildcard
SELECT employee_id, first_name, last_name, job_id
    FROM employees
    WHERE last_name LIKE '%n';
    
            -- let's add wildcard
SELECT employee_id, first_name, last_name, job_id
    FROM employees
    WHERE last_name LIKE '%n%';
    
-- DATES
        -- give me all employees whom have been here since before 1990
SELECT employee_id, first_name, last_name, hire_date, job_id
    FROM employees
    WHERE hire_date < DATE '1990-04-01';
    
    -- but this fails when wswoitching between canada and the USA
    -- so we need to specify the format we want and lock it in.
SELECT employee_id, first_name, last_name, hire_date, job_id
    FROM employees
    WHERE hire_date < to_date('04011990', 'ddmmyyyy');
    
-- AND nad OR   ORDER OF PRECEDENCE
SELECT employee_id, first_name AS "fname", last_name, job_id
    FROM employees
    ORDER BY "fname";
    
    -- ORDER
    -- for now
    -- 1) FROM 
    -- 2) SELECT (fields and aliases)
    -- 3) ORDER BY
    -- 4) WHERE
    --         BEDMAS

-- ORDER BY multiple Roiws
SELECT employee_id, first_name AS "fname", last_name, job_id
    FROM employees
    ORDER BY "fname", last_name DESC;
    -- second sort only happens if first has duplicates
    
    -- usingcolumn INDEXES
SELECT employee_id, last_name,first_name AS "fname",  job_id
    FROM employees
    ORDER BY 2, 3 DESC;