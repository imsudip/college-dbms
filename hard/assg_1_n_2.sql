drop database assignment2;
create database assignment2; 
use assignment2;
 
CREATE TABLE EMPLOYEE (
    EMP_CODE VARCHAR(16) PRIMARY KEY NOT NULL,
    EMP_NAME VARCHAR(20),
    DEPT_CODE VARCHAR(16),
    DESIG_CODE VARCHAR(16),
    SEX CHAR(1),
    ADDRESS VARCHAR(25),
    CITY VARCHAR(20),
    STATE VARCHAR(20),
    PIN INTEGER,
    BASIC INTEGER,
    JN_DT DATE
);

CREATE TABLE DESIGNATION (
    DESIG_CODE VARCHAR(16) PRIMARY KEY NOT NULL,
    DESIG_DESC VARCHAR(20)
);

CREATE TABLE DEPARTMENT (
    DEPT_CODE VARCHAR(16) PRIMARY KEY NOT NULL,
    DEPT_NAME VARCHAR(20)
);

/*Q2 describe all tables*/
show tables;
describe EMPLOYEE;
describe DESIGNATION;
describe DEPARTMENT;


/*Q3 insert values into the tables*/
INSERT INTO DESIGNATION (DESIG_CODE, DESIG_DESC) VALUES
('MGR', 'Manager'),
('EXE', 'Executive'),
('OFC', 'Officer'),
('CLK', 'Clerk'),
('HLP', 'Helper');

INSERT INTO DEPARTMENT (DEPT_CODE, DEPT_NAME) VALUES
('PER', 'Personnel'),
('PRO', 'Production'),
('PUR', 'Purchase'),
('FIN', 'Finance'),
('RES', 'Research');

INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E001', 'Anjali Sharma', 'PER', 'MGR', 'F', '123 Main St', 'Mumbai', 'Maharashtra', '400001', 75000, '2022-01-01'),
('E002', 'Rahul Singh', 'PRO', 'EXE', 'M', '456 Elm St', 'Delhi', 'Delhi', '110001', 60000, '2022-02-15'),
('E003', 'Kavita Patel', 'PUR', 'OFC', 'F', '789 Maple St', 'Ahmedabad', 'Gujarat', '380001', 50000, '2022-03-31'),
('E004', 'Sandeep Gupta', 'FIN', 'CLK', 'M', '321 Oak St', 'Kolkata', 'West Bengal', '700001', 30000, '2022-04-15'),
('E005', 'Priya Kumari', 'RES', 'HLP', 'F', '654 Pine St', 'Chennai', 'Tamil Nadu', '600001', 0, '2022-05-01'),
('E006', 'Amit Kumar', 'PRO', 'MGR', 'M', '789 Main St', 'Bengaluru', 'Karnataka', '560001', 80000, '2022-06-01'),
('E007', 'Sarika Singh', 'PER', 'EXE', 'F', '456 Elm St', 'Delhi', 'Delhi', '110001', 60000, '2022-07-15'),
('E008', 'Rahul Sharma', 'RES', 'OFC', 'M', '654 Pine St', 'Chennai', 'Tamil Nadu', '600001', 45000, '2022-08-31'),
('E009', 'Neha Singh', 'FIN', 'CLK', 'F', '321 Oak St', 'Kolkata', 'West Bengal', '700001', 35000, '2022-09-15'),
('E010', 'Mohan Gupta', 'PRO', 'HLP', 'M', '987 Maple St', 'Bengaluru', 'Karnataka', '560001', 0, '2022-10-01'),
('E011', 'Sumana Choudhary', 'PER', 'MGR', 'F', '456 Main St', 'Mumbai', 'Maharashtra', '400001', 80000, '2022-11-01'),
('E012', 'Rajeev Singh', 'PRO', 'EXE', 'M', '654 Elm St', 'Delhi', 'Delhi', '110001', 65000, '2022-12-15'),
('E013', 'Sanjay Patel', 'PUR', 'OFC', 'M', '321 Maple St', 'Ahmedabad', 'Gujarat', '380001', 45000, '2023-01-31'),
('E014', 'Swati Sharma', 'RES', 'CLK', 'F', '654 Pine St', 'Chennai', 'Tamil Nadu', '600001', 30000, '2023-02-15');

