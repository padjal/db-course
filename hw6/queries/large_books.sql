select name, number_of_pages
from books
where number_of_pages > 2*(
    select avg(number_of_pages)
    from books
    )