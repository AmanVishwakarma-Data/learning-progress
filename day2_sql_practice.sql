CREATE DATABASE school_managment;
USE school_managment;

-- Student Table
CREATE TABLE student_details (
    student_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    student_name VARCHAR(21) NOT NULL,
    student_email VARCHAR(50) NOT NULL UNIQUE,
    student_phone VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO student_details (student_id, student_name, student_email, student_phone)
VALUES (1, "Aman", "aman@gmail.com", 99190167);

SELECT * FROM student_details;

INSERT INTO student_details (student_id, student_name, student_email, student_phone)
VALUES 
(2, "Ram", "ram@gmail.com", 9026721781),
(3, "Ayush", "ayush@gmail.com", 8790878091);

SELECT * FROM student_details;
SELECT student_id, student_name FROM student_details;

-- Teacher Table
CREATE TABLE teacher_details (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    teacher_name VARCHAR(50) NOT NULL,
    teacher_salary DECIMAL(10,2) DEFAULT 0.00
);

INSERT INTO teacher_details (teacher_id, teacher_name, teacher_salary)
VALUES 
(1, "Mohan", 12310.96),
(2, "Rohan", 131.9017);

SELECT * FROM teacher_details;

-- Join Table (Many-to-Many)
CREATE TABLE student_teacher (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    teacher_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student_details(student_id) ON DELETE CASCADE,
    FOREIGN KEY (teacher_id) REFERENCES teacher_details(teacher_id) ON DELETE CASCADE,
    UNIQUE unique_student_teacher(student_id, teacher_id)
);

INSERT INTO student_teacher (student_id, teacher_id) VALUES
(1, 2),
(1, 1),
(2, 1);

SELECT * FROM student_teacher;

-- JOIN Queries
SELECT s.student_name, t.teacher_name
FROM student_teacher st
JOIN student_details s ON st.student_id = s.student_id
JOIN teacher_details t ON st.teacher_id = t.teacher_id
WHERE s.student_name = "Aman";

SELECT s.student_id, s.student_name, s.student_phone, t.teacher_name
FROM student_details s
JOIN student_teacher st ON s.student_id = st.student_id
JOIN teacher_details t ON t.teacher_id = st.teacher_id;

-- Aggregate & Filter
SELECT COUNT(student_id) FROM student_details;

SELECT teacher_name, teacher_salary FROM teacher_details;

SELECT student_phone FROM student_details WHERE student_name = "Aman";

SELECT student_phone FROM student_details WHERE student_name LIKE "Aman%";

SELECT s.student_name, t.teacher_name
FROM student_teacher st 
JOIN student_details s ON s.student_id = st.student_id
JOIN teacher_details t ON t.teacher_id = st.teacher_id
WHERE s.student_name = "Aman";

SELECT t.teacher_name, s.student_name
FROM teacher_details t
JOIN student_teacher st ON st.teacher_id = t.teacher_id
JOIN student_details s ON st.student_id = s.student_id
WHERE t.teacher_name = "Mohan";
