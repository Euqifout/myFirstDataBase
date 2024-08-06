CREATE TABLE "Authors" (
	"author_Id"	INTEGER NOT NULL,
	"F_Name"	varchar(100) NOT NULL,
	"L_Name"	varchar(255) NOT NULL,
	"Nationality"	TEXT CHECK("Nationality" IN ("South Africa", "American", "Namibia", "Congo", "Malawi")),
	PRIMARY KEY("author_Id" AUTOINCREMENT)
);

CREATE TABLE "Books" (
	"Book_ID"	INTEGER NOT NULL UNIQUE,
	"Author"	VARCHAR(50),
	"Description"	VARCHAR(50),
	"An_Author"	INTEGER NOT NULL,
	PRIMARY KEY("Book_ID" AUTOINCREMENT),
	FOREIGN KEY("An_Author") REFERENCES "Authors"("author_Id")
);

INSERT INTO "Authors" ("author_Id", "F_Name", "L_Name", "Nationality") VALUES
(1, 'Lerato', 'Kgwedi', 'American'),
(2, 'Toufique', 'Mahlangu', 'South Africa'),
(3, 'Oarabile', 'Brown', 'Namibia'),
(4, 'Nkateko', 'Green', 'Congo'),
(5, 'Dineo', 'CK', 'Malawi');

INSERT INTO "Books" ("Book_ID", "Author", "Description", "An_Author") VALUES
(1, 'Lerato Kgwedi', 'Fiction', 1),
(2, 'Toufique Mahlangu', 'Non-Fiction', 2),
(3, 'Oarabile Brown', 'Science Fiction', 3),
(4, 'Nkateko Green', 'Fantasy', 4),
(5, 'Dineo CK', 'Historical', 5);