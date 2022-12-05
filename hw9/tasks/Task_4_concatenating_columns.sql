-- add table names
create table names(
    id int primary key,
    prefix varchar(3),
    first varchar(30),
    last varchar(30),
    suffix varchar(3)
);

select (select prefix
from names where id = 1) || ' ' || (select first from names where id = 1) || ' ' || (select last from names where id = 1) || ' ' || (select suffix from names where id = 1) title;