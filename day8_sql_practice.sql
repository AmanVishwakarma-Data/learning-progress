-- ============================================================
-- 📘 DAY 8: WINDOW FUNCTIONS + TCL + DCL PRACTICE
-- ============================================================


-- ============================================================
-- 🟦 WINDOW FUNCTIONS
-- ============================================================

-- Basic Aggregation vs Window Aggregation
SELECT AVG(marks) AS Avg_marks FROM st_marks;
SELECT AVG(marks) OVER() AS Avg_marks FROM st_marks;
SELECT *, AVG(marks) OVER() AS Avg_marks FROM st_marks;

-- PARTITION BY
SELECT *, AVG(marks) OVER(PARTITION BY class) AS Avg_Marks 
FROM st_marks;

SELECT *,  
       MAX(marks) OVER(PARTITION BY class) AS Max_Mark,
       MIN(marks) OVER(PARTITION BY class) AS Min_Marks
FROM st_marks;

-- RANKING FUNCTIONS
SELECT *, RANK() OVER(ORDER BY marks DESC) AS Overall_Marks 
FROM st_marks;

SELECT *, RANK() OVER(PARTITION BY class ORDER BY marks DESC) AS Rnk 
FROM st_marks;

SELECT name, class, DENSE_RANK() OVER(ORDER BY marks DESC) AS RNK 
FROM st_marks;

SELECT *, 
       RANK() OVER(ORDER BY marks DESC) AS Rnk,
       DENSE_RANK() OVER(ORDER BY marks DESC) AS D_Rnk
FROM st_marks;

SELECT *, 
       RANK() OVER(PARTITION BY class ORDER BY marks DESC) AS Rnk,
       DENSE_RANK() OVER(PARTITION BY class ORDER BY marks DESC) AS RNK
FROM st_marks;

-- ROW_NUMBER
SELECT *, ROW_NUMBER() OVER() AS R_num FROM st_marks;
SELECT *, ROW_NUMBER() OVER(ORDER BY marks DESC) AS R_num FROM st_marks;
SELECT *, ROW_NUMBER() OVER(PARTITION BY class ORDER BY marks) AS R_num 
FROM st_marks;

-- Using ROW_NUMBER in string formatting
SELECT *, CONCAT('ID- ',student_id,' Class - ',class,' - ',
ROW_NUMBER() OVER()) AS Details 
FROM st_marks;

SELECT *, CONCAT('ID- ',student_id,' Class - ',class,' - ',
ROW_NUMBER() OVER(PARTITION BY class)) AS Details 
FROM st_marks;

-- FIRST_VALUE / LAST_VALUE
SELECT *, FIRST_VALUE(name) OVER (ORDER BY marks) AS FirstValue 
FROM st_marks;

SELECT *, FIRST_VALUE(name) OVER(ORDER BY marks DESC) AS Topper 
FROM st_marks;

SELECT *, FIRST_VALUE(name) OVER(PARTITION BY class ORDER BY marks DESC) 
AS Topper_By_Class
FROM st_marks;

SELECT *, LAST_VALUE(name) OVER (PARTITION BY class) AS LastValue 
FROM st_marks;

-- NTH_VALUE
SELECT *, NTH_VALUE(marks,2) OVER() AS Second_Mark 
FROM st_marks;

