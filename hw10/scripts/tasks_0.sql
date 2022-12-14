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

--Task 11
create index if not exists idx_t_books_title_category on t_books(
                                                                title, category
    );

-- Task 12
explain analyse select * from t_books
where title = 'I''m from the future. I came here in a Time Machine that you invented. Now I need your help to get ba' and category = 'Domainer';

explain analyse select * from t_books
where author = 'Glen Mann' and book_id = 9249;

-- Task 13
explain analyse select *
from t_books
where starts_with(title, 'Relational');

--Task 14
create index if not exists t_books_up_title_idx on t_books(
                                         UPPER(title)
    );

-- Task 15
explain analyse select *
from t_books
where starts_with(title, 'Relational');

-- Task 16
explain analyse select *
from t_books
where position('%Core%' in title) > 0;

--Task 17
drop index idx_t_books_title_category;
drop index t_books_title_idx;

--Task 18
create index if not exists t_books_rev_title_idx on t_books(title desc);

--Task 19
EXPLAIN ANALYZE select * from pg_stat_user_indexes;

--Task 21
create index if not exists t_books_rev_title_idx on t_books(author desc);
