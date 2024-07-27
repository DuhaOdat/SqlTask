-- Students Table
CREATE TABLE Students (
    ID INT PRIMARY KEY identity(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Address VARCHAR(255)
   
);

-- Family_Info Table
CREATE TABLE Family_Info (
    ID INT PRIMARY KEY identity(1,1),
    Student_Id INT UNIQUE FOREIGN KEY REFERENCES Students(ID),
    FatherName VARCHAR(50),
    FatherContact VARCHAR(50)
);

-- Courses Table
CREATE TABLE Courses (
    ID INT PRIMARY KEY identity(1,1),
    CourseName VARCHAR(100),
    Description VARCHAR(255),
    Resource VARCHAR(255)
    
);

-- Classes Table
CREATE TABLE Classes (
    ID INT PRIMARY KEY identity(1,1),
    ClassCode VARCHAR(50),
    RoomNumber VARCHAR(50),
    Schedule VARCHAR(255)
    
);

-- Assignments Table
CREATE TABLE Assignments (
    ID INT PRIMARY KEY identity(1,1),
    CourseID INT FOREIGN KEY REFERENCES Courses(ID),
    AssignmentName VARCHAR(100),
    Description VARCHAR(255),
    DueDate DATE,
    State VARCHAR(50) -- pass, failed
   
);

-- Attendance Table
CREATE TABLE Attendance (
    ID INT PRIMARY KEY identity(1,1),
    StudentID INT FOREIGN KEY REFERENCES Students(ID),
    ClassID INT FOREIGN KEY REFERENCES Classes(ID),
    AttendanceDate DATE,
    TypeOfAbsence NVARCHAR(50), -- leaving, absence, late
    Reason VARCHAR(255)
  
);

-- StudentAssignments Table
CREATE TABLE StudentAssignments (
    ID INT PRIMARY KEY identity(1,1),
    StudentID INT FOREIGN KEY REFERENCES Students(ID),
    AssignmentID INT FOREIGN KEY REFERENCES Assignments(ID)
);

-- CourseClasses Table
CREATE TABLE CourseClasses (
   ID INT PRIMARY KEY identity(1,1),
    CourseID INT FOREIGN KEY REFERENCES Courses(ID),
    ClassID INT FOREIGN KEY REFERENCES Classes(ID)
);

INSERT INTO Students (
FirstName, LastName, DateOfBirth, Address)
VALUES 
( 'Duha', 'Mahmoud', '1996-04-15', 'Irbid'),
( 'Tuleep', 'Ahmed', '2006-04-18', 'Irbid'),
( 'Bashar', 'Aysar', '2007-12-01', 'Amman'),
( 'luna', 'wallid', '2005-11-21', 'Ajlun'),
( 'Emad', 'Husain', '1996-01-20', 'Mafraq');


INSERT INTO Family_Info( Student_Id, FatherName, FatherContact)
VALUES 
(1,'Mahmoud','0775689745'),
(5,'Husain','0124697587');

INSERT INTO Courses ( CourseName, Description, Resource)
VALUES 
('Math', 'Basic principles of mathematics', 'Math Textbook'),
('Science', 'Introduction to science', 'Science Workbook'),
( 'History', 'World history overview', 'History Notes'),
('English', 'English language and literature', 'English Textbook'),
( 'Art', 'Fundamentals of art and design', 'Art Supplies');

INSERT INTO Assignments ( CourseID, AssignmentName, Description, DueDate, State)
VALUES 
( 1, 'Math Homework 1', 'Chapter 1 exercises', '2024-09-15', 'pass'),
( 2, 'Science Project', 'Research on plants', '2024-09-20', 'failed'),
(3, 'History Essay', 'World War II analysis', '2024-09-25', 'pass'),
( 4, 'English Book Report', 'Read and report on a novel', '2024-09-30', 'pass'),
( 5, 'Art Portfolio', 'Create a portfolio of drawings', '2024-10-05', 'failed');

INSERT INTO Classes ( ClassCode, RoomNumber, Schedule)
VALUES 
('MATH101', 'Room 1', ' 8:00-9:00'),
( 'SCI201', 'Room 2', '10:00-11:30'),
('HIST301', 'Room 3', '9:00-10:00'),
( 'ENG101', 'Room 4', ' 8:00-9:30'),
('ART101', 'Room 5', '10:00-11:00');


INSERT INTO Attendance ( StudentID, ClassID, AttendanceDate, TypeOfAbsence, Reason)
VALUES 
( 1, 1, '2024-07-20', 'absence', 'Sick'),
( 2, 2, '2024-07-21', 'late', 'Traffic'),
( 3, 3, '2024-07-22', 'leaving', 'Family emergency'),
( 4, 4, '2024-07-23', 'absence', 'Doctor appointment'),
( 5, 5, '2024-07-24', 'late', 'Overslept');

INSERT INTO StudentAssignments ( StudentID, AssignmentID)
VALUES 
( 1, 1),
( 2, 2),
( 3, 3),
( 4, 4),
( 5, 5);


INSERT INTO CourseClasses ( CourseID, ClassID)
VALUES 
( 1, 1),
( 2, 2),
( 3, 3),
( 4, 4),
( 5, 5);

--1- Select students in a specific Date date ?
select Students.FirstName, Students.LastName
from Students
where Students.DateOfBirth='1996-04-15';

--2- Select details of a course by its name ? 
select *
from Courses
where Courses.CourseName='Math';

--3-Add a new column 'Email' to the Students table ?

 Alter table Students
 add  Email varchar(255);

--4- Insert a new student record ?
Insert Into Students(FirstName,LastName,DateOfBirth,Address,Email)
values
('yousef','Mahmoud','1998-03-10','Ajlun','yousef@gmail.com');

select * from Students

--5- Select students who have relatives listed in the system ? 
 select Students.FirstName,Students.LastName
 from Students
 join Family_Info
 on Students.ID=Family_Info.Student_Id;

 --6- Select students who are enrolled in a specific course (e.g : Math) ? 
 select Students.FirstName,Students.LastName,Courses.CourseName
 from Students
 join StudentAssignments
 on Students.ID=StudentAssignments.StudentID
 join Courses
 on StudentAssignments.StudentID=Courses.ID
 where Courses.CourseName='Art';

 --7- Select students who have submitted and passed a specific assignment (e.g : sql  Assignment ) ? 
 select Students.FirstName,Students.LastName
 from Students
 join StudentAssignments on Students.ID=StudentAssignments.StudentID
 JOIN Assignments on StudentAssignments.AssignmentID=Assignments.ID
 where Assignments.AssignmentName= 'Math Homework 1' And Assignments.State='Pass';

 --8- i need the student who tooke an leaving between last sunday and the Thursday ? (e.g: between this date : 1/1/2024 - 5/1/2024 )
 SELECT DISTINCT Students.ID, Students.FirstName, Students.LastName
FROM Students 
JOIN Attendance  ON Students.ID = Attendance.StudentID
WHERE Attendance.TypeOfAbsence = 'leaving'
  AND Attendance.AttendanceDate BETWEEN '2024-07-20' AND '2024-07-22';

--9- i need the names of students who have absence more than 4 ? ( not late of leaving )
  SELECT Students.ID, Students .FirstName, Students .LastName
FROM Students 
JOIN Attendance  ON Students .ID = Attendance.StudentID
WHERE Attendance.TypeOfAbsence NOT IN ('late', 'leaving')
GROUP BY Students .ID, Students .FirstName,Students .LastName
HAVING COUNT(Attendance.ID) > 4;
