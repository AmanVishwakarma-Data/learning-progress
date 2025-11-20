-- ============================================================
-- 📘 DAY 6: SQL GROUP BY & HAVING PRACTICE
-- ============================================================


-- ============================
-- 📌 GROUP BY QUERIES
-- ============================

-- 1) Brand wise total phones
SELECT brand_name, COUNT(*) 
FROM mobile_phones
GROUP BY brand_name;

-- 2) Top 5 brands by phone count
SELECT brand_name, COUNT(*) AS Total_Phone 
FROM mobile_phones
GROUP BY brand_name
ORDER BY Total_Phone DESC
LIMIT 5;

-- 3) Top 5 brands with average price
SELECT brand_name, COUNT(*) AS Total_Phone, ROUND(AVG(price)) AS Avg_Price 
FROM mobile_phones
GROUP BY brand_name
ORDER BY Total_Phone DESC 
LIMIT 5;

-- 4) Rating + price analysis
SELECT brand_name, COUNT(*) AS Total_Phone, MAX(rating) AS Rating, ROUND(AVG(price)) AS Avg_Price 
FROM mobile_phones
GROUP BY brand_name
ORDER BY Total_Phone DESC 
LIMIT 5;

-- 5) Battery capacity average + max rating
SELECT brand_name, COUNT(*) AS Total_Phone, MAX(rating) AS Max_Rating,
       ROUND(AVG(battery_capacity)) AS Avg_battery_capacity
FROM mobile_phones
GROUP BY brand_name
ORDER BY Total_Phone DESC 
LIMIT 5;

-- 6) Battery avg + max rating + min screen size
SELECT brand_name, COUNT(*) AS Total_Phone, MAX(rating) AS Max_Rating,
       ROUND(AVG(battery_capacity)) AS Avg_battery_capacity,
       MIN(screen_size) AS Min_screen_size
FROM mobile_phones
GROUP BY brand_name
ORDER BY Total_Phone DESC 
LIMIT 5;

-- 7) 5G wise stats
SELECT has_5g, COUNT(*) AS Total, ROUND(AVG(price)) AS Avg_Price, ROUND(AVG(rating)) AS Avg_Rating 
FROM mobile_phones
GROUP BY has_5g;

-- 8) 5G + IR Blaster group analysis
SELECT has_5g, has_ir_blaster, ROUND(AVG(price)) AS Avg_Price, ROUND(AVG(rating)) AS Avg_Rating 
FROM mobile_phones
GROUP BY has_5g, has_ir_blaster
ORDER BY Avg_Price;

-- 9) HAVING example (not recommended):
SELECT has_5g, has_ir_blaster, ROUND(AVG(price)) AS Avg_Price, ROUND(AVG(rating)) AS Avg_Rating 
FROM mobile_phones
GROUP BY has_5g, has_ir_blaster
HAVING has_5g = 'True'  -- use WHERE in real world
ORDER BY Avg_Price;

-- 10) Brand + processor-wise stats
SELECT brand_name, processor_brand, COUNT(*) AS Total_Phone,
       ROUND(AVG(battery_capacity)) AS Avg_battery_capacity
FROM mobile_phones
GROUP BY brand_name, processor_brand
ORDER BY Total_Phone DESC 
LIMIT 10;

-- 11) Brand wise average price (Top 5)
SELECT brand_name, ROUND(AVG(price)) AS Avg_price 
FROM mobile_phones
GROUP BY brand_name
ORDER BY Avg_price DESC 
LIMIT 5;

-- 12) Brand wise average screen size
SELECT brand_name, ROUND(AVG(screen_size)) AS Avg_screen_size 
FROM mobile_phones
GROUP BY brand_name;

-- 13) Min screen size (Top 5)
SELECT brand_name, MIN(screen_size) AS Min_screen_size 
FROM mobile_phones
GROUP BY brand_name
ORDER BY Min_screen_size 
LIMIT 5;

-- 14) IR Blaster + NFC phones by brand
SELECT brand_name, COUNT(*) AS Count 
FROM mobile_phones
WHERE has_ir_blaster = 'TRUE' AND has_nfc = 'True'
GROUP BY brand_name
ORDER BY Count DESC 
LIMIT 1;

