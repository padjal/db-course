insert into readers (id, surname, name, address, birthday)
values (default, 'Petrov', 'Vasili', 'Moscow', '7-23-1989');

select id
from readers
where name = 'Vasili' and surname = 'Petrov';

insert into books (isbn, year, name, author, number_of_pages)
values ('123456', 2007, 'Just another book', 'James Hyper', 456);

insert into borrow (reader_id, book_isbn, return_date)
values (749, '123456', '8-23-2022');