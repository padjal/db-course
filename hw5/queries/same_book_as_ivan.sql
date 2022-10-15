SELECT book_isbn
FROM borrow b JOIN readers r on b.reader_id = r.id
WHERE r.name <> 'Иван' AND r.surname <> 'Иванов'
INTERSECT
SELECT book_isbn
FROM borrow b JOIN readers r on b.reader_id = r.id
WHERE r.name = 'Иван' AND r.surname = 'Иванов'