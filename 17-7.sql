use libraries;
create database libraries;

create table Authors(
ID int primary key identity(1,1),
FirstName varchar(50),
lastName varchar(50)
);
create table Categoryies(
ID int primary key identity(1,1),
categoryName varchar(50),
);
create table Books(
ID int primary key identity(1,1),
Title VARCHAR(100),
PublishedYear INT,
 CopiesAvailable INT,
AuthorID int,
categoryID int ,
foreign key(AuthorID) References Authors(ID),
foreign key(categoryID) References Categoryies(ID)
);



create table CategoryiesBook(
categoryID int ,
bookID int,
foreign key(categoryID) References Categoryies(ID),
foreign key(bookID) References Books(ID)
);
create table  Sections (
    SectionID INT PRIMARY KEY IDENTITY(1,1),
    SectionName VARCHAR(30) NOT NULL
);

create table Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthYear INT,
    Position VARCHAR(50),
	section_id int ,
	foreign key (section_id) references sections(SectionID)
);

 
    create table Users (
    ID INT PRIMARY KEY,
    Username VARCHAR(50),
    Name VARCHAR(50),
    BirthDate DATE,
    Email VARCHAR(100)
);

 CREATE TABLE BorrowingRecords (
    ID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(ID),
    FOREIGN KEY (BookID) REFERENCES Books(ID)
);

 INSERT INTO Authors (ID, FirstName, LastName, )
VALUES
    (1, 'George', 'Orwell'),
    (2, 'Jane', 'Austen'),
    (3, 'Harper', 'Lee'),
    (4, 'J.K.', 'Rowling'),
    (5, 'Ernest', 'Hemingway');

 INSERT INTO Sections (SectionName)
VALUES
    ('Fiction'),
    ('Non-Fiction'),
    ('Science Fiction'),
    ('History'),
    ('Biography');

 INSERT INTO Categoryies(ID, CategoryName)
VALUES
    (1, 'Classic Literature'),
    (2, 'Science Fiction'),
    (3, 'History'),
    (4, 'Biography'),
    (5, 'Fantasy');

 INSERT INTO Books (ID, Title, AuthorID, PublishedYear, CopiesAvailable, CategoryID)
VALUES
    (1, '1984', 1, 1949, 10, 1),
    (2, 'Pride and Prejudice', 2, 1813, 8, 1),
    (3, 'To Kill a Mockingbird', 3, 1960, 12, 1),
    (4, 'Harry Potter and the Philosopher''s Stone', 4, 1997, 15, 5),
    (5, 'The Old Man and the Sea', 5, 1952, 6, 2);
 INSERT INTO Employees (EmployeeID, FirstName, LastName, BirthYear, Position, section_id)
VALUES
    (1, 'John', 'Doe', 1985, 'Librarian', 1),
    (2, 'Jane', 'Smith', 1990, 'Assistant Librarian', 2),
    (3, 'Michael', 'Johnson', 1980, 'Manager', 3),
    (4, 'Emily', 'Brown', 1988, 'Clerk', 4),
    (5, 'David', 'Williams', 1995, 'Assistant', 5);

 INSERT INTO Users (ID, Username, Name, BirthDate, Email)
VALUES
    (1, 'user1', 'Alice Johnson', '1990-05-15', 'alice@example.com'),
    (2, 'user2', 'Bob Smith', '1988-09-20', 'bob@example.com'),
    (3, 'user3', 'Emma Davis', '1995-03-10', 'emma@example.com'),
    (4, 'user4', 'James Wilson', '1985-11-25', 'james@example.com'),
    (5, 'user5', 'Sophia Brown', '1992-07-03', 'sophia@example.com');
 INSERT INTO BorrowingRecords (UserID, BookID, BorrowDate, ReturnDate)
VALUES
    (1, 1, '2023-01-05', '2023-01-15'),
    (2, 3, '2023-02-10', '2023-02-25'),
    (3, 4, '2023-03-15', NULL),
    (4, 2, '2023-04-20', '2023-05-05'),
    (5, 5, '2023-06-01', '2023-06-15');

	
SELECT b.Title, a.FirstName, a.LastName
FROM Books b
INNER JOIN Authors a ON b.AuthorID = a.ID;

SELECT b.Title, a.FirstName, a.LastName
FROM Books b
LEFT JOIN Authors a ON b.AuthorID = a.ID;

SELECT b.Title, a.FirstName, a.LastName
FROM Books b
RIGHT JOIN Authors a ON b.AuthorID = a.ID;

 SELECT b.Title, a.FirstName, a.LastName
FROM Books b
FULL OUTER JOIN Authors a ON b.AuthorID = a.ID;