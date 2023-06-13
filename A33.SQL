-- QUESTION 1: Create the Departments table
CREATE TABLE Departments (
  dcode INTEGER PRIMARY KEY,
  name TEXT UNIQUE
);

-- Insert dummy data into the Departments table
INSERT INTO Departments (dcode, name) VALUES
  (1, 'Department A'),
  (2, 'Department B'),
  (3, 'Department C');

-- QUESTION 1: Create the Employees table
CREATE TABLE Employees (
  empcode INTEGER PRIMARY KEY,
  name TEXT CHECK(name = UPPER(name)),
  address TEXT,
  city TEXT,
  basic REAL CHECK(basic BETWEEN 5000 AND 9000),
  date_of_join TEXT DEFAULT (strftime('%Y-%m-%d', 'now')),
  dcode INTEGER,
  FOREIGN KEY (dcode) REFERENCES Departments(dcode) ON DELETE SET NULL
);

-- Insert dummy data into the Employees table
INSERT INTO Employees (empcode, name, address, city, basic, dcode) VALUES
  (1, 'John Doe', '123 Main St', 'City A', 6000, 1),
  (2, 'Jane Smith', '456 Elm St', 'City B', 7000, 2),
  (3, 'Mike Johnson', '789 Oak St', 'City C', 8000, 1);

-- QUESTION 1: Create the LeaveRecords table
CREATE TABLE LeaveRecords (
  empcode INTEGER,
  leave_type TEXT,
  from_date TEXT,
  to_date TEXT,
  FOREIGN KEY (empcode) REFERENCES Employees(empcode) ON DELETE CASCADE
);

-- Insert dummy data into the LeaveRecords table
INSERT INTO LeaveRecords (empcode, leave_type, from_date, to_date) VALUES
  (1, 'CL', '2023-06-01', '2023-06-02'),
  (1, 'EL', '2023-06-05', '2023-06-10'),
  (2, 'ML', '2023-07-01', '2023-08-31'),
  (3, 'CL', '2023-06-15', '2023-06-16');

-- QUESTION 3a: Create a view showing employee code, name, dcode, and Basic for a particular department
CREATE VIEW EmployeeInfo AS
SELECT e.empcode, e.name, d.dcode, e.basic
FROM Employees e
JOIN Departments d ON e.dcode = d.dcode;

-- QUESTION 4a: Create a view showing empcode, name, deptname, basic, leave type, from date, and to date
CREATE VIEW EmployeeLeaveInfo AS
SELECT e.empcode, e.name, d.name AS deptname, e.basic, l.leave_type, l.from_date, l.to_date
FROM Employees e
JOIN Departments d ON e.dcode = d.dcode
JOIN LeaveRecords l ON e.empcode = l.empcode;

-- QUESTION 5a: Create a table with empcode, name, deptname, and basic from existing tables for employees in a particular department (d1) with a basic salary of Rs. 7000
CREATE TABLE DepartmentEmployees AS
SELECT e.empcode, e.name, d.name AS deptname, e.basic
FROM Employees e
JOIN Departments d ON e.dcode = d.dcode
WHERE d.name = 'Department A' AND e.basic = 7000;

-- QUESTION 5c: Alter the DepartmentEmployees table to add a net pay column
ALTER TABLE DepartmentEmployees
ADD COLUMN net_pay REAL;

-- QUESTION 5d: Insert employees from the existing table with a basic salary greater than or equal to Rs. 7000 into the DepartmentEmployees table
INSERT INTO DepartmentEmployees (empcode, name, deptname, basic)
SELECT e.empcode, e.name, d.name AS deptname, e.basic
FROM Employees e
JOIN Departments d ON e.dcode = d.dcode
WHERE e.basic >= 7000;

-- QUESTION 5d: Update the DepartmentEmployees table to calculate the net pay as 1.5 times the basic salary
UPDATE DepartmentEmployees
SET net_pay = 1.5 * basic;

-- QUESTION 6: Drop the net_pay column from the DepartmentEmployees table
CREATE TABLE DepartmentEmployees_New AS
SELECT empcode, name, deptname, basic
FROM DepartmentEmployees;

DROP TABLE DepartmentEmployees;

ALTER TABLE DepartmentEmployees_New
RENAME TO DepartmentEmployees;

-- QUESTION 6: Drop the EmployeeInfo view
DROP VIEW IF EXISTS EmployeeInfo;

-- QUESTION 6: Drop the EmployeeLeaveInfo view
DROP VIEW IF EXISTS EmployeeLeaveInfo;

-- QUESTION 6: Drop the LeaveRecords table
DROP TABLE IF EXISTS LeaveRecords;

-- QUESTION 6: Drop the Employees table
DROP TABLE IF EXISTS Employees;

-- QUESTION 6: Drop the Departments table
DROP TABLE IF EXISTS Departments;
