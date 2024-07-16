
CREATE DATABASE School;
USE School;
CREATE TABLE Students(
	ID int PRIMARY KEY,
	StudentName varchar (30),
);
CREATE TABLE teachers (  
    ID INT PRIMARY KEY, 
    teacher_name VARCHAR(30)
);
CREATE TABLE teacher_details (  
    ID INT PRIMARY KEY, 
    email VARCHAR(30), 
     phone VARCHAR(15),
    teacher_address VARCHAR(50),   
   teacher_id int foreign key REFERENCES teachers(ID)
);

CREATE TABLE courses ( 
    ID INT PRIMARY KEY,
    course_name VARCHAR(30),
    number_of_students INT,
    teacher_id INT FOREIGN KEY REFERENCES teachers(ID)
);
CREATE TABLE students_courses (
    student_id INT  FOREIGN KEY REFERENCES students(ID), 
    course_id INT FOREIGN KEY REFERENCES courses(Id),
   
    PRIMARY KEY (student_id, course_id)   
);

CREATE TABLE students_teachers (
    student_id INT FOREIGN KEY REFERENCES students(ID), 
    teacher_id INT FOREIGN KEY REFERENCES teachers(ID), 
  
    PRIMARY KEY (student_id, teacher_id)   
);



 INSERT INTO teachers (ID, teacher_name) VALUES 
(1, 'Ali Ahmed'),
(2, 'Mohammed Saleh'),
(3, 'Khaled Abdullah'),
(4, 'Malik Hussein'),
(5, 'Mustafa Mahmoud');

 INSERT INTO teacher_details (ID, email, phone, teacher_address) VALUES 
(1, 'ali.ahmed@example.com', 1234567890, '123 '),
(2, 'mohammed.saleh@example.com', 9876543210, '456  Street'),
(3, 'khaled.abdullah@example.com', 1122334455, '789  Street'),
(4, 'malik.hussein@example.com', 6677889900, '101  Street'),
(5, 'mustafa.mahmoud@example.com', 3344556677, '202  Street');

 INSERT INTO courses (ID, course_name, number_of_students, teacher_id) VALUES 
(1, 'Mathematics', 30, 1),
(2, 'Physics', 25, 2),
(3, 'Chemistry', 20, 3),
(4, 'Biology', 15, 4),
(5, 'Computer Science', 35, 5);

 INSERT INTO students (ID, StudentName) VALUES 
(1, 'Ali Hassan'),
(2, 'Mohammed Ali'),
(3, 'Khaled Youssef'),
(4, 'Malik Ibrahim'),
(5, 'Mustafa Omar');

 INSERT INTO students_courses (student_id, course_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);

 INSERT INTO students_teachers (student_id, teacher_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);

