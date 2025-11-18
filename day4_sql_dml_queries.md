# 📊 Day 4: SQL DML & Query Essentials – SELECT, WHERE, UPDATE, DELETE (Complete Notes)

## 🧩 Aaj Kya Seekha?

| Topic | Purpose |
|--------|---------|
| **SELECT** | Data ko read / view karna |
| **DISTINCT** | Duplicate records ko hatana |
| **WHERE** | Data filter karna |
| **BETWEEN** | Range ke basis par filter |
| **IN / NOT IN** | Multiple exact matches |
| **UPDATE** | Purane data me changes |
| **DELETE** | Specific data remove |
| **QUERY EXECUTION FLOW** | SQL query ka actual run order |

---

# 🔍 SELECT – Data Read Karne Ka Primary Command

### ✔ Basic Select
```sql
SELECT * FROM students;
```
→ Table ka poora data fetch karta hai.

### ✔ Specific Columns
```sql
SELECT name, marks FROM students;
```

### ✔ Calculated Output
```sql
SELECT name, marks + 5 AS bonus FROM students;
```

### ✔ Unique Values
```sql
SELECT DISTINCT city FROM students;
```

---

# 🎯 WHERE – Data Filter Karne Ka Powerful Tool

### ✔ Common Operators
- `=`, `!=`, `>`, `<`, `>=`, `<=`
- `AND`, `OR`, `NOT`
- `LIKE`
- `IS NULL`, `IS NOT NULL`

### ✔ Example
```sql
SELECT * FROM students 
WHERE marks > 80 AND city = 'Delhi';
```

---

# 📌 BETWEEN – Range Based Filtering

```sql
SELECT * FROM students
WHERE marks BETWEEN 70 AND 90;
```
✔ 70 & 90 **both included**

---

# 📌 IN & NOT IN – Multiple Values in One Go

### ✔ IN
```sql
SELECT * FROM students
WHERE city IN ('Delhi', 'Mumbai', 'Pune');
```

### ✔ NOT IN
```sql
SELECT * FROM students
WHERE city NOT IN ('Delhi', 'Pune');
```

---

# 🛠️ UPDATE – Table Ke Existing Data Ko Change Karna

### ✔ Single Column Update
```sql
UPDATE students 
SET marks = 95 
WHERE id = 3;
```

### ✔ Multiple Columns
```sql
UPDATE students
SET name = 'Aman', marks = 99
WHERE id = 1;
```

### ✔ Using Calculations
```sql
UPDATE products
SET price = price + 50
WHERE category = 'Electronics';
```

### ✔ Conditional Updates (CASE)
```sql
UPDATE students
SET grade = CASE
    WHEN marks >= 90 THEN 'A'
    WHEN marks >= 75 THEN 'B'
    ELSE 'C'
END;
```

---

# ❌ DELETE – Specific Rows Remove Karne Ka Command

### ✔ Basic Delete
```sql
DELETE FROM students WHERE id = 5;
```

### ✔ Conditional Delete
```sql
DELETE FROM students WHERE marks < 40;
```

### ✔ Limited Delete (MySQL only)
```sql
DELETE FROM logs
ORDER BY created_at
LIMIT 10;
```

---

# 🧠 SQL Query Execution Order – Actual SQL Ka Dimag

SQL query likhne ka order alag hota hai,  
execute hone ka order **bilkul alag**.

### 🔥 SQL Execution Flow:
```
1. FROM  
2. JOIN  
3. WHERE  
4. GROUP BY  
5. HAVING  
6. SELECT  
7. ORDER BY  
8. LIMIT
```

✔ Ye flow samajhna SQL master banne ka foundation hai.

---

# 👑 GROUP BY + HAVING – Jo Sabko Confuse Karta Hai

### Query:
```sql
SELECT city, COUNT(*)
FROM students
WHERE marks > 80
GROUP BY city
HAVING COUNT(*) > 5
ORDER BY COUNT(*) DESC
LIMIT 3;
```

### Step-by-step Meaning:
- **FROM** → students table load  
- **WHERE** → sirf marks > 80 rows  
- **GROUP BY** → city-wise groups  
- **COUNT(*)** → har group me kitni rows  
- **HAVING** → group-level filtering  
- **ORDER BY** → highest count pehle  
- **LIMIT** → top 3 cities

### ✔ HAVING COUNT(*) kya count karta hai?
- WHERE ke baad  
- Group ke andar  
- Sirf **rows ki counting**  
- Har group ka **separate count**

---

# 🎉 DAY 4 – Key Points (Quick Summary)

### ✅ SELECT & WHERE perfectly clear  
### ✅ UPDATE ke saare professional use cases  
### ❌ DELETE ko safely kaise use kare  
### 🔥 Query execution ka actual flow  
### ✔ GROUP BY + HAVING crystal clear  

---
