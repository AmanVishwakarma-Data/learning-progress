# 📘 Day 8 – SQL Window Functions + DCL + TCL (FULL SUMMARY)

---

# 🔥 1) WINDOW FUNCTIONS — COMPLETE MASTERCLASS

## 🔥 1.1 Window Function Kya Hota Hai?

Window Function ka behaviour **Excel jaisa** hota hai.

- Rows **merge nahi hoti** (GROUP BY ke opposite)
- Har row **as-it-is** rehti hai
- Bas ek extra **calculated column** add hota hai
- Calculation kisi "window" (rows ke set) par hota hai

**GROUP BY → rows collapse**  
**WINDOW → rows decorate**

### ✔ Example Intuition

Har employee ke saamne **department ka average salary** dikhana — bina rows collapse kiye.

---

## 🔥 1.2 Window Function ka COMPLETE SYNTAX

```sql
<function>() OVER (
    [PARTITION BY columns]
    [ORDER BY columns]
    [ROWS | RANGE BETWEEN frame_start AND frame_end]
)
```

### ✔ Rules:
- `OVER` **mandatory**
- `PARTITION`, `ORDER`, `ROWS` optional
- 0, 1, 2, 3 parts use ho sakते हैं

---

## 🔥 1.3 Window Function ke 4 Parts

### ✔ PART 1 — Function Type  
**Aggregate:** SUM(), AVG(), COUNT()  
**Ranking:** ROW_NUMBER(), RANK(), DENSE_RANK()  
**Analytic:** LAG(), LEAD(), FIRST_VALUE(), LAST_VALUE()

---

### ✔ PART 2 — OVER()  
SQL ko batata hai:

**"Ye function kis rows ke beech chalega?"**

---

### ✔ PART 3 — PARTITION BY  
GROUP BY ka **non-destructive version**.

- Data groups me banta hai
- Har partition me calculation alag
- Rows collapse nahi hoti

Example:
```sql
AVG(salary) OVER(PARTITION BY department)
```

---

### ✔ PART 4 — ORDER BY  
Window ke andar rows ko sort karta hai.

Use Cases:
- Ranking  
- Running Total  
- Moving Average  
- LAG / LEAD

Without ORDER BY → ranking meaningless.

---

## 🔥 1.4 FRAME CLAUSE — MOST CONFUSING BUT IMPORTANT

**Default frame:**

```
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
```

Meaning:
- Partition ki first row → current row tak
- SUM/AVG **cumulative** ban jaate hain

### ⭐ Frame Options Table  
| Frame | Meaning |
|-------|---------|
| UNBOUNDED PRECEDING | First row se |
| CURRENT ROW | Sirf current row |
| n PRECEDING | Past n rows |
| n FOLLOWING | Next n rows |
| UNBOUNDED FOLLOWING | Last row tak |

### ✔ Example: Last 3 rows moving average
```sql
AVG(sales) OVER(
  ORDER BY date
  ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
)
```

---

## 🔥 1.5 Ranking Functions

| Function | Meaning |
|----------|---------|
| ROW_NUMBER() | Har row unique number |
| RANK() | Ties allowed + gaps |
| DENSE_RANK() | Ties allowed + **no gap** |
| NTILE(n) | Data ko n buckets me divide |

---

## 🔥 1.6 Analytic Functions

| Function | Work |
|----------|-------|
| LAG() | Previous row value |
| LEAD() | Next row value |
| FIRST_VALUE() | Partition ki first value |
| LAST_VALUE() | Partition ki last value |

---

## 🔥 1.7 Window Function Execution Order

Window Functions execute hote hain:

**GROUP BY ke baad, ORDER BY se pehle**

```
1. FROM  
2. WHERE  
3. GROUP BY  
4. HAVING  
5. WINDOW FUNCTIONS  
6. SELECT  
7. ORDER BY
```

---

## 🔥 1.8 WHERE me Window Function Use Nahi Hota

❌ Wrong:
```sql
WHERE ROW_NUMBER() OVER(...) = 1
```

✔ Correct:
```sql
SELECT *
FROM (
   SELECT *, ROW_NUMBER() OVER(...) AS rn
   FROM table
)t
WHERE rn = 1;
```

---

## 🔥 1.9 Window Functions — Real Life Use-Cases

- Department-wise top salary  
- Running Total / Cumulative Sum  
- Moving Average  
- % Contribution using SUM() OVER()  
- Previous/next row comparisons  
- Multi-level analytics  

---

## 🔥 1.10 Common Student Mistakes

- ORDER BY na lagana  
- PARTITION BY ko GROUP BY samajhna  
- SUM() OVER ko normal SUM samajhna  
- WHERE me window functions directly use karna  
- Frame clause ignore kar dena  

---

# 🟦 2) DCL — Data Control Language

## Purpose:
**Permissions + Security Control**

### ✔ 1. GRANT — Access dena
```sql
GRANT SELECT, INSERT ON employees TO aman;
```

### ✔ 2. REVOKE — Access wapas lena
```sql
REVOKE SELECT ON employees FROM aman;
```

### ⭐ Important Notes:
- Security ka kaam  
- Mostly DBA handle karta hai  
- Users & Roles create kiye ja sakते हैं  

---

# 🟦 3) TCL — Transaction Control Language

## Purpose:
INSERT / UPDATE / DELETE ke baad **data ko control** karna

---

## 🔥 3.1 COMMIT  
Permanent save  
```sql
COMMIT;
```

## 🔥 3.2 ROLLBACK  
Undo changes  
```sql
ROLLBACK;
```

## 🔥 3.3 SAVEPOINT  
Checkpoint inside transaction  
```sql
SAVEPOINT A;
UPDATE employees ...
ROLLBACK TO A;
```

## 🔥 3.4 SET TRANSACTION  
Transaction mode set  
```sql
SET TRANSACTION READ ONLY;
```

---

## ⚠ VERY IMPORTANT

| Operation | Rollback Possible? |
|-----------|---------------------|
| DELETE | ✔ Yes |
| TRUNCATE | ❌ No (DDL) |
| COMMIT ke baad rollback | ❌ No |
| SAVEPOINT | ✔ Partial rollback |

---

# 🟪 BONUS: Earlier Chats se Connected Topics

Aapne already master kiye:

- GROUP BY / HAVING  
- JOIN  
- Subqueries  
- Aggregates  
- Query Building Logic  
- Execution Order  
- Running Total  
- DDL / DML differences  
- Excel-style SQL thinking  

Ab ye sab **Window Functions + TCL + DCL** ke saath connect ho gaya.

---

# 🟧 FINAL SUMMARY (Super Clean)

## 🌟 WINDOW FUNCTIONS
- Rows collapse nahi hoti  
- PARTITION BY = logical grouping  
- ORDER BY = ranking + cumulative  
- FRAME = window size  
- SUM() OVER() → cumulative  
- WHERE me use nahi hota  

## 🌟 DCL
- Permissions + Security  
- Commands: GRANT, REVOKE  

## 🌟 TCL
- Transaction control  
- Commands: COMMIT, ROLLBACK, SAVEPOINT  
- DELETE rollback ok  
- TRUNCATE rollback not possible  

---

