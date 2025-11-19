-- ============================================================
-- 📘 SQL PRACTICE FILE – Aggregate, Scalar, ORDER BY, LIMIT
-- ============================================================

-- # Aggregate Function # --
USE aman;
SELECT * FROM mobile_phones;

-- MIN(), MAX() --
SELECT MAX(price) FROM mobile_phones;
SELECT MIN(price) FROM mobile_phones;
SELECT MIN(price), MAX(ram_capacity) FROM mobile_phones;

SELECT MAX(price) FROM mobile_phones 
WHERE brand_name = 'vivo';

SELECT * FROM mobile_phones
WHERE brand_name = 'vivo' AND price = 60000;

-- AVG() --
SELECT AVG(rating) FROM mobile_phones;

SELECT AVG(rating) FROM mobile_phones
WHERE brand_name = 'nokia';

SELECT AVG(price) FROM mobile_phones
WHERE brand_name = 'nokia';

SELECT AVG(price), AVG(rating) FROM mobile_phones
WHERE brand_name = 'nokia';

SELECT AVG(price) AS Avg_Price, AVG(rating) AS Avg_Rating FROM mobile_phones
WHERE brand_name = 'nokia';

-- SUM() --
SELECT SUM(price) FROM mobile_phones;

SELECT SUM(price) FROM mobile_phones
WHERE brand_name = 'one_plus';

SELECT SUM(price) AS Total_Vivo_Price FROM mobile_phones
WHERE brand_name = 'vivo';

-- COUNT() --
SELECT COUNT(*) FROM mobile_phones;

SELECT COUNT(*) FROM mobile_phones
WHERE brand_name = 'nokia';

SELECT COUNT(*) FROM mobile_phones
WHERE brand_name = 'apple' AND price > 7000;

SELECT COUNT(*) AS Total_Poco_Phones, SUM(price) AS Total_Price FROM mobile_phones
WHERE brand_name = 'poco';

SELECT COUNT(DISTINCT brand_name) AS Total_Brand FROM mobile_phones;

SELECT COUNT(DISTINCT brand_name) AS Total_Mobile_Brand,
       COUNT(DISTINCT processor_brand) AS Total_Processor_Brand
FROM mobile_phones;

-- STD() --
SELECT STD(screen_size) FROM mobile_phones;
SELECT STD(screen_size) FROM mobile_phones WHERE brand_name = 'vivo';
SELECT STD(screen_size) FROM mobile_phones WHERE brand_name = 'samsung';

-- VARIANCE --
SELECT VARIANCE(screen_size) FROM mobile_phones;
SELECT VARIANCE(screen_size) FROM mobile_phones WHERE brand_name = 'vivo';
SELECT VARIANCE(screen_size) FROM mobile_phones WHERE brand_name = 'samsung';


-- ============================================================
-- # Scalar Functions #
-- ============================================================

-- 1) String Functions --

-- UPPER() / LOWER() --
SELECT UPPER(os) FROM mobile_phones;
SELECT UCASE(brand_name) FROM mobile_phones;
SELECT LOWER(model) FROM mobile_phones;
SELECT LCASE(model) FROM mobile_phones;

-- LENGTH() --
SELECT LENGTH(brand_name) FROM mobile_phones;
SELECT brand_name, LENGTH(brand_name) FROM mobile_phones;
SELECT DISTINCT brand_name, LENGTH(brand_name) FROM mobile_phones;

-- CONCAT() --
SELECT CONCAT(battery_capacity,' with Fast Charging ',fast_charging,' watt') AS Battery_With_Speed 
FROM mobile_phones;

SELECT model, CONCAT(battery_capacity,' with Fast Charging ',fast_charging,' watt') AS Battery_With_Speed 
FROM mobile_phones;


-- 2) Numeric Functions --

-- ABS() --
SELECT ABS(-10);
SELECT ABS(-10), ABS(-29), ABS(-9.10);
SELECT ABS(price - 200000) AS Abs_Value FROM mobile_phones;

-- ROUND() --
SELECT ROUND(10.678);
SELECT ROUND(10.678, 2);

