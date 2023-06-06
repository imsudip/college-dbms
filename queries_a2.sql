-- 1. From the EMP table show the minimum, maximum and average basic for each department (show dept. Code).
SELECT DEPT_CODE, MIN(BASIC) AS Min_Basic, MAX(BASIC) AS Max_Basic, AVG(BASIC) AS Avg_Basic
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 2. Find the number of female employees in each department (show dept. Code).
SELECT DEPT_CODE, COUNT(*) AS Female_Count
FROM EMPLOYEE
WHERE SEX = 'F'
GROUP BY DEPT_CODE;

-- 3. Find the city-wise no. of employees for each department (show dept. Code).
SELECT DEPT_CODE, CITY, COUNT(*) AS Employee_Count
FROM EMPLOYEE
GROUP BY DEPT_CODE, CITY;

-- 4. Show the designation-wise no of employees who have joined in the year 2000 in each department.
-- The listing should appear in the ascending order of no. of employees.
SELECT EMPLOYEE.DEPT_CODE, DESIGNATION.DESIG_DESC, COUNT(*) AS Employee_Count
FROM EMPLOYEE
JOIN DESIGNATION ON EMPLOYEE.DESIG_CODE = DESIGNATION.DESIG_CODE
WHERE JN_DT BETWEEN '2000-01-01' AND '2000-12-31'
GROUP BY EMPLOYEE.DEPT_CODE, DESIGNATION.DESIG_DESC
ORDER BY Employee_Count ASC;

-- 5. Find the department code-wise total basic of male employees only for the departments
-- for which such total is more than 50,000, and the listing should appear in the descending order of total basic.
SELECT EMPLOYEE.DEPT_CODE, SUM(BASIC) AS Total_Basic
FROM EMPLOYEE
WHERE SEX = 'M'
GROUP BY EMPLOYEE.DEPT_CODE
HAVING Total_Basic > 50000
ORDER BY Total_Basic DESC;

-- 6. Show the employee name, Designation description, and basic for all employees.
SELECT EMPLOYEE.EMP_NAME, DESIGNATION.DESIG_DESC, EMPLOYEE.BASIC
FROM EMPLOYEE
JOIN DESIGNATION ON EMPLOYEE.DESIG_CODE = DESIGNATION.DESIG_CODE;

-- 7. Show the employee name, Designation description, Department Name, and Basic for all employees.
SELECT EMPLOYEE.EMP_NAME, DESIGNATION.DESIG_DESC, DEPARTMENT.DEPT_NAME, EMPLOYEE.BASIC
FROM EMPLOYEE
JOIN DESIGNATION ON EMPLOYEE.DESIG_CODE = DESIGNATION.DESIG_CODE
JOIN DEPARTMENT ON EMPLOYEE.DEPT_CODE = DEPARTMENT.DEPT_CODE;

-- 8. Find the department codes in which no employee works.
SELECT DEPARTMENT.DEPT_CODE
FROM DEPARTMENT
LEFT JOIN EMPLOYEE ON DEPARTMENT.DEPT_CODE = EMPLOYEE.DEPT_CODE
WHERE EMPLOYEE.EMP_CODE IS NULL;

-- 9. Find the department names where at least one employee works.
SELECT DEPARTMENT.DEPT_NAME
FROM DEPARTMENT
JOIN EMPLOYEE ON DEPARTMENT.DEPT_CODE = EMPLOYEE.DEPT_CODE
GROUP BY DEPARTMENT.DEPT_NAME;

-- 10. Find the department names where at least 10 employees work.
SELECT DEPARTMENT.DEPT_NAME
FROM DEPARTMENT
JOIN EMPLOYEE ON DEPARTMENT.DEPT_CODE = EMPLOYEE.DEPT_CODE
GROUP BY DEPARTMENT.DEPT_NAME
HAVING COUNT(*) >= 10;

-- 11. Find the department code in which an employee with the highest Basic works.
SELECT DEPT_CODE
FROM EMPLOYEE
WHERE BASIC = (SELECT MAX(BASIC) FROM EMPLOYEE);