/*Q4 In EMP table insert few rows without DEPT_CODE and BASIC. */
INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, JN_DT) VALUES
('E016', 'Ravi Sharma', 'OFC', 'M', '123 Main St', 'Mumbai', 'Maharashtra', '400001', '2023-03-01'),
('E017', 'Rajesh Kumar', 'HLP', 'M', '456 Elm St', 'Delhi', 'Delhi', '110001', '2023-04-15'),
('E018', 'Priyanka Singh', 'MGR', 'F', '789 Maple St', 'Ahmedabad', 'Gujarat', '380001', '2023-05-31');

INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E0019', 'Anjali Sharma', 'PER', 'MGR', 'F', '123 Main St', 'Kozikode', 'Maharashtra', '400001', 75000, '2022-01-01');

INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E0020', 'Anjali Sharma', 'PER', 'MGR', 'F', '123 Main St', 'Kozikode', 'Maharashtra', '400001', 75000, '2020-01-01');
INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E0021', 'Anjali Sharma', 'PUR', 'MGR', 'F', '123 Main St', 'Kozikode', 'Maharashtra', '400001', 75000, '2020-01-01');

INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E0022', 'Anjali Sharma', 'PER', 'MGR', 'F', '123 Main St', 'Kozikode', 'Maharashtra', '400001', 75000, '2000-01-01');
INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E0023', 'Anjali Sharma', 'PUR', 'MGR', 'F', '123 Main St', 'Kozikode', 'Maharashtra', '400001', 75000, '2000-01-01');

INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E0024', 'Anjali Sharma1', 'PUR', 'MGR', 'F', '123 Main St', 'Kozikode', 'Maharashtra', '400001', 75001, '2000-01-01');
INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E0025', 'Anjali Sharma2', 'PUR', 'MGR', 'F', '123 Main St', 'Kozikode', 'Maharashtra', '400001', 75002, '2000-01-01');
INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E0026', 'Anjali Sharma3', 'PUR', 'MGR', 'F', '123 Main St', 'Kozikode', 'Maharashtra', '400001', 75003, '2000-01-01');
INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E0027', 'Anjali Sharma4', 'PUR', 'MGR', 'F', '123 Main St', 'Kozikode', 'Maharashtra', '400001', 75004, '2000-01-01');
INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E0028', 'Anjali Sharma5', 'PUR', 'MGR', 'F', '123 Main St', 'Kozikode', 'Maharashtra', '400001', 75005, '2000-01-01');
INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E0029', 'Anjali Sharma6', 'PUR', 'MGR', 'F', '123 Main St', 'Kozikode', 'Maharashtra', '400001', 75006, '2000-01-01');
INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E0030', 'Anjali Sharma7', 'PUR', 'MGR', 'F', '123 Main St', 'Kozikode', 'Maharashtra', '400001', 75007, '2000-01-01');
INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E0031', 'Anjali Sharma8', 'PUR', 'MGR', 'F', '123 Main St', 'Kozikode', 'Maharashtra', '400001', 75008, '2000-01-01');

INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E0032', 'KKK Sharma', 'FIN', 'MGR', 'F', '123 Main St', 'Kozikode', 'Maharashtra', '400001', 75000, '2000-01-01');
INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) VALUES
('E0033', 'KKK ssd', 'RES', 'MGR', 'F', '123 Main St', 'Kozikode', 'Maharashtra', '400001', 75000, '2000-01-01');
/* select * from EMPLOYEE;*/
/*Q.5 Find the rows with unassigned DEPT_CODE*/
select * from EMPLOYEE
where DEPt_CODE is NULL;

/*Q.6 Find the rows with with basic that is 0 */
select * from employee where basic = 0;

/*Q.6 Find the rows with with basic that is 0 */
select * from employee where basic = 0;

/*Q.7 Find the rows with unassigned Basic [note down the difference between the results
obtained in Q.6 and Q.7] */
select * from employee where basic is NULL;

/*Q.8 Find the average basic of the employees. */
select avg(basic) as avg_salary from employee;

/*Q.9 Replace the BASIC with 0 for the rows with unassigned Basic. */
update employee
set basic = 0
where basic is NULL;

/*Q.10 Again, find the average Basic. (Note the difference of result obtained in Q.8 &amp; Q.10.) */
select avg(basic) as avg_salary from employee;

/*Q.11 Delete the rows with unassigned DEPT_CODE. */
delete from employee 
where dept_code is NULL;

