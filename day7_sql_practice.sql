-- ============================================================
-- 📘 DAY 7: SQL JOIN & SUBQUERY PRACTICE
-- ============================================================


-- ============================================================
-- 🟦 JOIN PRACTICE
-- ============================================================


-- ============================
-- 🔹 INNER JOIN / JOIN
-- ============================
SELECT * FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT c.customer_id, c.name, o.amount 
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT c.customer_id, c.name, o.amount 
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;


-- ============================
-- 🔹 LEFT JOIN
-- ============================
SELECT c.customer_id, c.name, o.amount 
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;


-- ============================
-- 🔹 RIGHT JOIN
-- ============================
SELECT c.customer_id, c.name, o.amount 
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;


-- ============================
-- 🔹 FULL OUTER JOIN (MySQL via UNION)
-- ============================
SELECT * 
FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
UNION
SELECT * 
FROM customers c
RIGHT JOIN orders o 
ON c.customer_id = o.customer_id;

SELECT c.customer_id, c.name, o.amount 
FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, c.name, o.amount 
FROM customers c
RIGHT JOIN orders o 
ON c.customer_id = o.customer_id;


-- ============================
-- 🔹 CROSS JOIN (Cartesian Product)
-- ============================
SELECT * 
FROM customers c
CROSS JOIN orders o;

SELECT c.customer_id, c.name, o.amount 
FROM customers c
CROSS JOIN orders o;


-- ============================
-- 🔹 SELF JOIN
-- ============================
SELECT a.customer_id, a.amount, b.customer_id 
FROM orders a, orders b 
WHERE a.amount != b.amount
ORDER BY a.customer_id;

SELECT a.customer_id, a.amount, b.amount
FROM orders a
JOIN orders b
ON a.amount != b.amount
ORDER BY a.customer_id;


-- ============================
-- 🔹 JOIN with Multiple Conditions
-- ============================
SELECT * 
FROM student_table s
LEFT JOIN class_table c 
ON s.student_id = c.class_id
AND s.enrollment_year = c.class_year;

SELECT s.student_id, CONCAT(s.first_name,' ',s.last_name) AS Full_name, 
       s.class_id, c.class_name, c.teacher 
FROM student_table s
LEFT JOIN class_table c 
ON s.student_id = c.class_id
AND s.enrollment_year = c.class_year;

SELECT * 
FROM student_table s
RIGHT JOIN class_table c 
ON s.student_id = c.class_id
AND s.enrollment_year = c.class_year;

SELECT s.student_id, CONCAT(s.first_name,' ',s.last_name) AS Full_name, 
       s.class_id, c.class_name, c.teacher 
FROM student_table s
RIGHT JOIN class_table c 
ON s.student_id = c.class_id
AND s.enrollment_year = c.class_year;

SELECT s.student_id, CONCAT(s.first_name,' ',s.last_name) AS Full_name, 
       s.class_id, c.class_name, c.teacher 
FROM student_table s
JOIN class_table c 
ON s.student_id = c.class_id
AND s.enrollment_year = c.class_year;


-- ============================
-- 🔹 LEFT JOIN Filter Mistake Example
-- ============================

-- ❌ WRONG: WHERE filters RIGHT table → LEFT JOIN becomes INNER JOIN
SELECT c.customer_id, c.name, o.amount 
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE amount > 300;

-- ✔ CORRECT: Filter should be in ON
SELECT c.customer_id, c.name, o.amount 
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id AND amount > 300;



-- ============================================================
-- 🟦 SUBQUERY PRACTICE
-- ============================================================


-- ============================
-- 🔹 Subquery in WHERE (Most Common)
-- ============================
SELECT MIN(score) FROM movies;  -- → Example: 2.2

SELECT * FROM movies
WHERE score = 2.2;

SELECT * FROM movies
WHERE score = (SELECT MIN(score) FROM movies);

SELECT * FROM movies 
ORDER BY (gross - budget) DESC 
LIMIT 1;

SELECT * FROM movies
WHERE (gross - budget) = (
      SELECT MAX(gross - budget) FROM movies
);

SELECT COUNT(*) 
FROM movies
WHERE budget > (SELECT AVG(budget) FROM movies);

SELECT * FROM movies
WHERE year = 2000 
AND score = (
    SELECT MAX(score) FROM movies WHERE year = 2000
);

SELECT * FROM e_details
WHERE id IN (
    SELECT id FROM e_details WHERE SALARY > 3000
);


-- ============================
-- 🔹 Subquery in SELECT (Scalar Subquery)
-- ============================
SELECT name,
       (votes / (SELECT SUM(votes) FROM movies) * 100) AS per_of_votes
FROM movies;

SELECT name, genre, score,
       (SELECT AVG(score) 
        FROM movies m2 
        WHERE m2.genre = m1.genre) AS Avg_Score
FROM movies m1;


-- ============================
-- 🔹 Derived Table (Subquery in FROM)
-- ============================
SELECT genre, avg_rating
FROM (
    SELECT rating, AVG(score) AS avg_rating 
    FROM movies 
    GROUP BY rating
) t1 
JOIN movies t2;

SELECT genre, AVG(score) AS Avg_Score 
FROM movies
GROUP BY genre
HAVING AVG(score) > (SELECT AVG(score) FROM movies);


-- ============================
-- 🔹 Subqueries in INSERT / UPDATE / DELETE
-- ============================

-- INSERT using Subquery
INSERT INTO details_backup 
SELECT * 
FROM e_details 
WHERE id IN (SELECT id FROM e_details);

-- UPDATE using Subquery
UPDATE details_backup 
SET SALARY = SALARY * 10 
WHERE age IN (SELECT AGE FROM e_details WHERE AGE > 20);

-- DELETE using Subquery
DELETE FROM e_details 
WHERE AGE IN (
    SELECT AGE FROM details_backup WHERE AGE >= 25
);



-- ============================================================
-- 🎯 PRACTICE SUMMARY (DAY 7)
-- ============================================================

/*
MASTERED TODAY:
✔ INNER, LEFT, RIGHT, FULL (UNION), CROSS, SELF JOIN
✔ JOIN with multi-condition ON clause
✔ LEFT JOIN filtering correctly
✔ WHERE / SELECT / FROM Subqueries
✔ Scalar Subqueries
✔ Derived Tables
✔ UPDATE / DELETE / INSERT with Subqueries

📌 STATUS: SQL JOIN + SUBQUERY MODULE COMPLETED
*/

