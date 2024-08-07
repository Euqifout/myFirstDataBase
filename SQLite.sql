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
	"Description"	VARCHAR(50),
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
INSERT INTO "Books" ("Book_ID", "Title", "Author", "Description", "An_Author") VALUES
(1, 'Book One', 'Lerato Kgwedi', 'Description One', 1),
(2, 'Book Two', 'Toufique Mahlangu', 'Description Two', 2),
(3, 'Book Three', 'Oarabile Brown', 'Description Three', 3),
(4, 'Book Four', 'Nkateko Green', 'Description Four', 4),
(5, 'Book Five', 'Dineo CK', 'Description Five', 5),
(6, 'Book Six', 'Lerato Kgwedi', 'Description Six', 1),
(7, 'Book Seven', 'Toufique Mahlangu', 'Description Seven', 2),
(8, 'Book Eight', 'Oarabile Brown', 'Description Eight', 3),
(9, 'Book Nine', 'Nkateko Green', 'Description Nine', 4),
(10, 'Book Ten', 'Dineo CK', 'Description Ten', 5),
(11, 'Book Eleven', 'Lerato Kgwedi', 'Description Eleven', 1),
(12, 'Book Twelve', 'Toufique Mahlangu', 'Description Twelve', 2),
(13, 'Book Thirteen', 'Oarabile Brown', 'Description Thirteen', 3), 
(14, 'Book Fourteen', 'Nkateko Green', 'Description Fourteen', 4),
(15, 'Book Fifteen', 'Toufique Mahlangu', 'Description Fifteen', 2);

-- Counting the number of rows, books in the books table.
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




