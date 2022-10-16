SELECT b.name, p.name
FROM publishes
    join publishers p on p.name = publishes.publisher_name and p.address = publishes.publisher_address
    join books b on b.isbn = publishes.book_isbn
group by b.name, p.name