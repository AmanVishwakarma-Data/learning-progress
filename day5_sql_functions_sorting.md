# ✅ Day 5 – SQL Inbuilt Functions, ORDER BY, LIMIT (Complete Notes)

---

## ✅ 1. SQL Inbuilt Functions → Aggregate Functions (Part 1)

Aggregate functions hamesha multiple rows ko combine karke ek single output dete hain.

### ⭐ Functions:

### **1) COUNT()**
- `COUNT(*)` → NULL included  
- `COUNT(column)` → NULL ignored

### **2) SUM()**
- Total nikalta hai  
- NULL values ignore hoti hain

### **3) AVG()**
- Average return karta hai  
- NULL ignored

### **4) MAX()**
- Highest/maximum value  
- Text → Z highest  
- Dates → Latest date

### **5) MIN()**
- Lowest/minimum value  
- Text → A lowest  
- Dates → Oldest date

### ⭐ Important Rules:
- ✔ Aggregate functions **single value** return karte hain  
- ✔ WHERE aggregate se **pehle** apply hota hai  
- ✔ HAVING aggregate ke result ko filter karta hai  
- ✔ GROUP BY ke sath category-wise result milta hai  
- ✔ NULL mostly ignore hote hain (except COUNT*)

---

## ✅ 2. SQL Inbuilt Functions → Scalar Functions (Part 2)

Scalar functions **row-by-row** kaam karte hain.  
Ye har record ko individually modify karte hain.

---

### ⭐ STRING FUNCTIONS:

- **UPPER() / LOWER()** → text ka case change  
- **LENGTH()** → string length  
- **TRIM(), LTRIM(), RTRIM()** → spaces remove  
- **CONCAT()** → strings join  
- **SUBSTRING()** → string ka part  
- **REPLACE()** → text replace

---

### ⭐ NUMERIC FUNCTIONS:

- **ROUND()** → round off  
- **CEIL()** → upper nearest integer (12.1 → 13)  
- **FLOOR()** → lower nearest integer (12.9 → 12)  
- **POWER(a,b)** → a^b  
- **ABS()** → negative → positive

---

### ⭐ DATE FUNCTIONS:

- **NOW() / CURRENT_TIMESTAMP** → current date + time  
- **CURDATE() / CURTIME()** → date / time  
- **YEAR(), MONTH(), DAY()** → date ke parts  
- **DATE_ADD(), DATE_SUB()** → add/subtract date  
- **DATEDIFF()** → date difference

---

### ⭐ CONVERSION FUNCTIONS:

- **CAST() / CONVERT()**  
  Datatype change (string → int, string → date etc.)

---

### ⭐ Important Rules:
- ✔ Scalar functions **per row** apply hote hain  
- ✔ WHERE me use kar sakte ho  
- ✔ Scalar + Aggregate dono sath use ho sakte hain  
- ✔ Scalar functions indexing **slow** kar dete hain (important)

---

## ✅ 3. ORDER BY (Sorting)

ORDER BY result ko sort karta hai.

---

### ⭐ ASC (Ascending)
- Numbers: small → big  
- Text: A → Z  
- Dates: oldest → latest

### ⭐ DESC (Descending)
- Numbers: big → small  
- Text: Z → A  
- Dates: latest → oldest

---

### ⭐ Multiple Column Sorting:
```sql
ORDER BY department ASC, salary DESC;
```

---

### ⭐ ORDER BY Column Number:
```sql
ORDER BY 2 DESC;
```

→ 2nd selected column ke basis par sort.

---

### ⭐ NULL Sorting (MySQL):
- ASC → NULL top  
- DESC → NULL last

---

### ⭐ ORDER BY + GROUP BY:
GROUP BY ke output ko sort karne ke liye ORDER BY lagate hain.

---

### ❌ Common Mistakes:
- ORDER BY se pehle SELECT alias missing  
- ORDER BY without ORDER BY understanding (random output)  
- ORDER BY without index = slow  
- Capital/small ka effect hota hai (lexicographical sorting)

---

## ✅ 4. LIMIT (Row Restriction / Pagination)

LIMIT result me rows count control karta hai.

---

### ⭐ Basic:
```sql
LIMIT 5;
```

→ Pehli 5 rows.

---

### ⭐ LIMIT with OFFSET:

**Format 1:**  
`LIMIT skip, count;`

**Format 2:**  
`LIMIT count OFFSET skip;`

Example:
```sql
LIMIT 5, 10;
```
→ 5 rows skip, next 10 show.

---

### ⭐ LIMIT + ORDER BY:
```sql
ORDER BY salary DESC
LIMIT 3;
```
→ Top 3 highest salaries.

Without ORDER BY → random rows (meaningless LIMIT).

---

### ⭐ LIMIT Use Cases:
- Top 5 students  
- Latest 10 orders  
- Highest salaries  
- Pagination (Page 1 → LIMIT 0,10; Page 2 → LIMIT 10,10)

---

### ❌ Common Mistakes:
- LIMIT without ORDER BY  
- Negative LIMIT  
- Large OFFSET = slow

---

## 🔥 Query Execution Order:
```
FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
```

---

## 🟦 Aaj SQL Me Maine Seekha.

✔ Aggregate Functions (COUNT, SUM, AVG, MAX, MIN)  
✔ Scalar Functions (String, Number, Date, Conversion)  
✔ ORDER BY (ASC, DESC, multi-sort, NULL sorting)  
✔ LIMIT (offset, pagination, top N)

---

