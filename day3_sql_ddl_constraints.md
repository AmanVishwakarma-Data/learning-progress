# 📊 Day 3: SQL DDL Commands & Constraints - Complete Mastery

## 🗂️ SQL COMMANDS CATEGORIES

### 5 Main Types of SQL Commands:

| Type | Full Form | Purpose | Examples |
|------|-----------|---------|----------|
| **DDL** | Data Definition Language | Database structure modify | CREATE, ALTER, DROP |
| **DML** | Data Manipulation Language | Data modify | INSERT, UPDATE, DELETE |
| **DQL** | Data Query Language | Data read | SELECT |
| **DCL** | Data Control Language | Permissions management | GRANT, REVOKE |
| **TCL** | Transaction Control Language | Transactions management | COMMIT, ROLLBACK |

---

## 🏗️ DDL COMMANDS (Data Definition Language)

### 1. CREATE
- Tables, databases, indexes create karta hai
- Data types aur constraints define karta hai

### 2. ALTER 
- Existing table structure modify karta hai
- Columns add/delete/rename
- Data types change
- Constraints add/remove

### 3. DROP
- Table/database permanently delete karta hai
- **Dangerous** - data lost forever

### 4. TRUNCATE
- All table data delete karta hai (structure safe)
- **Faster** than DELETE
- Triggers not fired

### 5. RENAME
- Table name change karta hai
- Dependencies check karna important

---

## 🛡️ DATA INTEGRITY TYPES

### 1. Entity Integrity
- **Primary Key** se maintain hoti hai
- Har row unique identification

### 2. Referential Integrity  
- **Foreign Key** se maintain hoti hai
- Tables ke beech valid relationships

### 3. Domain Integrity
- **Data Types, Check, Default, Not Null** se maintain hoti hai
- Valid values aur formats ensure karti hai

### 4. Business Integrity
- **Triggers, Procedures, Business Rules** se maintain hoti hai
- Company specific logic implement karti hai

---

## 🔍 SQL SYSTEM COMMANDS (Database Information)

### Useful Metadata Commands:
- `SHOW DATABASES;` - All databases list
- `SELECT DATABASE();` - Current database
- `SHOW TABLES;` - All tables in current database
- `DESCRIBE table_name;` - Table structure
- `SHOW CREATE TABLE table_name;` - Complete table creation script
- `SHOW COLUMNS FROM table_name;` - All columns information
- `SHOW INDEX FROM table_name;` - Table indexes
- `SHOW TABLE STATUS;` - Table size and statistics

---

## 🔗 SQL CONSTRAINTS - Complete Guide

### 1. PRIMARY KEY
- Unique + Not Null
- Table ki main identity

### 2. FOREIGN KEY
- Do tables ko connect karta hai
- Referential integrity maintain karta hai

### 3. UNIQUE
- Duplicate values allow nahi karta
- Null values allowed

### 4. NOT NULL
- Empty values allow nahi karta
- Mandatory fields ke liye

### 5. CHECK
- Specific conditions validate karta hai
- Data quality ensure karta hai

### 6. DEFAULT
- Automatic value provide karta hai
- User input nahi diya to ye value use hoti hai

### 7. INDEX
- Fast searching enable karta hai
- Query performance improve karta hai

---

## 💡 KEY LEARNING OUTCOMES

### ✅ DDL Commands Mastery
- CREATE, ALTER, DROP, TRUNCATE, RENAME
- Table structure modification
- Database design principles

### ✅ Constraints Implementation
- All 7 major constraints practical use
- Data integrity maintenance
- Real-world business rules application

### ✅ System Commands Proficiency
- Database metadata access
- Table structure analysis
- Professional debugging techniques

### ✅ Best Practices Learned
- Proper data types selection
- Constraints for data quality
- Naming conventions
- Performance considerations
