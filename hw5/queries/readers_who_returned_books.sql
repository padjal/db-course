SELECT r.surname, r.name
FROM borrow b JOIN readers r on b.reader_id = r.id
WHERE b.return_date <= CURRENT_DATE