SELECT model, screen_size, refresh_rate,
ROUND(SQRT(resolution_width * resolution_width + resolution_height * resolution_height) / screen_size, 2) AS PPI
FROM mobile_phones;

-- CEIL() --
SELECT CEIL(0);
SELECT CEIL(3);
SELECT CEIL(3.0);
SELECT CEIL(3.1);
SELECT CEIL(3.5);
SELECT CEIL(3.9);
SELECT CEIL(-1.1);
SELECT CEIL(-1.9);
SELECT brand_name, CEIL(processor_speed) FROM mobile_phones;

-- FLOOR() --
SELECT FLOOR(0);
SELECT FLOOR(7);
SELECT FLOOR(7.0);
SELECT FLOOR(7.1);
SELECT FLOOR(7.5);
SELECT FLOOR(7.9);
SELECT FLOOR(-1.1);
SELECT FLOOR(-1.9);
SELECT model, FLOOR(processor_speed) FROM mobile_phones;

-- SQRT() --
SELECT SQRT(4) AS Sqrt_1, ROUND(SQRT(19)) AS Sqrt_2;

SELECT SQRT(processor_speed) FROM mobile_phones;

SELECT CONCAT('Square of ', processor_speed) AS Processor_Speed,
       SQRT(processor_speed) AS Sqrt_Processor_Speed
FROM mobile_phones;

-- POWER() --
SELECT POWER(2, 5) AS Two_Power_Five;


-- 3) DATE & TIME FUNCTIONS --
SELECT NOW();
SELECT CURRENT_DATE();
SELECT CURRENT_TIME();


-- 4) CONVERSION FUNCTIONS --
SELECT CONVERT('2025-01-01', DATE);


-- ============================================================
-- # ORDER BY (Sorting) #
-- ============================================================

SELECT brand_name, model FROM mobile_phones
ORDER BY brand_name DESC;

SELECT brand_name, model FROM mobile_phones
ORDER BY 2 DESC;

SELECT * FROM mobile_phones 
WHERE brand_name = 'realme'
ORDER BY screen_size DESC;

SELECT * FROM mobile_phones 
WHERE brand_name = 'realme'
ORDER BY screen_size DESC
LIMIT 5;

SELECT brand_name, model, (num_rear_cameras + num_front_cameras) AS Total_Camera 
FROM mobile_phones
ORDER BY Total_Camera DESC;

-- OR --
SELECT brand_name, model, (num_rear_cameras + num_front_cameras) AS Total_Camera 
FROM mobile_phones
ORDER BY 3 DESC;

SELECT brand_name, model, battery_capacity FROM mobile_phones
ORDER BY battery_capacity DESC
LIMIT 2, 1;

SELECT brand_name, model, battery_capacity FROM mobile_phones
WHERE brand_name = 'realme'
ORDER BY battery_capacity DESC 
LIMIT 2, 3;

SELECT model, battery_capacity FROM mobile_phones
WHERE brand_name = 'oppo'
ORDER BY battery_capacity ASC 
LIMIT 4, 1;

SELECT brand_name, model, rating FROM mobile_phones
WHERE brand_name = 'samsung'
ORDER BY 3;

SELECT UPPER(brand_name) AS Brand_Name, model, rating 
FROM mobile_phones
ORDER BY 1, 3 DESC;

SELECT brand_name, model, price, battery_capacity FROM mobile_phones
WHERE brand_name = 'realme'
ORDER BY model, price, battery_capacity DESC;

SELECT brand_name, model, price, battery_capacity FROM mobile_phones
WHERE brand_name = 'samsung'
ORDER BY model, price, processor_speed DESC 
LIMIT 5;

-- =====================================================================
-- 🎯 TODAY'S SQL SUMMARY
-- =====================================================================

/*
MASTERED:
✅ All Aggregate Functions (MIN → VARIANCE)
✅ All Scalar Functions (String, Number, Date)
✅ ORDER BY (ASC/DESC, Multi Sort, Index Sort)
✅ LIMIT (Top N + Offset Pagination)

📌 PERFECT SQL FUNCTION & SORTING PRACTICE COMPLETED
🔥 Strong foundation built for GROUP BY & HAVING
*/
