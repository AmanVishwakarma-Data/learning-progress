-- ============================================================
-- 📘 DAY 9: SQL CTE (COMMON TABLE EXPRESSION) PRACTICE
-- ============================================================


-- ============================
-- 📌 1) CTE: Mode-wise Max & Total Amount
-- ============================
WITH temp_table AS (
    SELECT mode, 
           MAX(amount) AS Max_Amount,
           SUM(amount) AS Total_Amount
    FROM accounts
    GROUP BY mode
)
SELECT a.*, t.Max_Amount, t.Total_Amount
FROM accounts a
JOIN temp_table t ON t.mode = a.mode;



-- ============================
-- 📌 2) CTE: Customer-wise Total Amount
-- ============================
WITH temp_table AS (
    SELECT customer_id, SUM(amount) AS Total_Amount 
    FROM accounts 
    GROUP BY customer_id
)
SELECT c.customer_name, c.city, t.Total_Amount
FROM customers c
JOIN temp_table t ON c.customer_id = t.customer_id;



-- ============================
-- 📌 3) CTE: Average Amount (mode-wise) + Filter
-- ============================
WITH temp_table AS (
    SELECT mode, ROUND(AVG(amount)) AS Avg_Amount
    FROM accounts 
    GROUP BY mode
)
SELECT a.account_id, a.customer_id, a.amount, a.mode, t.Avg_Amount
FROM accounts a
JOIN temp_table t ON a.mode = t.mode
WHERE a.amount > t.Avg_Amount;



-- ============================
-- 📌 4) CTE: Mode-wise Transaction Count (>2)
-- ============================
WITH temp_table AS (
    SELECT mode, COUNT(*) AS total_transactions
    FROM accounts
    GROUP BY mode
)
SELECT a.mode, t.total_transactions
FROM accounts a
JOIN temp_table t ON a.mode = t.mode
WHERE t.total_transactions > 2;



-- ============================
-- 📌 5) CTE: Customers Spending > 1000
-- ============================
WITH temp_table AS (
    SELECT customer_id, SUM(amount) AS total_spending
    FROM accounts
    GROUP BY customer_id
)
SELECT c.customer_name, t.total_spending
FROM customers c 
JOIN temp_table t ON c.customer_id = t.customer_id
WHERE total_spending > 1000;



-- ============================
-- 📌 6) CTE: Mode-wise Average Amount > 600
-- ============================
WITH temp_table AS (
    SELECT mode, AVG(amount) AS avg_amount
    FROM accounts
    GROUP BY mode
)
SELECT mode, avg_amount 
FROM temp_table
WHERE avg_amount > 600;



-- ============================
-- 📌 7) CTE: Top 2 Highest Spenders
-- ============================
WITH temp_table AS (
    SELECT customer_id, SUM(amount) AS total_spending
    FROM accounts
    GROUP BY customer_id
)
SELECT c.customer_name, t.total_spending
FROM customers c
JOIN temp_table t ON c.customer_id = t.customer_id
ORDER BY t.total_spending DESC 
LIMIT 2;



-- ============================
-- 📌 8) CTE: 20% of Total Mode-wise Amount
-- ============================
WITH temp_table AS (
    SELECT mode, SUM(amount) AS total_amount
    FROM accounts
    GROUP BY mode
)
SELECT a.account_id, a.mode, a.amount, t.total_amount
FROM accounts a
JOIN temp_table t ON a.mode = t.mode
WHERE a.amount >= (t.total_amount * 0.20);



-- ============================
-- 📌 9) RECURSIVE CTE – Count from 1 to 5
-- ============================
WITH RECURSIVE cte AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1 
    FROM cte 
    WHERE num < 5
)
SELECT num FROM cte;



-- ============================
-- 📌 10) RECURSIVE CTE – Count 1 to 10
-- ============================
WITH RECURSIVE cte AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1 
    FROM cte
    WHERE num < 10
)
SELECT num FROM cte;



-- ============================
-- 📌 11) RECURSIVE CTE – Count Down 10 to 1
-- ============================
WITH RECURSIVE cte AS (
    SELECT 10 AS num
    UNION ALL
    SELECT num - 1 
    FROM cte 
    WHERE num > 1
)
SELECT num FROM cte;



-- ============================
-- 📌 12) Multi-CTE Chain (Total → City-wise → Avg City Spend)
-- ============================
WITH total AS (
    SELECT customer_id, SUM(amount) AS total_spending 
    FROM accounts 
    GROUP BY customer_id
),
city_wise AS (
    SELECT c.customer_id, c.customer_name, t.total_spending, c.city
    FROM customers c 
    JOIN total t ON c.customer_id = t.customer_id
),
city_avg AS (
    SELECT city, AVG(total_spending) AS avg_city_spending
    FROM city_wise
    GROUP BY city
)
SELECT cw.customer_name, cw.city, cw.total_spending, ca.avg_city_spending
FROM city_wise cw
JOIN city_avg ca ON cw.city = ca.city
WHERE cw.total_spending > ca.avg_city_spending;



-- ============================================================
-- 🎯 PRACTICE SUMMARY
-- ============================================================
/*
MASTERED TODAY:
✔ Basic CTE (single)
✔ Multi-CTE chains
✔ CTE + JOIN
✔ CTE + Aggregation
✔ CTE + Window Logic
✔ RECURSIVE CTE (increment / decrement)
✔ City-wise & customer-wise analytics

📌 STATUS: SQL CTE MODULE COMPLETED
*/
