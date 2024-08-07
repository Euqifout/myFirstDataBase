-- Using SQLite, Toufique Mahlangu
-- Created two tables.
-- One to store author info 
CREATE TABLE "Authors" (
	"author_Id"	INTEGER NOT NULL,
	"F_Name"	varchar(100) NOT NULL,
	"L_Name"	varchar(255) NOT NULL,
	"Nationality"	TEXT CHECK("Nationality" IN ("South Africa", "American", "Namibia", "Congo", "Malawi")),
	PRIMARY KEY("author_Id" AUTOINCREMENT)
);

-- Another to store Book info 
CREATE TABLE "Books" (
	"Book_ID"	INTEGER NOT NULL UNIQUE,
	"Title"	VARCHAR(50),
	"Author"	VARCHAR(50),
	"Description"	VARCHAR(255),
	"An_Author"	INTEGER NOT NULL,
	PRIMARY KEY("Book_ID" AUTOINCREMENT),
	FOREIGN KEY("An_Author") REFERENCES "Authors"("author_Id")
);

-- Populated the authors table with test data
INSERT INTO "Authors" ("author_Id", "F_Name", "L_Name", "Nationality") VALUES
(1, 'Lerato', 'Kgwedi', 'American'),
(2, 'Toufique', 'Mahlangu', 'South Africa'),
(3, 'Oarabile', 'Brown', 'Namibia'),
(4, 'Nkateko', 'Green', 'Congo'),
(5, 'Dineo', 'CK', 'Malawi');


-- Populated the books table with test data
INSERT INTO "Books" ("Title", "Author", "Description", "An_Author") VALUES
('Clean Code', 'Lerato Kgwedi', 'A Handbook of Agile Software Craftsmanship', 1),
('The Pragmatic Programmer','Toufique Mahlangu', 'Your Journey to Mastery', 2),
('Design Patterns', 'Oarabile Brown', 'Elements of Reusable Object-Oriented Software', 3),
('Introduction to the Theory of Computation', 'Nkateko Green', 'Introduction to the theory of computation', 4),
('Artificial Intelligence', 'Dineo CK', 'A Modern Approach', 5),
('Structure and Interpretation of Computer Programs', 'Lerato Kgwedi', 'Scheme programming language. It', 1),
('Code Complete', 'Toufique Mahlangu', 'A Practical Handbook of Software Construction', 2),
('Operating System Concepts', 'Oarabile Brown', 'Fundamental concepts of operating systems,', 3),
('Computer Networks', 'Nkateko Green', 'A detailed introduction to computer networks', 4),
('Introduction to Algorithms', 'Dineo CK', 'Cide range of algorithms, including sorting, searching, graph algorithms, and dynamic programming', 5),
('JS: ES6 & Beyond', 'Lerato Kgwedi', 'The latest version of the JavaScript language', 1),
('Python Crash Course', 'Toufique Mahlangu', 'A Hands-On, Project-Based Introduction to Programming;', 2),
('Deep Learning', 'Oarabile Brown', 'neural networks, optimization algorithms, and various deep learning architectures.', 3), 
('The Art of Computer Programming', 'Nkateko Green', 'Covers a wide range of algorithms and data structure', 4),
('Eloquent JavaScript', 'Toufique Mahlangu', 'Focus on writing elegant and efficient code. ', 2);


SELECT COUNT(*) AS total_books
FROM Books;

-- Getting the author with the most books.
SELECT Author, COUNT(*) AS book_count
FROM Books
GROUP BY Author
ORDER BY book_count DESC
LIMIT 1;

-- Another way of getting the author with the most books.
SELECT A.F_Name, A.L_Name, COUNT(B.An_Author) as BookCount
FROM Authors A
JOIN Books B ON A.author_Id = B.An_Author
GROUP BY A.author_Id, A.F_Name, A.L_Name
ORDER BY BookCount DESC 
LIMIT 1;

-- counting the number of books published per country and ranking them from lowest to highest.
SELECT a.Nationality, COUNT(b.Book_ID) AS book_count
FROM Books b
JOIN Authors a ON b.An_Author = a.author_Id
GROUP BY a.Nationality
ORDER BY book_count ASC;

-- Collecting all authors and total books of those authors and ranking them from highest to lowest.
SELECT B.Author, COUNT(B.An_Author) as BookCount
FROM Authors A , Books B
WHERE  A.author_Id = B.An_Author
GROUP BY A.author_Id, A.F_Name, A.L_Name
ORDER BY bookCount DESC;




