# 📘 Day 4: SQL DML & Query Commands – INSERT, SELECT, WHERE, UPDATE, DELETE (Complete Notes)

---

# 🗂️ Aaj Ke Topics

| Command | Purpose |
|--------|----------|
| INSERT | Naya data add karna |
| SELECT | Data read karna |
| DISTINCT | Duplicate values remove |
| WHERE | Data filter |
| BETWEEN | Range filter |
| IN / NOT IN | Multiple values check |
| UPDATE | Data modify |
| DELETE | Data remove |
| Execution Flow | SQL actual run order |
| GROUP BY + HAVING | Group level filtering |

---

# 🟦 INSERT – Table Me Naya Data Add Karna

### ✔ 1. Simple Insert (All Columns)
```sql
INSERT INTO students 
VALUES (1, 'Aman', 95);
```

### ✔ 2. Insert Specific Columns
```sql
INSERT INTO students (name, marks)
VALUES ('Ravi', 88);
```

### ✔ 3. Insert Multiple Rows
```sql
INSERT INTO students (id, name, marks)
VALUES 
(3, 'Priya', 90),
(4, 'Vikas', 85),
(5, 'Kiran', 78);
```

📌 Notes:
- Column order match ho raha ho to VALUES me order same hona chahiye  
- Auto Increment columns skip kiye ja sakte hain  
- Ek query me multiple rows fast and clean hote hain

---

# 🟦 SELECT – Data Read Karna

### ✔ All Columns
```sql
SELECT * FROM students;
```

### ✔ Specific Columns
```sql
SELECT name, marks FROM students;
```

### ✔ Calculation Ke Sath
```sql
SELECT name, marks + 5 AS bonus FROM students;
```

### ✔ Unique Values
```sql
SELECT DISTINCT city FROM students;
```

---

# 🟦 WHERE – Row Filtering

WHERE un rows ko choose karta hai jo condition match kare.

### ✔ Example
```sql
SELECT * FROM students
WHERE marks > 80;
```

### Operators
- `=`, `!=`, `>`, `<`, `>=`, `<=`
- `AND`, `OR`, `NOT`
- `LIKE`
- `IS NULL`, `IS NOT NULL`

---

# 🟦 BETWEEN – Range Filtering

```sql
SELECT * FROM students
WHERE marks BETWEEN 70 AND 90;
```

✔ Dono side inclusive  
✔ Clean and easy to read  

---

# 🟦 IN / NOT IN – Multiple Value Match

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

# 🟦 UPDATE – Purane Data Me Changes

### ✔ Basic Update
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

### ✔ Calculation Wala Update
```sql
UPDATE products
SET price = price + 50
WHERE category = 'Electronics';
```

### ✔ Conditional (CASE)
```sql
UPDATE students
SET grade = CASE
    WHEN marks >= 90 THEN 'A'
    WHEN marks >= 75 THEN 'B'
    ELSE 'C'
END;
```

⚠ WHERE na lagane par pura table update ho jata hai

---

# 🟦 DELETE – Table Se Data Remove Karna

### ✔ Specific Delete
```sql
DELETE FROM students WHERE id = 5;
```

### ✔ Conditional Delete
```sql
DELETE FROM students
WHERE marks < 40;
```

### ✔ Delete With Limit (MySQL)
```sql
DELETE FROM logs
ORDER BY created_at
LIMIT 10;
```

⚠ WHERE na lagaya to saara data delete ho jayega

---

# 🧠 SQL Query Execution Flow – Kaise Run Hoti Hai Query?

SQL query likhne ka order kuch aur hota hai…  
Par **execute hone ka order alag** hota hai.

### 🔥 Actual Execution Order
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

Is order ko samajh lena = SQL master ho jana.

---

# 👑 GROUP BY + HAVING – Group Level Filtering

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

### Step-by-step Explanation:
- FROM → table load hota hai  
- WHERE → marks > 80 wale rows bachte hain  
- GROUP BY → city ke hisab se groups bante hain  
- COUNT(*) → har group me kitni rows hain  
- HAVING → group level filter apply hota hai  
- ORDER BY → highest count sabse pehle  
- LIMIT → top 3 groups  

### ✔ HAVING COUNT(*) kya count karta hai?
- WHERE ke baad bachi rows  
- Har group ke andar present rows  
- Pure group ki **row count**

---

# 🎉 Aaj Kya Seekha (Day 4 Summary)

### ✅ INSERT ke saare tarike  
### ✅ SELECT ka full use  
### ✅ WHERE + BETWEEN + IN/NOT IN  
### ✅ UPDATE (multiple + calculation + CASE)  
### ❌ DELETE safely kaise use hota hai  
### 🎯 SQL Query Execution ka real order  
### 👑 GROUP BY + HAVING full clarity  

---

