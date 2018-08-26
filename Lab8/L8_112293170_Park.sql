-- ***********************
-- Name: Sang Jun Park
-- ID: 112293170
-- Date: 2018-07-17
-- Purpose: Lab 8 DBS301
-- ***********************

--Q1.
--Create all the tables listed above.  Use the data dictionary to determine column properties.
--*** All foreign key constraints MUST be given a name. ***
--Check your constraints by using the SELECT statement given above for each table.
--Try entering data into the table tblSemester.
--INSERT INTO tblSemester
--(SemesterID, SemesterCode,SemesterYear,SemesterSeason)
--VALUES
--(1,’Fall 2016’,2016,’Spring’)
--;
--You should receive an error because the constraint for the SemesterSeason has been violated.  You can change the values to check your constraints have been set properly and also change the table name and columns to check your other tables.

--A1.
CREATE TABLE tblCourse 
(
CourseID NUMBER(38) NOT NULL,
CourseCode VARCHAR(6) NOT NULL UNIQUE,
CHECK (CourseID > 0),
PRIMARY KEY (CourseID)
);

CREATE TABLE tblInstrucot
(
InstructorID NUMBER(38) NOT NULL,
InstructorNumber VARCHAR(15) NOT NULL UNIQUE,
InstructorFname VARCHAR(25),
InstructorLname VARCHAR(25) NOT NULL,
CHECK (InstructorID > 0),
PRIMARY KEY (InstructorID)
);

CREATE TABLE tblStudent
(
StudentID NUMBER(38) NOT NULL,
StudentNumber VARCHAR(11)NOT NULL UNIQUE,
StudentFname VARCHAR(20),
StudentLname VARCHAR(20) NOT NULL,
CHECK (StudentID > 0),
PRIMARY KEY (StudentID)
);

CREATE TABLE tblSemester
(
SemesterID NUMBER(38) NOT NULL,
SemesterCode VARCHAR(11) NOT NULL UNIQUE,
SemesterYear NUMBER(4) NOT NULL UNIQUE,
SemesterSeason VARCHAR(6) NOT NULL,
CHECK (SemesterYear > 2000),
CHECK (SemesterSeason IN ('Fall', 'Winter', 'Summer')),
PRIMARY KEY (SemesterID)
);

CREATE TABLE tblCourseDetail
(
CourseID NUMBER(38) NOT NULL,
StudentID NUMBER(38) NOT NULL,
SemesterID NUMBER(38) NOT NULL,
InstructorID NUMBER(38) NOT NULL,
CourseGreade VARCHAR(2) NOT NULL,
CourseFinalGreade NUMBER(5,2)NOT NULL,
CHECK (CourseGreade IN('F', 'D', 'D+', 'C', 'C+', 'B', 'B+', 'A', 'A+')),
CHECK (CourseFinalGreade BETWEEN 0 AND 100),
PRIMARY KEY (CourseID, StudentID, SemesterID),
CONSTRAINT CourseID_fk
    FOREIGN KEY (CourseID)
    REFERENCES tblCourse(CourseID),
CONSTRAINT StudentID_fk
    FOREIGN KEY (StudentID)
    REFERENCES tblStudent(StudentID),
CONSTRAINT SemesterID_fk
    FOREIGN KEY (SemesterID)
    REFERENCES tblSemester(SemesterID),
CONSTRAINT InstructorID_fk
    FOREIGN KEY (InstructorID)
    REFERENCES tblInstrucot(InstructorID)    
);

--Q2.	
--Add a new column to the existing table tblCourse with the following properties.

--A2.
ALTER TABLE tblCourse ADD(CourseDesc VARCHAR(35) Not Null);

--Q3.
--Remove the UNIQUE constraint on the column SemesterYear in the table tblSemester.

--A3.	
ALTER TABLE tblSemester DROP UNIQUE (SemesterYear);

--Q4.
--Change the name of the column CourseGrade in the table tblCourseDetail to CourseLetterGrade.

--A4.
ALTER TABLE tblCourseDetail RENAME COLUMN CourseGrade TO CourseLetterGrade;

--Q5.
--Change the length of characters allowed in the 2 columns StudentFname and StudentLname in the table tblStudent to be 25 characters.  Use a single statement – not 2 statements.

--A5.
ALTER TABLE tblStudent MODIFY(StudentFname VARCHAR(25), StudentLname VARCHAR(25));