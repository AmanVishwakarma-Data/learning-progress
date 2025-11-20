# 📘 Day 6 – SQL GROUP BY & HAVING (Full Detailed Notes)

---

## ⭐ 1. GROUP BY — Full Detailed Notes

### 🔹 GROUP BY kya hota hai?
GROUP BY rows ko **similar values** ke basis par groups me todta hai.

Har group par aggregate functions apply hote hain:

- SUM()
- COUNT()
- AVG()
- MIN()
- MAX()

**Use Cases:**
- Department-wise salary  
- City-wise students count  
- Product-wise total sales  
- Month-wise revenue  

---

## 🔹 GROUP BY ke RULES (Most Important)

### ✔ Rule 1: SELECT me jo non-aggregated column ho → woh GROUP BY me hona chahiye
```sql
SELECT city, COUNT(*) 
FROM students
GROUP BY city;
```

### ✔ Rule 2: WHERE → group banne se pehla filter karta hai  
### ✔ Rule 3: HAVING → group banne ke baad filter karta hai  
### ✔ Rule 4: GROUP BY → duplicate values ko combine karta hai  

---

## 🔹 SQL Execution Order (VERY IMPORTANT)

```
1. FROM  
2. WHERE  
3. GROUP BY  
4. HAVING  
5. SELECT  
6. ORDER BY
```

Iske baad GROUP BY & HAVING crystal clear ho jaate hain.

---

## 🔹 GROUP BY + Aggregation (Most Used Functions)

- COUNT() → total rows  
- SUM() → total  
- AVG() → average  
- MIN() → minimum  
- MAX() → maximum  

---

## 🔹 GROUP BY – Practical Examples

### 1) City-wise students count
```sql
SELECT city, COUNT(*)
FROM students
GROUP BY city;
```

### 2) Department-wise average salary
```sql
SELECT department, AVG(salary)
FROM employees
GROUP BY department;
```

### 3) Product-wise total quantity sold
```sql
SELECT product, SUM(quantity)
FROM sales
GROUP BY product;
```

### 4) Month-wise total sales
```sql
SELECT MONTH(order_date), SUM(amount)
FROM orders
GROUP BY MONTH(order_date);
```

---

## 🔥 GROUP BY – Common Mistakes

### ❌ SELECT me extra columns rakh dena (jo GROUP BY me nahi hain)
```sql
SELECT city, age, COUNT(*)
FROM students
GROUP BY city;  -- ❌ Error
```

### ❌ WHERE me aggregate functions use karna
```sql
WHERE SUM(amount) > 1000  -- ❌ wrong
```

### ❌ ORDER BY group ke baad SELECT columns mismatch

---

# ⭐ 2. HAVING — Full Detailed Notes

### 🔹 HAVING kya hota hai?
HAVING **groups ko filter** karta hai.  
Aggregate functions ke liye use hota hai.

### Simple Formula:
```
HAVING = GROUP BY ke baad ka filter  
WHERE  = GROUP BY ke pehle ka filter
```

---

## 🔹 Kyun HAVING use hota hai?

Because **WHERE aggregate functions ko allow nahi karta.**

Example:
```
"Sirf wahi product jinka total quantity > 8 ho"
```

✔ Correct:
```sql
SELECT product, SUM(quantity)
FROM sales
GROUP BY product
HAVING SUM(quantity) > 8;
```

---

## 🔹 HAVING – Real-Life Examples

### 1) Cities jaha 10 se zyada students ho
```sql
SELECT city, COUNT(*)
FROM students
GROUP BY city
HAVING COUNT(*) > 10;
```

### 2) Departments jaha avg salary > 50,000
```sql
SELECT department, AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;
```

### 3) Categories jaha total sales > 1 lakh
```sql
SELECT category, SUM(amount)
FROM orders
GROUP BY category
HAVING SUM(amount) > 100000;
```

---

## 🔹 HAVING without GROUP BY
Agar poori table ka aggregate filter karna ho:

```sql
SELECT SUM(amount)
FROM orders
HAVING SUM(amount) > 10000;
```

---

## 🔥 HAVING – Common Mistakes

### ❌ HAVING ka wrong use:
```sql
HAVING city = 'Delhi'   -- ❌ wrong (no aggregate)
```

✔ Correct:
```sql
WHERE city = 'Delhi'
```

---

# ⭐ 3. WHERE vs GROUP BY vs HAVING — Final Comparison

| Feature | WHERE | GROUP BY | HAVING |
|--------|--------|-----------|---------|
| Filter Timing | Pehle | Groups banata hai | Groups ke baad filter |
| Aggregation Allowed? | ❌ No | ✔ Groups | ✔ Yes |
| Purpose | Row-level filter | Rows ko group karna | Group-level filter |

---

# ⭐ 4. Quick Revision Notes (Short & Powerful)

- GROUP BY → rows ko groups me todta hai  
- HAVING → groups ko filter karta hai  
- WHERE → rows ko filter karta hai  
- SELECT me aggregate ya group column hona mandatory  
- HAVING aggregated filtering ke liye hota hai  
- WHERE aggregation ko support nahi karta  
- SQL execution order yaad rakho  

---

