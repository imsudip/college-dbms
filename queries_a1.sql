-- Q1

CREATE TABLE EMPLOYEE
(
EMP_CODE CHAR(16) PRIMARY KEY,
EMP_NAME CHAR(20),
DEPT_CODE CHAR(16),
DESIG_CODE CHAR(16),
SEX CHAR(1),
ADDRESS CHAR(25),
CITY CHAR(20),
STATE CHAR(20),
PIN CHAR(6),
BASIC NUMBER,
JN_DT DATE
);

CREATE TABLE DESIGNATION
(
DESIG_CODE CHAR(16) PRIMARY KEY,
DESIG_DESC CHAR(20)
);

CREATE TABLE DEPARTMENT
(
DEPT_CODE CHAR(16) PRIMARY KEY,
DEPT_NAME CHAR(20)
);

-- Q2. Display the structure of each table 
PRAGMA table_info(EMPLOYEE);
PRAGMA table_info(DESIGNATION);
PRAGMA table_info(DEPARTMENT);

-- Q3.Insert data into tables
INSERT INTO DESIGNATION (DESIG_CODE, DESIG_DESC)
VALUES ('MGR', 'Manager'), ('EXE', 'Executive'), ('OFF', 'Officer'), ('CLK', 'Clerk'), ('HLP', 'Helper');

INSERT INTO DEPARTMENT (DEPT_CODE, DEPT_NAME)
VALUES ('PER', 'Personnel'), ('PRO', 'Production'), ('PUR', 'Purchase'), ('FIN', 'Finance'), ('RES', 'Research');

INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT)
VALUES ('001', 'John Doe', 'PER', 'MGR', 'M', '123 Main St', 'New York', 'NY', '10001', 50000, '2000-01-01'),
       ('002', 'Jane Smith', 'PRO', 'EXE', 'F', '456 Elm St', 'Los Angeles', 'CA', '90001', 40000, '2005-03-15'),
       ('003', 'Bob Johnson', 'PUR', 'OFF', 'M', '789 Oak St', 'Chicago', 'IL', '60601', 30000, '2012-06-30');

-- Indian names
INSERT INTO EMPLOYEE 

--Q4 Insert rows without DEPT_CODE and BASIC
INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, JN_DT)
VALUES ('004', 'Sally Brown', 'CLK', 'F', '246 Maple St', 'Boston', 'MA', '02101', '2015-02-28'),
       ('005', 'Mike Davis', 'HLP', 'M', '369 Pine St', 'San Francisco', 'CA', '94101', '2018-09-15');

--Q5 Find the rows with unassigned DEPT_CODE
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IS NULL;

--Q6 Find the rows with BASIC equal to zero
SELECT * FROM EMPLOYEE WHERE BASIC = 0;

--Q7 Find the rows with unassigned Basic
SELECT * FROM EMPLOYEE WHERE BASIC IS NULL;

--Q8 Find the average basic of the employees
SELECT AVG(BASIC) FROM EMPLOYEE;

--Q9 Replace the BASIC with 0 for the rows with unassigned Basic
UPDATE EMPLOYEE SET BASIC = 0 WHERE BASIC IS NULL;

--Q10 Find the average Basic again
SELECT AVG(BASIC) FROM EMPLOYEE;

--Q11 Delete the rows with unassigned DEPT_CODE
DELETE FROM EMPLOYEE WHERE DEPT_CODE IS NULL;

--Q12 Calculate net pay and display employee name and net pay
SELECT EMP_NAME, BASIC + (BASIC * 0.5) + (BASIC * 0.4) AS NET_PAY FROM EMPLOYEE;

--Q13 Display EMP_NAME and BASIC in ascending order of DEPT_CODE
SELECT UPPER(EMP_NAME), BASIC FROM EMPLOYEE ORDER BY DEPT_CODE ASC;

--Q14 Find employees who joined after 1st January 2010
SELECT * FROM EMPLOYEE WHERE JN_DT > '2010-01-01';

--Q15 Find how many employees joined in January
SELECT COUNT(*) FROM EMPLOYEE WHERE strftime('%m', JN_DT) = '01';

--Q16 Find the maximum and minimum Basic
SELECT MAX(BASIC), MIN(BASIC) FROM EMPLOYEE;

--Q17 Find how many Female employees are there
SELECT COUNT(*) FROM EMPLOYEE WHERE SEX = 'F';

--Q18 Replace CITY with existing value converted into uppercase for all rows
UPDATE EMPLOYEE SET CITY = UPPER(CITY);

--Q19 Find how many different cities various employees are residing
SELECT COUNT(DISTINCT CITY) FROM EMPLOYEE;

--Q20 Display employee information in ascending order of DEPT_CODE
SELECT * FROM EMPLOYEE ORDER BY DEPT_CODE ASC;
