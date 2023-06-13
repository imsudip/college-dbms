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
VALUES ('001', 'Rajesh Kumar', 'PER', 'MGR', 'M', '123 Main St', 'New York', 'NY', '10001', 50000, '2000-01-01'),
       ('002', 'Sunita Sharma', 'PRO', 'EXE', 'F', '456 Elm St', 'Los Angeles', 'CA', '90001', 40000, '2005-03-15'),
       ('003', 'Ramesh Singh', 'PUR', 'OFF', 'M', '789 Oak St', 'Chicago', 'IL', '60601', 30000, '2012-06-30'),
       ('006', 'Suresh Kumar', 'FIN', 'CLK', 'M', '369 Pine St', 'San Francisco', 'CA', '94101', 20000, '2018-09-15'),
       ('007', 'Rajeshwari Devi', 'RES', 'HLP', 'F', '246 Maple St', 'Boston', 'MA', '02101', 10000, '2015-02-28'),
       ('008', 'Sunita Kumari', 'PRO', 'EXE', 'F', '369 Pine St', 'San Francisco', 'CA', '94101', 40000, '2018-09-15');
INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT)
VALUES
    ('009', 'Amit Patel', 'RES', 'HLP', 'M', '789 Oak St', 'Chicago', 'IL', '60601', 15000, '2019-04-10'),
    ('010', 'Anita Verma', 'FIN', 'CLK', 'F', '123 Main St', 'New York', 'NY', '10001', 18000, '2020-07-20'),
    ('011', 'Manoj Sharma', 'PUR', 'OFF', 'M', '456 Elm St', 'Los Angeles', 'CA', '90001', 25000, '2021-09-05'),
    ('012', 'Priya Gupta', 'RES', 'HLP', 'F', '789 Oak St', 'Chicago', 'IL', '60601', 13000, '2017-11-11'),
    ('013', 'Rahul Singh', 'PRO', 'EXE', 'M', '246 Maple St', 'Boston', 'MA', '02101', 35000, '2014-08-18'),
    ('014', 'Anjali Sharma', 'PER', 'MGR', 'F', '369 Pine St', 'San Francisco', 'CA', '94101', 45000, '2013-05-25'),
    ('015', 'Vikas Mehta', 'FIN', 'CLK', 'M', '789 Oak St', 'Chicago', 'IL', '60601', 23000, '2016-02-10'),
    ('016', 'Pooja Kumari', 'PER', 'MGR', 'F', '123 Main St', 'New York', 'NY', '10001', 55000, '2011-07-08'),
    ('017', 'Sanjay Gupta', 'PRO', 'EXE', 'M', '456 Elm St', 'Los Angeles', 'CA', '90001', 38000, '2009-10-12'),
    ('018', 'Deepika Patel', 'PUR', 'OFF', 'F', '789 Oak St', 'Chicago', 'IL', '60601', 32000, '2010-12-30');

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

--Q20 Display the employee information in the ascending order of DEPT_CODE and with
-- in a Department, it should be in the descending order of BASIC.
SELECT * FROM EMPLOYEE ORDER BY DEPT_CODE ASC, BASIC DESC;