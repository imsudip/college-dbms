-- 1a) Create EMP table
CREATE TABLE EMP (
  ECODE INTEGER PRIMARY KEY,
  ENAME TEXT,
  DCODE TEXT,
  GRADE CHAR(1),
  BASIC REAL,
  "JN-DT" DATE
);

-- b) Insert dummy data
INSERT INTO EMP (ECODE, ENAME, DCODE, GRADE, BASIC, "JN-DT") VALUES
  (1, 'John', 'D001', 'A', 7000, '2000-01-01'),
  (2, 'Jane', 'D002', 'B', 8000, '2001-02-03'),
  (3, 'Mike', 'D001', 'A', 9000, '2002-03-04'),
  (4, 'Sarah', 'D002', 'B', 6000, '2003-04-05');

-- 2) Change column headings
.headers on
.header "ECODE" "EMPLOYEE CODE"
.header "ENAME" "NAME"
.header "DCODE" "DEPT.CODE"
.header "JN-DT" "JOINING DATE"

ALTER TABLE EMP
RENAME COLUMN ECODE TO "EMPLOYEE CODE";
ALTER TABLE EMP
RENAME COLUMN ENAME TO "NAME";
ALTER TABLE EMP
RENAME COLUMN DCODE TO "DEPT.CODE";
ALTER TABLE EMP
RENAME COLUMN "JN-DT" TO "JOINING DATE";

-- 3) Set column formats
.mode column

-- Format of BASIC
PRAGMA format_basic = '7,000'

-- Format of GRADE
PRAGMA format_grade = 'FULL_COLUMN_NAME'

-- Format of JN-DT
PRAGMA format_jn_dt = 'MONTH DAY,YYYY'

-- 4a) Show display attributes of all columns
PRAGMA table_info(EMP);

-- 4b) Show display attributes of particular column
PRAGMA table_info(EMP.'JN-DT');

-- 4c) Suppress display attributes of JN-DT
PRAGMA format_jn_dt = ''

-- 4d) Reset display attributes of JN-DT
PRAGMA format_jn_dt = 'MONTH DAY,YYYY'

-- 4e) Reset display attributes of all columns
PRAGMA format_basic = ''
PRAGMA format_grade = ''

-- 4f) Show display attributes of all columns
PRAGMA table_info(EMP);

-- 5a) Show records in ascending order of DCODE
.mode line
SELECT EMP.*, CASE WHEN LAG(DCODE) OVER (ORDER BY DCODE) = DCODE THEN '' ELSE DCODE END AS DEPT_CODE_FIRST
FROM EMP
ORDER BY DCODE;

-- 5b) Skip line after each department
.mode column
SELECT EMP.*
FROM EMP
ORDER BY DCODE;

-- 5c) Order by GRADE within each department
SELECT EMP.*, CASE WHEN LAG(GRADE) OVER (PARTITION BY DCODE ORDER BY GRADE) = GRADE THEN '' ELSE GRADE END AS GRADE_FIRST
FROM EMP
ORDER BY DCODE, GRADE;

-- 5d) Calculate average and total BASIC by department and overall
SELECT EMP.*, AVG(BASIC) OVER (PARTITION BY DCODE, GRADE) AS AVG_BASIC_GRADE,
  AVG(BASIC) OVER (PARTITION BY DCODE) AS AVG_BASIC_DEPT,
  SUM(BASIC) OVER (PARTITION BY DCODE) AS TOTAL_BASIC_DEPT,
  AVG(BASIC) OVER () AS AVG_BASIC_OVERALL,
  SUM(BASIC) OVER () AS TOTAL_BASIC_OVERALL
FROM EMP
ORDER BY DCODE, GRADE;
