-- Create base table

-- BOOKS table
--	 	book_id	  - ID of book (primary key)
--		title 	  - title of book
--		category  - book's category
--		author	  - book's author
CREATE TABLE IF NOT EXISTS t_books
(
    book_id   INT          NOT NULL,
    title     VARCHAR(100) NOT NULL,
    category  VARCHAR(30),
    author    VARCHAR(100) NOT NULL,
    is_active VARCHAR(1)   NOT NULL,
    CONSTRAINT t_books_id_pk PRIMARY KEY (book_id)
);

-- insert base data
INSERT INTO t_books
SELECT ROWNUM,
       SUBSTR(o.object_name, 1, 100),
       SUBSTR(o.object_type, 1, 30),
       SUBSTR(o.owner, 1, 100),
       (case when MOD(ROWNUM, 2) = 0 then 'Y' else 'N' end)
FROM all_objects o
WHERE ROWNUM <= 150000;

UPDATE t_books
SET title     = 'Oracle Core',
    category  = 'Oracle Database',
    author    = 'Jonathan Lewis',
    is_active = 'Y'
WHERE book_id = 3001;

UPDATE t_books
SET title     = 'Expert Oracle Database Architecture',
    category  = 'Oracle Database',
    author    = 'Tom Kyte',
    is_active = 'Y'
WHERE book_id = 2025;

UPDATE t_books
SET title     = 'SQL and Relational Theory',
    category  = 'Relational Databases',
    author    = 'C.J. Date',
    is_active = 'Y'
WHERE book_id = 190;