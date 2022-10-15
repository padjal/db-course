SELECT r.surname, r.name
FROM readers r JOIN borrow b on r.id = b.reader_id
WHERE book_isbn IN(
    SELECT book_isbn
    FROM borrow b JOIN readers r on b.reader_id = r.id
    WHERE r.name <> 'Иван' AND r.surname <> 'Иванов'
    INTERSECT
    SELECT book_isbn
    FROM borrow b JOIN readers r on b.reader_id = r.id
    WHERE r.name = 'Иван' AND r.surname = 'Иванов'
    )

