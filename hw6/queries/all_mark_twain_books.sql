
-- how many mark twain books has each taken

select reader_id, count(reader_id)
from borrow
where book_isbn in (
    -- all Mark Twain books
    select isbn
    from books
    where author = 'Mark Twain'
    )
group by reader_id
having count(reader_id) = (
    -- how many mark twain books
select count(mark_twain_books)
from(
    select isbn
        from books
        where author = 'Mark Twain'
) as mark_twain_books
    );

-- how many mark twain books
select count(mark_twain_books)
from(
    select isbn
        from books
        where author = 'Mark Twain'
) as mark_twain_books

-- all Mark Twain books
select isbn
from books
where author = 'Mark Twain'