-- 15) Group by brand + price
SELECT brand_name, price, COUNT(*) AS Count 
FROM mobile_phones
GROUP BY brand_name, price
ORDER BY Count DESC
LIMIT 2,1;


-- ============================
-- 📌 HAVING QUERIES
-- ============================

-- 1) Brands having more than 20 phones
SELECT brand_name, COUNT(*) AS Count 
FROM mobile_phones
GROUP BY brand_name
HAVING Count > 20;

-- 2) Top brands with high count + avg rating
SELECT brand_name, COUNT(*) AS Count, ROUND(AVG(rating)) AS Avg_rating 
FROM mobile_phones
GROUP BY brand_name
HAVING Count > 20
ORDER BY Count DESC 
LIMIT 5;

-- 3) 5G phones with rating > 50 AND count >10
SELECT brand_name, ROUND(AVG(price)) AS Avg_Price, COUNT(*) AS Count 
FROM mobile_phones
WHERE has_5g = 'True'
GROUP BY brand_name
HAVING AVG(rating) > 50 AND COUNT(*) > 10;

-- 4) High refresh rate + fast charging phones
SELECT brand_name, ROUND(AVG(ram_capacity)) AS Avg_ram_capacity, COUNT(*) AS Count 
FROM mobile_phones
WHERE refresh_rate > 60 AND fast_charging_available = 1
GROUP BY brand_name
HAVING COUNT(*) > 10
ORDER BY Avg_ram_capacity DESC 
LIMIT 5;

-- 5) 90Hz + fast charging phones
SELECT brand_name, ROUND(AVG(ram_capacity)) AS Avg_ram_capacity 
FROM mobile_phones
WHERE refresh_rate > 90 AND fast_charging_available = 1
GROUP BY brand_name
HAVING COUNT(*) >= 6
ORDER BY Avg_ram_capacity DESC;

-- 6) 120Hz + 8GB RAM phones price analysis
SELECT brand_name, MIN(price) AS Min_Price 
FROM mobile_phones
WHERE refresh_rate >= 120 AND ram_capacity >= 8 
GROUP BY brand_name
HAVING COUNT(*) >= 4 
ORDER BY Min_Price ASC;

-- 7) 5G + 90Hz phones battery analysis
SELECT brand_name, ROUND(AVG(battery_capacity)) AS Avg_battery_capacity 
FROM mobile_phones
WHERE has_5g = 'True' AND refresh_rate >= 90
GROUP BY brand_name
HAVING COUNT(*) >= 5
ORDER BY Avg_battery_capacity DESC;

-- 8) NFC + strong battery phones
SELECT brand_name, MAX(primary_camera_rear) AS Max_primary_camera_rear 
FROM mobile_phones
WHERE has_nfc = 'True' AND battery_capacity >= 4500
GROUP BY brand_name
HAVING COUNT(*) >= 4
ORDER BY Max_primary_camera_rear DESC;

-- 9) Small screen + budget phones avg rating
SELECT brand_name, ROUND(AVG(rating)) AS Avg_Rating 
FROM mobile_phones
WHERE screen_size <= 6.2 AND price <= 20000
GROUP BY brand_name
HAVING COUNT(*) >= 3
ORDER BY Avg_Rating DESC;

-- 10) Small screen + budget phones internal memory
SELECT brand_name, ROUND(AVG(internal_memory)) AS Avg_internal_memory 
FROM mobile_phones
WHERE screen_size <= 6.2 AND price <= 20000
GROUP BY brand_name
HAVING COUNT(*) >= 3
ORDER BY Avg_internal_memory DESC;



-- ============================================================
-- 🎯 PRACTICE SUMMARY
-- ============================================================

/*
MASTERED TODAY:
✔ GROUP BY (single, multiple columns)
✔ HAVING (aggregate filtering)
✔ Real-life dataset queries
✔ Multi-level grouping (brand + processor + features)
✔ Top-N analysis using ORDER BY + LIMIT

📌 STATUS: SQL GROUP BY + HAVING MODULE COMPLETED
*/
