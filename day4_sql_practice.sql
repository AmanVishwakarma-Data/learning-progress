-- 🗂️ DAY 4: SQL DML & DQL PRACTICE (INSERT, SELECT, WHERE, UPDATE, DELETE)

-- =====================================================================
-- 📌 DML – Data Manipulation Language (INSERT, UPDATE, DELETE)
-- =====================================================================

USE student;
SELECT * FROM details;

CREATE TABLE details(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50) NOT NULL UNIQUE,
    student_phone INT NOT NULL UNIQUE
);

-- Modify phone number datatype for better storage
ALTER TABLE details MODIFY student_phone VARCHAR(15) NOT NULL UNIQUE;


-- ========================
-- 📥 INSERT PRACTICE
-- ========================

INSERT INTO details VALUES (1,'Krishna',9922663545);

INSERT INTO details (student_name, student_phone) 
VALUES ('Aman',991919191);

INSERT INTO details (student_name, student_phone)
VALUES 
    ('Ram',8900876765),
    ('Arun',9900876765),
    ('Deva',9800876765);

SELECT * FROM details;


-- =====================================================================
-- 📌 DQL – Data Query Language (SELECT)
-- =====================================================================

CREATE DATABASE aman;
USE aman;

SELECT * FROM aman.mobile_phones;
SELECT * FROM mobile_phones;
SELECT * FROM mobile_phones WHERE 1;

SELECT model, brand_name, rating 
FROM mobile_phones;

SELECT model, brand_name, price, rating 
FROM mobile_phones;

SELECT model, price, os AS 'Operating System'
FROM mobile_phones;

SELECT model, price - 100 AS new_price, os AS 'Operating System'
FROM mobile_phones;

SELECT model, os AS 'Operating System', price  
FROM mobile_phones
WHERE os = 'ios';

SELECT model, screen_size, refresh_rate,
ROUND(
    SQRT(resolution_width * resolution_width + resolution_height * resolution_height) / screen_size,
2) AS PPI
FROM mobile_phones;

SELECT model, price, 'Smart Phone' AS phone_type 
FROM mobile_phones;


-- ========================
-- 🔁 DISTINCT PRACTICE
-- ========================

SELECT DISTINCT brand_name FROM mobile_phones;
SELECT DISTINCT brand_name AS unique_brand_name FROM mobile_phones;
SELECT DISTINCT brand_name AS 'Unique Brand' FROM mobile_phones;

SELECT DISTINCT refresh_rate AS all_type_refresh_rate 
FROM mobile_phones;

SELECT DISTINCT processor_brand, refresh_rate 
FROM mobile_phones;

SELECT DISTINCT brand_name, processor_brand, refresh_rate 
FROM mobile_phones;


-- =====================================================================
-- 🎯 WHERE CLAUSE PRACTICE (CONDITIONS)
-- =====================================================================

SELECT * FROM mobile_phones
WHERE brand_name = 'Apple';

SELECT model, brand_name, price 
FROM mobile_phones
WHERE brand_name = 'vivo';

SELECT * FROM mobile_phones
WHERE price > 25000;

SELECT * FROM mobile_phones
WHERE brand_name <> 'Apple';

SELECT * FROM mobile_phones
WHERE has_ir_blaster = 'True' AND brand_name = 'poco';

SELECT * FROM mobile_phones
WHERE price BETWEEN 12000 AND 25000;

SELECT * FROM mobile_phones
WHERE price < 25000 AND rating > 70;

SELECT * FROM mobile_phones
WHERE price < 15000 AND rating > 70 AND brand_name = 'samsung';

SELECT * FROM mobile_phones
WHERE battery_capacity > 4000 AND ram_capacity > 8 AND brand_name = 'samsung';

SELECT * FROM mobile_phones
WHERE brand_name IN ('samsung','realme','oneplus');

SELECT * FROM mobile_phones
WHERE brand_name NOT IN ('apple','ikall','nothing','asus');

SELECT * FROM mobile_phones
WHERE brand_name LIKE 'D%';

SELECT * FROM mobile_phones
WHERE brand_name LIKE '%a';

SELECT * FROM mobile_phones
WHERE brand_name LIKE '%am%';

SELECT * FROM mobile_phones
WHERE brand_name LIKE '__';

SELECT * FROM mobile_phones
WHERE rating IS NOT NULL;

SELECT * FROM mobile_phones
WHERE price IS NULL;


-- =====================================================================
-- 🛠️ UPDATE PRACTICE
-- =====================================================================

SELECT * FROM mobile_phones
WHERE brand_name = 'sony';

UPDATE mobile_phones
SET brand_name = 'samsung'
WHERE brand_name = 'sony';

UPDATE mobile_phones 
SET price = 15000
WHERE price BETWEEN 10000 AND 20000;

UPDATE mobile_phones 
SET price = 60000, rating = 9
WHERE price BETWEEN 50000 AND 70000 AND rating > 7;

SELECT * FROM mobile_phones WHERE brand_name = 'Apple';

UPDATE mobile_phones
SET internal_memory = 128
WHERE brand_name = 'Apple' AND price BETWEEN 90000 AND 100000;

UPDATE mobile_phones
SET price = price + 1000
ORDER BY rating DESC
LIMIT 7;


-- =====================================================================
-- ❌ DELETE PRACTICE
-- =====================================================================

USE school;

SELECT * FROM student_details
WHERE name = 'Aditya';

DELETE FROM student_details
WHERE name = 'Aditya';

DELETE FROM student_details
WHERE city = 'jaipur';

SELECT COUNT(*) FROM student_details;


-- Delete in aman database

USE aman;

SELECT * FROM mobile_phones WHERE price > 125000;
DELETE FROM mobile_phones WHERE price > 125000;

SELECT * FROM mobile_phones
WHERE brand_name = 'nokia' AND battery_capacity < 5000;

DELETE FROM mobile_phones
WHERE brand_name = 'nokia' AND battery_capacity < 5000;

SELECT * FROM mobile_phones
WHERE brand_name = 'nokia' AND price > 10000 AND battery_capacity > 5000;

DELETE FROM mobile_phones
WHERE brand_name = 'nokia' AND price > 10000 AND battery_capacity > 5000;


-- =====================================================================
-- 🎯 PRACTICE SUMMARY
-- =====================================================================

/*
MASTERED TODAY:
✅ SELECT (Basic + Advanced)
✅ DISTINCT, WHERE, LIKE, BETWEEN, IN, NOT IN
✅ UPDATE with multiple conditions + ORDER BY + LIMIT
❌ DELETE with safe filtering
📌 PERFECT SQL DML PRACTICE COMPLETED
*/
