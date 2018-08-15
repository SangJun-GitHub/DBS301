-- ***********************
-- Name: Sang Jun Park
-- ID: 112293170
-- Date: 5/11/2018
-- Purpose: Lab 1 DBS301
-- ***********************

--Q1. Start by entering in the SQL Developer worksheet:
--a. SELECT * FROM EMPLOYEES;
--a. SOLUTION
SELECT * FROM employees;
--a. RESULTS
--EMPLOYEE_ID   FIRST_NAME  LAST_NAME   EMAIL       PHONE_NUMBER        HIRE_DATE   JOB_ID      SALARY  COMMISSION_PCT  MANAGER_ID  DEPARTMENT_ID
-------------------------------------------------------------------------------------------------------------------------------------------------
--        100	Steven	    King	    SKING	    515.123.4567	    87-06-17	AD_PRES	    24000			                    90
--        101	Neena	    Kochhar	    NKOCHHAR	515.123.4568	    89-09-21	AD_VP	    17000		            100	        90
--        102	Lex	        De Haan	    LDEHAAN	    515.123.4569	    93-01-13	AD_VP	    17000		            100	        90
--        103	Alexander	Hunold	    AHUNOLD	    590.423.4567	    90-01-03	IT_PROG	    9000		            102	        60
--        104	Bruce	    Ernst	    BERNST	    590.423.4568	    91-05-21	IT_PROG	    6000		            103	        60
--        107	Diana	    Lorentz	    DLORENTZ	590.423.5567	    99-02-07	IT_PROG	    4200		            103	        60
--        124	Kevin	    Mourgos	    KMOURGOS	650.123.5234	    99-11-16	ST_MAN	    5800		            100     	50
--        141	Trenna	    Rajs	    TRAJS	    650.121.8009	    95-10-17	ST_CLERK	3500		            124     	50
--        142	Curtis	    Davies	    CDAVIES	    650.121.2994	    97-01-29	ST_CLERK	3100		            124     	50
--        143	Randall	    Matos	    RMATOS	    650.121.2874	    98-03-15	ST_CLERK	2600		            124     	50
--        144	Peter	    Vargas	    PVARGAS	    650.121.2004	    98-07-09	ST_CLERK	2500		            124     	50
--        149	Eleni	    Zlotkey	    EZLOTKEY	011.44.1344.429018	00-01-29	SA_MAN	    10500	0.2	            100     	80
--        174	Ellen	    Abel	    EABEL	    011.44.1644.429267	96-05-11	SA_REP	    11000	0.3	            149      	80
--        176	Jonathon	Taylor	    JTAYLOR	    011.44.1644.429265	98-03-24	SA_REP	    8600	0.2	            149	        80
--        178	Kimberely	Grant	    KGRANT	    011.44.1644.429263	99-05-24	SA_REP	    7000	0.15	        149	
--        200	Jennifer	Whalen	    JWHALEN	    515.123.4444	    87-09-17	AD_ASST	    4400		            101	        10
--        201	Michael	    Hartstein	MHARTSTE	515.123.5555	    96-02-17	MK_MAN	    13000		            100     	20
--        202	Pat	        Fay	        PFAY	    603.123.6666	    97-08-17	MK_REP	    6000		            201	        20
--        205	Shelley	    Higgins	    SHIGGINS	515.123.8080	    94-06-07	AC_MGR	    12000		            101	        110
--        206	William	    Gietz	    WGIETZ	    515.123.8181	    94-06-07	AC_ACCOUNT	8300		            205	        110

--b. SELECT * FROM DEPARTMENTS;
--b. SOLUTION
SELECT * FROM departments;
--b. RESULTS
--DEPARTMENT_ID DEPARTMENT_NAME     MANAGER_ID  LOCATION_ID
-----------------------------------------------------------
--10	        Administration	    200	        1700
--20	        Marketing	        201	        1800
--50	        Shipping	        124     	1500
--60	        IT	                103	        1400
--80	        Sales	            149	        2500
--90	        Executive	        100	        1700
--110	        Accounting	        205     	1700
--190	        Contracting		                1700

--c. SELECT * FROM JOB_HISTORY;
--c. SOLUTION
SELECT * FROM job_history;
--c. RESULTS
--EMPLOYEE_ID   START_DATE  END_DATE    JOB_ID      DEPARTMENT_ID
-----------------------------------------------------------------
--102	        93-01-13	98-07-24	IT_PROG	    60
--101	        89-09-21	93-10-27	AC_ACCOUNT	110
--101	        93-10-28	97-03-15	AC_MGR	    110
--201	        96-02-17	99-12-19	MK_REP	    20
--114	        98-03-24	99-12-31	ST_CLERK	50
--122	        99-01-01	99-12-31	ST_CLERK	50
--200	        87-09-17	93-06-17	AD_ASST	    90
--176       	98-03-24	98-12-31	SA_REP  	80
--176	        99-01-01	99-12-31	SA_MAN	    80
--200	        94-07-01	98-12-31	AC_ACCOUNT	90

