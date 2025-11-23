# 📘 Day 9 – SQL CTE (Common Table Expression)

---

## ⭐ 1. CTE (Common Table Expression) – Kya Hota Hai?

CTE ek **temporary result set** hota hai jo:

- SELECT, INSERT, UPDATE, DELETE ke andar use hota hai  
- Sirf query ke execution tak exist karta hai  
- Jiska naam tum khud define karte ho  
- Subqueries ko clean & readable banata hai  

### ✔ Syntax
```sql
WITH cte_name AS (
    SELECT ...
)
SELECT * FROM cte_name;
```

Bas itna simple!

---

## ⭐ 2. CTE Kyun Use Karte Hain? (Real Practical Reasons)

### 1️⃣ Query clean & readable ho jati hai  
Nested subqueries ko baar-baar likhne se behtar → CTE ek jagah define kar do.

### 2️⃣ Same subquery ko multiple baar reuse karna  
CTE = write once, use multiple times.

### 3️⃣ Complex logic ko steps me todna  
Coding me functions jaise → SQL me CTE “temporary function” ban jata hai.

### 4️⃣ Recursive logic  
Hierarchy (CEO → Manager → Employees) ke liye BEST.

---

## ⭐ 3. Simple & Clear CTE Example  

🎯 **Goal:** Top 5 highest salaries ka total nikalna.

### ❌ Without CTE (extremely messy)
```sql
SELECT SUM(salary)
FROM (
    SELECT salary
    FROM employees
    ORDER BY salary DESC
    LIMIT 5
) t;
```

### ✅ With CTE (professional code)
```sql
WITH Top5 AS (
    SELECT salary
    FROM employees
    ORDER BY salary DESC
    LIMIT 5
)
SELECT SUM(salary) 
FROM Top5;
```

Dekha?  
CTE → code clean + readable + maintainable.

---

## ⭐ 4. Multiple CTEs Ek Sath

```sql
WITH
    high_salary AS (
        SELECT * FROM employees WHERE salary > 50000
    ),
    count_high_salary AS (
        SELECT COUNT(*) AS total FROM high_salary
    )
SELECT * FROM count_high_salary;
```

---

## ⭐ 5. CTE + JOIN Example

🎯 Goal:  
Har customer ka total order amount nikalna  
Aur sirf un customers ko dikhana jinka amount > 10,000 ho.

```sql
WITH total_orders AS (
    SELECT customer_id, SUM(amount) AS total_amount
    FROM orders
    GROUP BY customer_id
)
SELECT c.name, t.total_amount
FROM total_orders t
JOIN customers c 
    ON c.customer_id = t.customer_id
WHERE t.total_amount > 10000;
```

---

## ⭐ 6. Window Functions + CTE (Very Powerful)

```sql
WITH AvgMarks AS (
    SELECT *,
           AVG(marks) OVER(PARTITION BY class) AS avg_class_marks
    FROM student_marks
)
SELECT * 
FROM AvgMarks
WHERE marks > avg_class_marks;
```

Yeh logic karta kya hai?  
“Apni class ke average se jada marks wale students.”

---

## ⭐ 7. CTE vs Subquery (Clear Difference)

| Feature | CTE | Subquery |
|--------|------|----------|
| Readability | 👍 Clean | 👎 Messy |
| Reusable | 👍 Yes | 👎 No |
| Recursive | 👍 Supported | ❌ Not supported |
| Debugging | Easy | Difficult |

### ✔ Conclusion:
👉 CTE = Professional SQL Writing  
👉 Subquery = Kaam chal jata hai but maintain karna mushkil

---

## ⭐ 8. Recursive CTE (Most Advanced Feature)

**Employee Hierarchy Example**

| id | name     | manager_id |
|----|-----------|------------|
| 1  | CEO       | NULL       |
| 2  | Manager   | 1          |
| 3  | Developer | 2          |

```sql
WITH RECURSIVE hierarchy AS (
    SELECT id, name, manager_id
    FROM employees
    WHERE manager_id IS NULL   -- CEO

    UNION ALL

    SELECT e.id, e.name, e.manager_id
    FROM employees e
    INNER JOIN hierarchy h
        ON e.manager_id = h.id
)
SELECT * FROM hierarchy;
```

✔ Result → Puri tree structure mil jayegi.  

---

## ⭐ 9. CTE Kab Use Karna Chahiye?

✔ Jab query bohot complex ho  
✔ Jab same subquery ko baar-baar use karna ho  
✔ Jab logical steps me query likhni ho  
✔ Jab window functions ka result filter karna ho  
✔ Jab joins heavy ho  
✔ Jab recursive logic chahiye ho  

---

## ⭐ 10. Short Summary (Aman Style Notes)

- CTE = Temporary named result set  
- `WITH` keyword se start hota hai  
- Code clean, readable, reusable banata hai  
- Multiple CTEs allowed  
- JOIN + Window Functions ke sath powerful  
- Recursive CTE banata hai tree structure  

---

