-- Task 2
explain analyse select *
from t_books
where title = 'Oracle Core';

-- Task 3
CREATE INDEX IF NOT EXISTS t_books_title_idx ON t_books using btree
    (title);

create index if not exists t_books_active_idx on t_books using btree (
                                                                      is_active
    );

-- Task 4
select schemaname, tablename, indexname, tablespace, indexdef
from pg_indexes;

-- Task 5 - gather statistics
select * from pg_stats where tablename = 't_books';

-- Task 6 -
explain analyse select *
from t_books
where title = 'Oracle Core';

-- Task 7
explain analyse select *
from t_books
where book_id = 18;

-- Task 8
explain analyse select *
from t_books
where is_active = 'Y';

-- Task 9
select (select count(*) from t_books) rows,
                     (select count(distinct title) from t_books) distinct_titles,
(select count(distinct category) from t_books) distinct_categories,
(select count(distinct author) from t_books) distinct_authors;

--Task 10
drop index t_books_active_idx;

drop index t_books_title_idx;

--