--d. Which one of these tables appeared to be the widest? or longest?
--d. SOLUTION : The employees table is widest and longest.


--Q2. Using SQL Plus – enter the same three lines (one at a time) – Provide answers to questions below in commented lines in SQL file.
--a. at the prompt enter the command
--a. SOLUTION : SET pagesize 200

--b.Did it have an effect to improve the look of the display?
--b. SOLUTION : It affects at display, it changes page size.

--c. Do the same for the longest table.
--You should have seen that there were not headings every 10 lines as it increased the page length to 200.  

--d. You should try to find a SET command that will increase the length of each line to improve readability and remove the word wrap effect. 
--d. SOLUTION : SET linesize 100


--Q3. If the following SELECT statement does NOT execute successfully, how would you fix it?
--SELECT last_name “LName”, job_id “Job Title”, 
--Hire Date “Job Start”
--FROM employees;
--SOLUTION 
SELECT last_name as "LName", job_id as "Job Title", Hire_Date as "Job Start" FROM EMPLOYEES;
--RESULTS
--LName     Job Title   Job Start
---------------------------------
--King	    AD_PRES	    87-06-17
--Kochhar	AD_VP	    89-09-21
--De Haan	AD_VP	    93-01-13
--Hunold	IT_PROG	    90-01-03
--Ernst	    IT_PROG	    91-05-21
--Lorentz	IT_PROG	    99-02-07
--Mourgos	ST_MAN	    99-11-16
--Rajs	    ST_CLERK	95-10-17
--Davies	ST_CLERK	97-01-29
--Matos	    ST_CLERK	98-03-15
--Vargas	ST_CLERK	98-07-09
--Zlotkey	SA_MAN	    00-01-29
--Abel	    SA_REP	    96-05-11
--Taylor	SA_REP	    98-03-24
--Grant	    SA_REP	    99-05-24
--Whalen	AD_ASST	    87-09-17
--Hartstein	MK_MAN	    96-02-17
--Fay	    MK_REP	    97-08-17
--Higgins	AC_MGR	    94-06-07
--Gietz	    AC_ACCOUNT	94-06-07


--Q4.	There are THREE coding errors in this statement. Can you identify them?
--SELECT employee_id, last name, commission_pct Emp Comm,
--FROM employees;
--SOLUTION 
SELECT employee_id, last_name, commission_pct as "Emp Comm" From employees;
--1 last name is not correct coulme name.
--2 missing "as"
--3 enclose Emp and Comm with double quteation marks
--4 not neccessary "," after "Comm"
--RESULTS
--EMPLOYEE_ID   LAST_NAME   Emp Comm
------------------------------------
--100	        King	
--101	        Kochhar	
--102	        De Haan	
--103	        Hunold	
--104	        Ernst	
--107	        Lorentz	
--124	        Mourgos	
--141	        Rajs	
--142	        Davies	
--143	        Matos	
--144	        Vargas	
--149	        Zlotkey 	0.2
--174	        Abel	    0.3
--176	        Taylor	    0.2
--178	        Grant	    0.15
--200	        Whalen	
--201	        Hartstein	
--202	        Fay	
--205	        Higgins	
--206	        Gietz	


--Q5. What command would show the structure of the LOCATIONS table?
--SOLUTION 
DESCRIBE locations;
--RESULTS
--Name           Null?    Type         
-------------- -------- ------------ 
--LOCATION_ID    NOT NULL NUMBER(4)    
--STREET_ADDRESS          VARCHAR2(40) 
--POSTAL_CODE             VARCHAR2(12) 
--CITY           NOT NULL VARCHAR2(30) 
--STATE_PROVINCE          VARCHAR2(25) 
--COUNTRY_ID              CHAR(2)  


--Q6 Create a query to display the output shown below.
--SOLUTION 
SELECT location_id AS "City#", City as "City", state_province||' IN THE '||country_id AS "Province with Country Code" FROM locations WHERE location_id<=1100;
--RESULTS
--CITY# CITY        Province with Country Code
----------------------------------------------
--1000	Roma	    IN THE IT
--1100	Venice	    IN THE IT

--Advence
SELECT location_id AS "City#", City as "City", (CASE WHEN state_province IS NOT NULL
THEN state_province||' IN THE '||country_id ELSE  'IN THE ' || country_id END)
AS "Province with Country Code" FROM locations ;