-- 🗂️ DAY 3: SQL DDL COMMANDS & CONSTRAINTS PRACTICE

-- =============================================
-- 🏗️ DDL COMMANDS PRACTICE
-- =============================================

-- ✅ 1. CREATE COMMAND
-- Database and table creation with constraints

CREATE DATABASE student;
USE student;

CREATE TABLE details (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50) NOT NULL,
    created DATE DEFAULT (CURRENT_DATE)
);

-- ✅ 2. ALTER COMMAND
-- Table structure modifications

-- Add new column
ALTER TABLE details ADD gender VARCHAR(15);
SELECT * FROM details;

-- Drop column
ALTER TABLE details DROP COLUMN gender;
SELECT * FROM details;

-- Modify column data type
ALTER TABLE details MODIFY student_name VARCHAR(20);

-- Change column name and properties
ALTER TABLE details CHANGE COLUMN created created_date DATE DEFAULT (CURRENT_DATE);
SELECT * FROM details;

-- Add column with constraint
ALTER TABLE details ADD age INT;
ALTER TABLE details ADD CONSTRAINT chh_age CHECK (age > 0);
SELECT * FROM details;

-- Drop constraint and column
ALTER TABLE details DROP CONSTRAINT chh_age;
ALTER TABLE details DROP COLUMN age;

-- ✅ 3. DROP COMMAND
-- Database and table deletion

CREATE DATABASE aman;
USE aman;

CREATE TABLE aman_info(
    id INT PRIMARY KEY AUTO_INCREMENT,
    phone_number VARCHAR(15) NOT NULL UNIQUE
);

-- Drop table and database
DROP TABLE aman_info;
DROP DATABASE aman;

-- ✅ 4. TRUNCATE COMMAND
-- Delete all data but keep structure

CREATE DATABASE aman;
USE aman;

CREATE TABLE aman_info(
    id INT PRIMARY KEY AUTO_INCREMENT,
    phone_number VARCHAR(15) NOT NULL UNIQUE
);

-- Insert sample data
INSERT INTO aman_info(phone_number) 
VALUES 
(9919990901),
(9914569090),
(910999090);

SELECT * FROM aman_info;

-- Truncate table (all data deleted)
TRUNCATE TABLE aman_info;
SELECT * FROM aman_info;

-- ✅ 5. RENAME COMMAND
-- Table renaming

RENAME TABLE aman_info TO av_info;
SHOW TABLES;

-- =============================================
-- 🔗 CONSTRAINTS PRACTICE
-- =============================================

-- ✅ PRIMARY KEY Constraints

USE gym_managment;

-- Single column primary key
CREATE TABLE details_type01(
    person_id INT PRIMARY KEY,
    person_name VARCHAR(50) 
);

-- Composite primary key
CREATE TABLE details_type02(
    person_id INT,
    person_name VARCHAR(50),
    person_phone VARCHAR(15),
    PRIMARY KEY (person_id, person_phone)
);

-- ✅ FOREIGN KEY + NOT NULL Constraints

CREATE TABLE tools(
    tool_id INT PRIMARY KEY,
    tool_name VARCHAR(50) NOT NULL
);

CREATE TABLE tool_users(
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    tool_id INT,
    FOREIGN KEY (tool_id) REFERENCES tools(tool_id)
);

-- ✅ UNIQUE + NOT NULL Constraints

-- Add unique constraint to existing table
ALTER TABLE details_type02 MODIFY person_phone VARCHAR(15) UNIQUE;

-- Table with unique and not null constraints
CREATE TABLE details_01types(
    person_id INT,
    person_first_name VARCHAR(50) NOT NULL,
    person_last_name VARCHAR(50) NOT NULL,
    person_phone VARCHAR(15) UNIQUE,
    PRIMARY KEY (person_id, person_phone)
);

-- Alternative unique constraint syntax
CREATE TABLE details_02types(
    person_id INT PRIMARY KEY,
    person_first_name VARCHAR(50) NOT NULL,
    person_last_name VARCHAR(50) NOT NULL,
    person_phone VARCHAR(15) UNIQUE,
    UNIQUE (person_id, person_phone)
);

-- ✅ CHECK Constraints

-- Basic check constraint
CREATE TABLE details01(
    person_id INT PRIMARY KEY,
    person_name VARCHAR(50),
    person_phone VARCHAR(15),
    person_age INT CHECK (person_age > 18)
);

-- Check constraint with custom name
CREATE TABLE details02(
    person_id INT PRIMARY KEY,
    person_name VARCHAR(50),
    person_phone VARCHAR(15),
    person_age INT CHECK (person_age > 18),
    person_income INT CONSTRAINT income_check CHECK (person_income > 10000)
);

-- Drop check constraint
ALTER TABLE details02 DROP CONSTRAINT income_check;
DESC details02;

-- ✅ DEFAULT Constraints

-- Default timestamp
CREATE TABLE details_01(
    person_id INT PRIMARY KEY,
    person_name VARCHAR(50),
    join_date TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

-- Default enum value
CREATE TABLE details_02(
    person_id INT PRIMARY KEY,
    person_name VARCHAR(50),
    daily_login ENUM('SUCCESS', 'PENDING') DEFAULT 'PENDING'
);

-- =============================================
-- 🔍 SYSTEM COMMANDS PRACTICE
-- =============================================

-- Show all databases
SHOW DATABASES;

-- Show current database
SELECT DATABASE();

-- Show tables in current database
SHOW TABLES;

-- Describe table structure
DESCRIBE details_01;

-- Show complete table creation script
SHOW CREATE TABLE details_01;

-- Show all columns information
SHOW COLUMNS FROM details_01;

-- =============================================
-- 🎯 PRACTICE SUMMARY
-- =============================================

/* 
MASTERED CONCEPTS:
✅ All 5 DDL Commands (CREATE, ALTER, DROP, TRUNCATE, RENAME)
✅ All 7 SQL Constraints (Primary Key, Foreign Key, Unique, Not Null, Check, Default, Index)
✅ Data Integrity Types (Entity, Referential, Domain, Business)
✅ System Metadata Commands
✅ Practical Implementation with Real Examples
*/
