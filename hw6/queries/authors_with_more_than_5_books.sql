select author, count(*)
from books
group by author
having count(author) > 5
order by count(author) desc