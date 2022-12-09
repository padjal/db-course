-- Task 3
analyse verbose t_books;

-- Task 4
create index if not exists t_books_title_idx on t_books using gin (to_tsvector('english', title));

-- Task 5
explain analyse
select *
from t_books
where title ilike '%expert%';

-- Task 6
drop index t_books_title_idx;

-- Task 7
create table t_lookup
(
    item_key   varchar(10) primary key not null,
    item_value varchar(100)
);

-- Task 8

-- Task 9

-- Task 10
create table if not exists t_lookup_iot (
    item_key   varchar(10) primary key not null,
    item_value varchar(100)
);

insert into t_lookup_iot
select * from t_lookup;

cluster t_lookup_iot using t_lookup_iot_pkey;

-- Task 12
analyse verbose t_lookup;
analyse verbose t_lookup_iot;

-- Task 13
explain analyse
select * from t_lookup
where item_key = '455';

-- Task 14
explain analyse
select * from t_lookup_iot
where item_key = '455';

-- Task 15
create index t_lookup_value_idx on t_lookup (item_value);

-- Task 16
create index t_lookup_iot_value_idx on t_lookup_iot (item_value);

-- Task 17
explain analyse
select * from t_lookup
where item_value = 'T_BOOKS';

-- Task 18
explain analyse
select * from t_lookup_iot
where item_value = 'T_BOOKS';

-- Task 19
create table if not exists t_example_iot (
    item_key   varchar(10) primary key not null,
    item_value varchar(100)
);

insert into t_example_iot
select * from t_lookup;

cluster t_example_iot using t_example_iot_pkey;

-- Task 20
create table if not exists t_example_hash (
    item_key   varchar(10) primary key not null,
    item_value varchar(100)
);

insert into t_example_hash
select * from t_lookup;

create index if not exists t_example_hash_value_idx on t_example_hash using hash(item_value);