/*Q.12 Say, Net pay of an employee= Basic+HRA+DA where HRA is 50% of the Basic &amp;
DA is 40% of Basic. Show the employee name &amp; Net pay for all employees. */
select (basic + (basic * (50 / 100)) + (basic * (40 / 100))) as net_pay from employee;

/*Q.13 Show the EMP_NAME & BASIC in the ascending order of DEPT_CODE. The
employee name must appear in uppercase. */
select (upper(emp_name)), basic from employee
order by dept_code asc;

/*Q.14 Find the employees who have joined after 1 st January 2010. */
SELECT emp_name, jn_dt
FROM employee
WHERE jn_dt > '2010-01-01';

/*Q.15 Find, how many employees have joined in the month of January? */
SELECT count(*) as e_count
FROM employee
WHERE month(jn_dt) = 1;

/*-----------------------------------------------------------------------------------------------------------------------------------------*/
/*assg 2*/

/*1 From the EMP table show the minimum, maximum and average basic for each
department (show dept. Code).*/
select dept_code, min(basic), max(basic), avg(basic) from employee
group by dept_code;


/*2 Find the number of female employees in each department (show dept. Code).*/
select dept_code, count(*)
from employee
where sex = 'F'
group by dept_code;

/*3 Find the city wise no. of employees for each department (show dept. Code).*/
select dept_code, city, count(*)
from employee
where sex = 'F'
group by dept_code, city;

/*4 Show the designation wise no of employees who have joined in the year 2000 in each department. The listing should appear in the ascending order of no. of employees.*/
SELECT desig_code , COUNT(*) FROM employee WHERE 
year(JN_DT) = '2000' GROUP BY desig_code ORDER BY COUNT(*) desc; 

/*5 how the designation wise no of employees who have joined in the year 2000 in each department. The listing should appear in the ascending order of no. of employees.*/
SELECT desig_code , COUNT(*) FROM employee WHERE 
year(JN_DT) = '2000' GROUP BY desig_code ORDER BY COUNT(*) desc; 

/*6 Show the employee name, Designation description and basic for all employees.*/
SELECT e.EMP_NAME, d.DESIG_DESC , e.BASIC FROM EMPLOYEE e, DESIGNATION d 
WHERE e.DESIG_CODE = d.DESIG_CODE;

/*7 Show the employee name, Designation description, Department Name &amp; Basic for all
employees.*/
SELECT e.EMP_NAME, d.DESIG_DESC, dp.DEPT_NAME, e.BASIC 
FROM EMPLOYEE e, DESIGNATION d, DEPARTMENT dp 
WHERE e.DESIG_CODE = d.DESIG_CODE AND 
e.DEPT_CODE = dp.DEPT_CODE; 

/*8 Find the department Codes in which no employee works.*/
SELECT DEPT_CODE FROM DEPARTMENT WHERE DEPT_CODE 
NOT IN (SELECT DEPT_CODE FROM EMPLOYEE); 

/*9 Find the department names where at least one employee works.*/
SELECT DEPT_CODE FROM DEPARTMENT WHERE DEPT_CODE 
IN (SELECT DEPT_CODE FROM EMPLOYEE); 

/*10 Find the department names where at least 10 employees work.*/
SELECT d.DEPT_NAME FROM DEPARTMENT d 
WHERE (SELECT COUNT(*) FROM EMPLOYEE e WHERE e.DEPT_CODE = d.DEPT_CODE) > 9; 

-- 11. Find the department code in which employee with highest Basic works.
SELECT DEPT_CODE, BASIC AS MAX_BASIC FROM EMPLOYEE 
WHERE BASIC = (SELECT MAX(BASIC) FROM EMPLOYEE);

-- 12 Find the Designation description of the employee with highest basic.
SELECT d.DESIG_DESC , e.BASIC AS MAX_BASIC 
FROM EMPLOYEE e, DESIGNATION d 
WHERE e.DESIG_CODE = d.DESIG_CODE 
AND e.BASIC = (SELECT MAX(BASIC) FROM EMPLOYEE); 

-- 13 Find the no. of managers in each department.
SELECT d.DEPT_NAME, COUNT(*) AS NO_OF_MANAGER 
FROM EMPLOYEE e, DEPARTMENT d WHERE 
e.DEPT_CODE = d.DEPT_CODE 
AND e.DESIG_CODE = (SELECT DESIG_CODE FROM DESIGNATION 
WHERE DESIG_DESC = 'Manager') 
GROUP BY d.DEPT_NAME; 