SELECT *, NTH_VALUE(marks,2) OVER(
         ORDER BY marks 
         ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS Second_Value 
FROM st_marks;

SELECT *, NTH_VALUE(marks,3) OVER(PARTITION BY class) AS ThirdValue 
FROM st_marks;

SELECT *, NTH_VALUE(marks,3) OVER(
        PARTITION BY class 
        ORDER BY marks 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS Third_By_Class 
FROM st_marks;

SELECT *, NTH_VALUE(marks,3) OVER(PARTITION BY class ORDER BY marks DESC) 
AS ThirdDesc 
FROM st_marks;

SELECT *, NTH_VALUE(marks,3) OVER(
        PARTITION BY class ORDER BY marks DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS Third_Highest_In_Class 
FROM st_marks;

SELECT *, NTH_VALUE(marks,2) OVER(ORDER BY marks DESC) AS Second_Highest 
FROM st_marks;

SELECT *, NTH_VALUE(marks,2) OVER(
        ORDER BY marks DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS Second_Highest_Full 
FROM st_marks;

-- LAG
SELECT *, LAG(marks) OVER(ORDER BY student_id) AS Prev_Mark 
FROM st_marks;

SELECT *, LAG(marks,3) OVER(ORDER BY student_id) AS Prev_3 
FROM st_marks;

SELECT *, LAG(marks,2) OVER(PARTITION BY student_id) AS Lag_Part 
FROM st_marks;

SELECT *, LAG(marks) OVER(PARTITION BY class ORDER BY student_id) AS Lag_Class 
FROM st_marks;

SELECT *, LAG(marks,3) OVER(PARTITION BY class ORDER BY student_id) AS Lag3_Class 
FROM st_marks;

-- LEAD
SELECT *, LEAD(marks) OVER(ORDER BY student_id) AS Next_Mark 
FROM st_marks;

SELECT *, LEAD(marks,3) OVER(ORDER BY student_id) AS Next3 
FROM st_marks;

SELECT *, LEAD(marks) OVER(PARTITION BY class ORDER BY student_id) AS Lead_Class 
FROM st_marks;

SELECT *, LEAD(marks,3) OVER(PARTITION BY class ORDER BY student_id) AS Lead3_Class 
FROM st_marks;



-- ============================================================
-- 🟦 TCL → TRANSACTION CONTROL
-- ============================================================

CREATE DATABASE dcl_tcl;
USE dcl_tcl;

-- Student table for TCL demo
CREATE TABLE student_details(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(27) NOT NULL,
    student_mobile VARCHAR(15) NOT NULL UNIQUE,
    student_email VARCHAR(27) NOT NULL UNIQUE
);

-- Insert Data
INSERT INTO student_details(student_name,student_mobile,student_email) VALUES
('Krishna', '9922663545', 'kri@gmail.com'),
('Raman', '991919191', 'ra@gmail.com'),
('Aman', '9876543210', 'aman@example.com'),
('Riya', '9123456780', 'riya@gmail.com');

COMMIT;  -- Save permanently

SET AUTOCOMMIT = 0;

-- Players Table
CREATE TABLE players(
 ID INT PRIMARY KEY,
 First_Name VARCHAR(255),
 Last_Name VARCHAR(255),
 Date_Of_Birth DATE,
 Place_Of_Birth VARCHAR(255),
 Country VARCHAR(255)
);

INSERT INTO players VALUES
(1, 'Shikhar', 'Dhawan', DATE('1981-12-05'), 'Delhi', 'India'),
(2, 'Jonathan', 'Trott', DATE('1981-04-22'), 'CapeTown', 'SouthAfrica'),
(3, 'Kumara', 'Sangakkara', DATE('1977-10-27'), 'Matale', 'Srilanka'),
(4, 'Virat', 'Kohli', DATE('1988-11-05'), 'Delhi', 'India'),
(5, 'Rohit', 'Sharma', DATE('1987-04-30'), 'Nagpur', 'India'),
(6, 'Ravindra', 'Jadeja', DATE('1988-12-06'), 'Nagpur', 'India'),
(7, 'James', 'Anderson', DATE('1982-06-30'), 'Burnley', 'England');

COMMIT;

-- Delete & Rollback Demo
DELETE FROM players WHERE id IN (4,5,6,7);
ROLLBACK;

-- Insert & Commit Demo
SET AUTOCOMMIT = 0;

INSERT INTO Players VALUES
(1, 'Shikhar', 'Dhawan', DATE('1981-12-05'), 'Delhi', 'India'),
(2, 'Jonathan', 'Trott', DATE('1981-04-22'), 'CapeTown', 'SouthAfrica'),
(3, 'Kumara', 'Sangakkara', DATE('1977-10-27'), 'Matale','Srilanka');

COMMIT;

INSERT INTO Players VALUES
(4, 'Virat', 'Kohli', DATE('1988-11-05'), 'Delhi', 'India'),
(5, 'Rohit', 'Sharma', DATE('1987-04-30'), 'Nagpur', 'India'),
(6, 'Ravindra', 'Jadeja', DATE('1988-12-06'), 'Nagpur', 'India'),
(7, 'James', 'Anderson', DATE('1982-06-30'), 'Burnley', 'England');

ROLLBACK;

-- SAVEPOINT Demo
SET AUTOCOMMIT = 0;

CREATE TABLE EMP(
 FIRST_NAME CHAR(20) NOT NULL,
 LAST_NAME CHAR(20),
 AGE INT,
 SEX CHAR(1),
 INCOME FLOAT
);

INSERT INTO EMP VALUES
('Krishna', 'Sharma', 19, 'M', 2000),
('Raj', 'Kandukuri', 20, 'M', 7000),
('Ramya', 'Ramapriya', 25, 'F', 5000),
('Hari', 'Sharma', 24, 'M', 2000);

SAVEPOINT A;

INSERT INTO EMP VALUES('Mac', 'Mohan', 26, 'M', 2000);

ROLLBACK TO SAVEPOINT A;


-- ============================================================
-- 🟦 DCL → PERMISSION CONTROL
-- ============================================================

CREATE USER 'test_user'@'localhost' IDENTIFIED BY 'testpassword';

CREATE DATABASE test_database;
USE test_database;

CREATE TABLE MyTable (
    data VARCHAR(255)
);

-- Grant SELECT privilege
GRANT SELECT
ON test_database.mytable 
TO 'test_user'@'localhost';

SHOW GRANTS FOR 'test_user'@'localhost';

-- Grant all permissions
GRANT ALL
ON test_database.mytable
TO 'test_user'@'localhost';

SHOW GRANTS FOR 'test_user'@'localhost';

-- Revoke permission
REVOKE SELECT ON test_database.mytable 
FROM 'test_user'@'localhost';

SHOW GRANTS FOR 'test_user'@'localhost';



-- ============================================================
-- 🎯 END OF SCRIPT — DAY 8 COMPLETED
-- ============================================================
/*
MASTERED TODAY:
✔ Window Functions (OVER, PARTITION, ORDER, FRAME)
✔ Ranking Functions (ROW_NUMBER, RANK, DENSE_RANK)
✔ Analytic Functions (LAG, LEAD, FIRST_VALUE, LAST_VALUE)
✔ NTH_VALUE with Frame Clause
✔ TCL (COMMIT, ROLLBACK, SAVEPOINT)
✔ DCL (GRANT, REVOKE)

📌 STATUS: DAY 8 SQL CLASS COMPLETED
*/