-- 12. Find the Designation description of the employee with the highest basic.
SELECT DESIGNATION.DESIG_DESC
FROM EMPLOYEE
JOIN DESIGNATION ON EMPLOYEE.DESIG_CODE = DESIGNATION.DESIG_CODE
WHERE BASIC = (SELECT MAX(BASIC) FROM EMPLOYEE);

-- 13. Find the no. of managers in each department.
SELECT EMPLOYEE.DEPT_CODE, COUNT(*) AS Manager_Count
FROM EMPLOYEE
JOIN DESIGNATION ON EMPLOYEE.DESIG_CODE = DESIGNATION.DESIG_CODE
WHERE DESIGNATION.DESIG_DESC = 'Manager'
GROUP BY EMPLOYEE.DEPT_CODE;

-- 14. Find the maximum basic from EMP table without using MAX().
SELECT EMPLOYEE.BASIC
FROM EMPLOYEE
WHERE NOT EXISTS (SELECT 1 FROM EMPLOYEE WHERE BASIC > EMPLOYEE.BASIC);

-- 15. Find the minimum basic from EMP table without using MIN().
SELECT EMPLOYEE.BASIC
FROM EMPLOYEE
WHERE NOT EXISTS (SELECT 1 FROM EMPLOYEE WHERE BASIC < EMPLOYEE.BASIC);

-- 16. Find the name of the department with the highest total basic.
--     Do the same for the highest average basic and maximum no. of employees.
SELECT DEPARTMENT.DEPT_NAME, SUM(EMPLOYEE.BASIC) AS Total_Basic
FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.DEPT_CODE = DEPARTMENT.DEPT_CODE
GROUP BY DEPARTMENT.DEPT_NAME
ORDER BY Total_Basic DESC
LIMIT 1;

SELECT DEPARTMENT.DEPT_NAME, AVG(EMPLOYEE.BASIC) AS Avg_Basic
FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.DEPT_CODE = DEPARTMENT.DEPT_CODE
GROUP BY DEPARTMENT.DEPT_NAME
ORDER BY Avg_Basic DESC
LIMIT 1;

SELECT DEPARTMENT.DEPT_NAME, COUNT(*) AS Employee_Count
FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.DEPT_CODE = DEPARTMENT.DEPT_CODE
GROUP BY DEPARTMENT.DEPT_NAME
ORDER BY Employee_Count DESC
LIMIT 1;

-- 17. Insert same rows into EMP table with designation code not existing in DESIGNATION table.
INSERT INTO EMPLOYEE (EMP_CODE, EMP_NAME, DEPT_CODE, DESIG_CODE, SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT)
SELECT EMP_CODE, EMP_NAME, DEPT_CODE, 'INVALID_DESIG', SEX, ADDRESS, CITY, STATE, PIN, BASIC, JN_DT
FROM EMPLOYEE
WHERE DESIG_CODE NOT IN (SELECT DESIG_CODE FROM DESIGNATION);

-- 18. Delete the rows from EMP table with an invalid DESIG_CODE.
DELETE FROM EMPLOYEE
WHERE DESIG_CODE NOT IN (SELECT DESIG_CODE FROM DESIGNATION);

-- 19. Find the name of the female employees with basic greater than the average basic of their respective department.
SELECT EMP_NAME
FROM EMPLOYEE
JOIN (
  SELECT DEPT_CODE, AVG(BASIC) AS Avg_Basic
  FROM EMPLOYEE
  GROUP BY DEPT_CODE
) AS AvgTable ON EMPLOYEE.DEPT_CODE = AvgTable.DEPT_CODE
WHERE SEX = 'F' AND BASIC > AvgTable.Avg_Basic;

-- 20. Find the number of female managers.
SELECT COUNT(*) AS Female_Manager_Count
FROM EMPLOYEE
JOIN DESIGNATION ON EMPLOYEE.DESIG_CODE = DESIGNATION.DESIG_CODE
WHERE SEX = 'F' AND DESIGNATION.DESIG_DESC = 'Manager';