-- 14. Find the maximum basic from EMP table without using MAX().
SELECT basic FROM employee
ORDER BY basic DESC
LIMIT 1;

SELECT distinct basic
FROM employee
WHERE basic >= ALL (SELECT basic FROM employee where basic is not null);

-- 15. Find the minimum basic from EMP table without using MIN().
SELECT basic FROM employee
where basic is not null
ORDER BY basic ASC
LIMIT 1;

SELECT distinct basic
FROM employee
WHERE basic <= ALL (SELECT basic FROM employee where basic is not null);

-- 16. Find the name of the department with highest total basic. Do the same for highest average basic and maximum no. of employee.
-- highest total basic

SELECT d.DEPT_NAME, e.BASIC FROM EMPLOYEE e, DEPARTMENT d
WHERE e.DEPT_CODE = d.DEPT_CODE AND e.BASIC >= ALL(SELECT BASIC FROM EMPLOYEE where BASIC IS NOT NULL);

-- highest avg basic
SELECT DEPT_NAME, BASIC AS AVERAGE_BASIC FROM 
(SELECT DEPT_NAME , AVG(BASIC) AS BASIC FROM EMPLOYEE e, 
DEPARTMENT d 
WHERE e.DEPT_CODE = d.DEPT_CODE GROUP BY DEPT_NAME) as tmp
WHERE BASIC = (SELECT MAX(BASIC) FROM 
(SELECT DEPT_NAME, AVG(BASIC) AS BASIC FROM EMPLOYEE e, 
DEPARTMENT d WHERE 
e.DEPT_CODE = d.DEPT_CODE GROUP BY DEPT_NAME) as tmp1); 

-- maximum no. of employee.
SELECT DEPT_NAME, EMP_NO AS MAXIMUM_NO_OF_EMPLOYEE 
FROM (SELECT DEPT_NAME, COUNT(EMP_CODE) AS EMP_NO FROM 
EMPLOYEE e, DEPARTMENT d WHERE e.DEPT_CODE = d.DEPT_CODE GROUP BY 
DEPT_NAME) as tmp 
WHERE EMP_NO = (SELECT MAX(EMP_NO) FROM 
(SELECT DEPT_NAME, COUNT(EMP_CODE) AS EMP_NO FROM EMPLOYEE e, DEPARTMENT d 
WHERE e.DEPT_CODE = d.DEPT_CODE GROUP BY DEPT_NAME) as tmp1); 

-- 17 Insert same rows into EMP table with designation code not existing in DESIGNATION table.
INSERT INTO EMPLOYEE(EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) 
VALUES('E0034','Sarthak dubey', 'PUR', 'SALES', 'M', '45B Gariahat Road', 'Kolkata', 'West Bengal','700034', 45000, '2019-02-01');
INSERT INTO EMPLOYEE(EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT) 
VALUES('E0035','Sarthak dubey', 'PUR', 'MARKETING', 'M', '45B Gariahat Road', 'Kolkata', 'West Bengal','700034', 45000, '2019-02-01');

-- 18 Delete the rows from EMP table with invalid DESIG_CODE.
DELETE FROM EMPLOYEE WHERE DESIG_CODE NOT IN (SELECT DESIG_CODE FROM DESIGNATION);

-- 19. Find the name of the female employees with basic greater than the average basic of their respective department.

SELECT e.EMP_NAME, e.BASIC FROM EMPLOYEE e, DEPARTMENT d 
WHERE e.DEPT_CODE = d.DEPT_CODE AND BASIC > (SELECT AVG(BASIC) 
FROM EMPLOYEE e, DEPARTMENT d WHERE e.DEPT_CODE = d.DEPT_CODE AND e.SEX = 'F') AND e.SEX = 'F';

-- 20. Find the number of female managers.
SELECT COUNT(*) AS NO_OF_FEMALE_MANAGER FROM EMPLOYEE e, DESIGNATION d 
WHERE e.DESIG_CODE = d.DESIG_CODE AND e.SEX = 'F' AND d.DESIG_CODE = 'MGR'; 


drop table EMPLOYEE;
drop table DEPARTMENT;
drop table DESIGNATION;