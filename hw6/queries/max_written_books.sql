select author author, count(author) written_books
from books
group by author
having count(author) = (select max(awb.written_books)
                        from (select author author, count(author) written_books
                              from books
                              group by author
                              order by count(author) desc) as awb)
