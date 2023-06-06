-- 1. Design and implement the tables

-- Create the Departments table
CREATE TABLE Departments (
  code INT PRIMARY KEY,
  name VARCHAR(100) UNIQUE
);

-- Create the Employees table
CREATE TABLE Employees (
  code INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(100),
  city VARCHAR(100),
  basic DECIMAL(8, 2) CHECK (basic BETWEEN 5000 AND 9000),
  join_date DATE DEFAULT CURRENT_DATE,
  dcode INT,
  CONSTRAINT fk_department FOREIGN KEY (dcode) REFERENCES Departments(code) ON DELETE RESTRICT
);

-- Create the Leaves table
CREATE TABLE Leaves (
  emp_code INT,
  leave_type VARCHAR(100),
  from_date DATE,
  to_date DATE,
  CONSTRAINT fk_employee FOREIGN KEY (emp_code) REFERENCES Employees(code) ON DELETE CASCADE
);

-- 2. Violate the constraints

-- Try to insert an employee with a basic salary below the allowed range
INSERT INTO Employees (code, name, basic) VALUES (1, 'John Doe', 4000);
-- Error: The basic salary violates the CHECK constraint

-- Try to delete a department referenced by an employee record
DELETE FROM Departments WHERE code = 1;
-- Error: Cannot delete department because employee records refer to it

-- 3. Create and manipulate a view

-- a) Create a view showing employee code, name, dcode, and basic for a particular department
CREATE VIEW DepartmentEmployees AS
SELECT e.code AS emp_code, e.name, e.dcode, e.basic
FROM Employees e
JOIN Departments d ON e.dcode = d.code;

-- b) Try to insert a row into the view with a valid department and an invalid one
INSERT INTO DepartmentEmployees (emp_code, name, dcode, basic) VALUES (2, 'Jane Smith', 1, 8000); -- Valid
INSERT INTO DepartmentEmployees (emp_code, name, dcode, basic) VALUES (3, 'Alex Johnson', 5, 9000); -- Invalid
-- Error: The second insert violates the foreign key constraint, referring to an invalid department code

-- c) Find the newly inserted row in the table from which the view was created
SELECT * FROM Employees WHERE code = 2;

-- d) Try to increment basic by Rs.100/-
UPDATE DepartmentEmployees SET basic = basic + 100 WHERE emp_code = 2;

-- e) Check the updated value in the original table
SELECT * FROM Employees WHERE code = 2;

-- f) Delete the view
DROP VIEW DepartmentEmployees;

-- 4. Create and manipulate another view

-- a) Create a view showing empcode, name, deptname, basic, leave type, from date, and to date
CREATE VIEW EmployeeLeaves AS
SELECT e.code AS emp_code, e.name, d.name AS deptname, e.basic, l.leave_type, l.from_date, l.to_date
FROM Employees e
JOIN Departments d ON e.dcode = d.code
LEFT JOIN Leaves l ON l.emp_code = e.code;

-- b) Try to insert a row into the view
INSERT INTO EmployeeLeaves (emp_code, name, deptname, basic, leave_type, from_date, to_date)
VALUES (4, 'Mark Wilson', 'Sales', 7500, 'CL', '2023-05-01', '2023-05-02');
-- Error: The view is not updatable, so you cannot insert rows directly into it

-- c) Try to increment basic by Rs.100
UPDATE Employees SET basic = basic + 100 WHERE code = 4;

-- d) Delete the view
DROP VIEW EmployeeLeaves;

-- 5. Create and manipulate a table with data from existing tables

-- a) Create a table having empcode, Name, deptname, and basic from existing tables for a particular department (d1) and with a basic salary of Rs. 7000/-
CREATE TABLE NewTable AS
SELECT e.code AS empcode, e.name, d.name AS deptname, e.basic
FROM Employees e
JOIN Departments d ON e.dcode = d.code
WHERE d.code = 1 AND e.basic = 7000;

-- b) Insert employees from the existing table with a basic salary greater than or equal to Rs. 7000/-
INSERT INTO NewTable (empcode, name, deptname, basic)
SELECT e.code AS empcode, e.name, d.name AS deptname, e.basic
FROM Employees e
JOIN Departments d ON e.dcode = d.code
WHERE e.basic >= 7000;

-- c) Alter the table to add a net pay column
ALTER TABLE NewTable ADD COLUMN net_pay DECIMAL(8, 2);

-- d) Replace net pay with 1.5 * Basic
UPDATE NewTable SET net_pay = 1.5 * basic;

-- e) Try to remove the net pay column
ALTER TABLE NewTable DROP COLUMN net_pay;
-- Error: The column has data, so it cannot be dropped without losing the data

-- 6. Drop all the tables
DROP TABLE IF EXISTS Leaves;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS NewTable;
