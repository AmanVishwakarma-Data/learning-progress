# 📊 Database Concepts Mastered - Complete Summary

## 🔑 DATABASE KEYS

### 1. Primary Key
- Table ki main identity
- Unique + Not Null
- Best when system-generated
- **Example:** `student_id`

### 2. Unique Key  
- Duplicate values allowed nahi
- Null values allowed
- **Example:** `email`

### 3. Foreign Key
- Do tables ko connect karti hai
- Always "many" side mein lagti hai
- **Example:** `student.dept_id → department.dept_id`

### 4. Candidate Key
- Sabhi keys jo primary key ban sakti hain
- **Example:** email, phone, aadhar_no

### 5. Alternate Key
- Candidate keys mein se primary key ko chodkar baki sab
- **Example:** Primary = aadhar, Alternate = email, phone

### 6. Composite Key
- 2 ya zyada columns milkar unique identity banate hain
- **Example:** (student_id + subject_id)

### 7. Super Key
- Koi bhi combination jo uniquely identify kar de
- **Example:** (aadhar_no), (aadhar_no + name)

### 8. Surrogate Key
- System-generated key
- Real world se koi relation nahi
- **Example:** `id INT AUTO_INCREMENT`

## 🔗 RELATIONSHIPS & CARDINALITY

### Cardinality Types:
- **1:1** → Ek se Ek (Aadmi–Passport)
- **1:N** → Ek se Kai (Customer–Orders)  
- **N:1** → Kai se Ek (Students–Department)
- **M:N** → Kai se Kai (Students–Courses)

### Crow's Foot Notation:
- `|` = One
- `<` = Many

### Relationship Rules:
1. 1:N → FK always "many side" mein
2. M:N → Join table mandatory
3. Relationship real-world logic se decide hota hai

## 📊 ER DIAGRAM (Entity Relationship Diagram)

### ERD Elements:
- **Entity** → Table
- **Attribute** → Column  
- **Relationship** → Tables connection
- **Cardinality** → Relationship strength

### ERD Building Rules:
1. Real-world objects → Entities
2. Related details → Attributes
3. Primary key pehle decide karo
4. Relationship real life se identify karo
5. Cardinality decide karo (1:1, 1:N, M:N)
6. M:N → Join Table banao
7. FK always "many side" mein
8. Duplicate data avoid karo
9. Pehle relations likho → phir diagram banao

## 🏫 SCHOOL MANAGEMENT ERD EXAMPLE

### Entities:
- Student
- Teacher  
- Department
- Course
- Enrollment
- Attendance
- Timetable

### Relationships:
- Student–Department = N:1
- Teacher–Department = N:1
- Teacher–Course = 1:N
- Student–Course = M:N (via Enrollment)
- Student–Attendance = 1:N
- Course–Timetable = 1:N

## ❌ COMMON MISTAKES TO AVOID
- M:N ko direct connect karna ❌
- FK wrong side mein lagana ❌
- Attribute ko entity banana ❌
- Duplicate columns rakhna ❌
- Primary key nahi choose karna ❌

## ✅ WHAT I MASTERED
- ERD basics and advanced concepts
- All types of database keys
- Relationship types and cardinality
- Foreign key placement rules
- Professional database design
- Real project-style ERD creation
