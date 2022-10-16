SELECT name, number_of_pages
from books
where number_of_pages = (
    select max(number_of_pages)
    from books
    )