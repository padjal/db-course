SELECT *
FROM books
WHERE isbn in (
    SELECT book_isbn
    FROM borrow
    WHERE reader_id = (
        SELECT id
        FROM readers
        WHERE name like 'Иван' AND surname LIKE 'Иванов'
        )
    );