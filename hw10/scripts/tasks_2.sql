
--Task 1
-- Connect to db

--Task 2
--Run creation script

--Task 3 - Gather stats
select * from pg_stats where tablename = 't_books';
--No results yielded from this
select * from pg_stats where tablename = 't_books_local_part1';
select * from pg_stats where tablename = 't_books_local_part2';
select * from pg_stats where tablename = 't_books_local_part3';
select * from pg_stats where tablename = 't_books_local_part4';

--Task 4
explain  analyse select * from t_books_part where book_id = 18;

-- Task 5
explain  analyse select * from t_books_part where title = 'Expert Oracle Database Architecture';

--Task 6
create index if not exists t_books_part_local_idx on t_books_part using btree(title);

--Task 7
explain  analyse select * from t_books_part where title = 'Expert Oracle Database Architecture';

--Task 8
drop index if exists t_books_part_local_idx;

select * from pg_indexes;

--Task 9
create index if not exists t_books_part_global_idx on t_books_part using btree(title);

--Task 10
explain  analyse select * from t_books_part where title = 'Expert Oracle Database Architecture';

--Task 11
drop index if exists t_books_part_global_idx;

-- Task 12
create index if not exists t_books_part_idx on t_books_part (book_id);

--Task 13
explain analyse select * from t_books_part where book_id = 11011;

--Task
create index if not exists t_books_active_idx on t_books_part using btree(is_active);

-- Task 15
explain analyse select * from t_books_part where is_active = 'Y';

--Task 16
create index if not exists t_books_author_title_index on t_books_part using btree (author, title);

--Task 17
explain analyse select author, max(title) from t_books_part group by author;

--Task 18
explain analyse select author from t_books_part group by author limit 10;

--Task 19
explain analyse select author, title from t_books_part where starts_with(author, 'T');

--Task 20
insert into t_books_part(book_id, title, category, author, is_active) values (15001, 'Cookbook', null, 'Mr.Hide', 'N')

--Task 21
create index if not exists t_books_cat_idx on t_books_part using btree(category);

--Task 22
explain analyse select author, title from t_books_part where category is null;

--Task 23
drop index if exists t_books_cat_idx;

--Task 24
explain analyse select author, title from t_books_part where category is null;