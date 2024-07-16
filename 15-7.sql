
CREATE DATABASE Library;
Drop database Library;

CREATE TABLE Authors(
ID int  primary key,
FirstName varchar(30),
LastName varchar(30),
BirthYear varchar(30)

);
CREATE TABLE Books(
ID int  primary key,
Title varchar(30),
PublishedYear int,
CopiesAvailable int,
BookCategory varchar(30),
AuthorID int foreign key REFERENCES Authors(ID)
);

INSERT INTO Authors(ID, FirstName, LastName, BirthYear)
VALUES(101, 'Harper', 'Lee', '1926'),
(102, 'George', 'Orwell', '1903'),
(103, 'F. Scott', 'Fitzgerald', '1896'),
(104, 'J.D.', 'Salinger', '1919'),
(105, 'Herman', 'Melville', '1819');

INSERT INTO Books(ID, Title, PublishedYear, CopiesAvailable, BookCategory, AuthorID)
VALUES(1, 'To Kill a Mockingbird', 1960 , 5 , 'Fiction' ,101),
(2, '1984',  1949 , 8 , 'Dystopian',102),
(3, 'The Great Gatsby', 1925, 3 , 'Classic',103),
(4, 'The Catcher in the Rye',1951, 4 ,'Fiction',104),
(5, 'Moby Dick',1851, 6 ,'Adventure', 105);

SELECT * FROM Authors;
SELECT * FROM Books;

SELECT Max(CopiesAvailable)As MaxBook FROM Books ;
SELECT Min(CopiesAvailable)As MinBook FROM Books ;

SELECT AVG(PublishedYear) AS AVGPublishedYear FROM Books ;

SELECT SUM(CopiesAvailable) AS SumCopiesAvailable FROM Books;

TRUNCATE TABLE BOOKS; 
DROP Table Authors;