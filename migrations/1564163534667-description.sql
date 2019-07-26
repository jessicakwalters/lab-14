-- Create a new table called Bookshelves
Query 1: CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

--Insert in distinct values from books table, column bookshelf
Query 2: INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

--add a new column to books called bookshelf_id
Query 3: ALTER TABLE books ADD COLUMN bookshelf_id INT;

--set bookshelf_id equal to the value of the book.bookshelf id for the bookshelf that matches bookshelf.name
Query 4: UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

--drop bookshelf from books
Query 5: ALTER TABLE books DROP COLUMN bookshelf;

--add foreign key constraint to the bookshelf_id
Query 6: ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);