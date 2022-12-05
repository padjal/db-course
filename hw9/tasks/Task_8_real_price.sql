-- create products table
create table if not exists products(
    id int primary key,
    name varchar,
    price float,
    stock int,
    weight_in_grams float,
    producer varchar,
    country varchar
);

select name, weight_in_grams, price, round(((price/products.weight_in_grams * 1000)::numeric), 2) price_per_kilo
from products;