# 📘 Day 7 – SQL JOIN & SUBQUERIES (Zero to Expert Notes)

---

# 🎯 1. SQL JOIN — Zero to Expert

## ✔ JOIN Kya Hota Hai?
Do ya do se zyada tables ka data **common column (PK–FK)** ke basis par combine karna.

### 👉 Real-Life Examples  
- Student + Marks  
- Employee + Salary  
- Customer + Orders  

---

# ⭐ JOIN Types — Full Clarity

---

## ✔ 1. INNER JOIN
Sirf matching rows deta hai.  
Non-matching rows remove ho jate hain.

```sql
SELECT c.name, o.amount
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id;
```

---

## ✔ 2. LEFT JOIN  
Left table = **FULL**, right = only matching  
Non-matching = **NULL**

```sql
SELECT c.name, o.amount
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id;
```

⚠ Important Rule:  
`LEFT JOIN + WHERE o.amount > 500` → LEFT JOIN ko INNER JOIN me convert kar deta hai.  
Right table ke filters **ON me likho**, WHERE me nahi.

---

## ✔ 3. RIGHT JOIN  
Right table full + left matching  
(Rare use case, LEFT JOIN se replace ho jata hai)

---

## ✔ 4. FULL OUTER JOIN  
Dono tables ka **matching + non-matching** data.  
(MySQL me `UNION` se achieve hota hai)

---

## ✔ 5. CROSS JOIN  
Cartesian product (rows × rows)  
Use → combinations, calendar generation

---

## ✔ 6. SELF JOIN  
Ek table ko khud se join karna.

```sql
SELECT e.name AS employee, m.name AS manager
FROM emp e
LEFT JOIN emp m ON e.manager_id = m.emp_id;
```

---

# ⭐ JOIN + GROUP BY + HAVING

- GROUP BY → groups banata hai  
- HAVING → aggregated results ko filter karta hai  
- WHERE → rows ko filter karta hai (groups nahi)

```sql
SELECT genre, AVG(score) AS Avg_Score
FROM movies
GROUP BY genre
HAVING AVG(score) > (SELECT AVG(score) FROM movies);
```

---

# ⭐ JOIN — Best Practices

✔ Always join using **PK–FK**  
✔ Never join on names/emails  
✔ Aliases use karo (short & clean)  
✔ LEFT JOIN filtering → ON me  
✔ Avoid `SELECT *`  
✔ 1-to-many, many-to-many relations samajh lo  

---

# ⭐ Common JOIN Mistakes

❌ Wrong join condition  
❌ Missing ON  
❌ LEFT JOIN ke baad WHERE ka wrong use  
❌ Duplicate rows due to many-to-many  

---

# 🎯 2. SUBQUERIES — Zero to Master

Subquery = Query inside query.  
Inner query pehle run hoti hai → outer query result ko use karti hai.

---

# ⭐ Subquery Types

---

## ✔ 1. WHERE Subquery (Most Common)
```sql
SELECT name
FROM Students
WHERE marks > (SELECT AVG(marks) FROM Students);
```

---

## ✔ 2. IN / NOT IN Subquery
Multiple values match karne ke liye.

```sql
WHERE id IN (SELECT student_id FROM Fees);
```

⚠ WARNING:  
`NOT IN` → agar subquery me NULL ho → **empty result**.

---

## ✔ 3. FROM Subquery (Derived Table)
Temporary table ban jati hai.

```sql
SELECT name, marks
FROM (
  SELECT name, marks, AVG(marks) OVER() AS avg_marks
  FROM Students
) t
WHERE marks > avg_marks;
```

---

## ✔ 4. SELECT Subquery (Scalar)
Single value return hoti hai.

```sql
SELECT name, score,
       (SELECT AVG(score) FROM movies) AS overall_avg
FROM movies;
```

---

## ✔ 5. Correlated Subquery  
Inner query → outer row ke hisab se bar-bar run hoti hai.

```sql
SELECT s1.name
FROM Students s1
WHERE marks >= ALL (SELECT marks FROM Students);
```

EXISTS version (best performance):

```sql
WHERE EXISTS (
   SELECT 1 
   FROM Fees f 
   WHERE f.student_id = s.id
);
```

---

## ✔ 6. Nested Subqueries
```sql
WHERE id IN (
   SELECT student_id
   FROM Fees
   WHERE amount > (SELECT AVG(amount) FROM Fees)
);
```

---

## ✔ 7. ANY / ALL Subqueries
```
marks > ANY (SELECT marks FROM Students);
marks > ALL (SELECT marks FROM Students);
```

---

# 🎯 3. Subqueries in UPDATE / DELETE / INSERT

---

## ⭐ UPDATE with Subquery
```sql
UPDATE details_backup
SET SALARY = SALARY * 10
WHERE age IN (SELECT AGE FROM e_details WHERE AGE > 35);
```

Better version (NULL-safe + fast):

```sql
UPDATE details_backup db
SET SALARY = db.SALARY * 10
WHERE EXISTS (
    SELECT 1 
    FROM e_details e 
    WHERE e.age = db.age AND e.age > 35
);
```

---

## ⭐ DELETE with Subquery  
Fee na dene wale students:

```sql
DELETE FROM Students
WHERE id NOT IN (SELECT student_id FROM Fees);
```

Best version:
```sql
DELETE FROM Students s
WHERE NOT EXISTS (
   SELECT 1 FROM Fees f WHERE f.student_id = s.id
);
```

---

## ⭐ INSERT with Subquery  
Toppers copy:

```sql
INSERT INTO toppers (name, marks)
SELECT name, marks
FROM Students
WHERE marks > (SELECT AVG(marks) FROM Students);
```

---

# 🎯 4. HAVING + Subquery + Aggregation

```sql
HAVING AVG(score) > (SELECT AVG(score) FROM movies);
```

Meaning:  
Genre-wise avg > overall avg

**NOTE:** WHERE me aggregate allowed nahi → HAVING required.

---

# ⭐ 5. Common Subquery Mistakes

❌ Subquery returns multiple rows (scalar expected)  
❌ NOT IN with NULL  
❌ Derived table without alias  
❌ Wrong WHERE vs HAVING  
❌ Scalar subquery returning >1 row  

---

# ⭐ 6. Best Practices

✔ EXISTS > IN  
✔ NOT EXISTS > NOT IN  
✔ Derived tables for complex logic  
✔ JOIN alternative = subquery  
✔ Scalar subquery → only one row  
✔ Correlated subquery → avoid when possible  
✔ Avoid deep nesting  

---

# 🎉 FINAL SUMMARY (Mind Map)

### JOIN:
- INNER → matching rows  
- LEFT → left full + right matching  
- RIGHT → right full  
- FULL → both sides  
- CROSS → all combinations  
- SELF → table joins itself  

### SUBQUERY:
- WHERE  
- IN / NOT IN  
- EXISTS / NOT EXISTS  
- ANY / ALL  
- FROM (derived)  
- SELECT (scalar)  
- Nested  
- Correlated  

### UPDATE / DELETE / INSERT + Subquery  
- EXISTS version fastest & safest  

### GROUP BY + HAVING  
- WHERE → row filter  
- GROUP BY → grouping  
- HAVING → aggregated filtering  

---

