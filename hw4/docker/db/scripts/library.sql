create database library
    with owner padjal;

create table if not exists books
(
    isbn            varchar not null,
    number          integer not null,
    row             integer,
    year            integer,
    name            varchar,
    author          varchar,
    number_of_pages integer,
    constraint books_pk
        primary key (isbn, number)
);

alter table books
    owner to padjal;

create table if not exists libraries
(
    id integer not null
        constraint libraries_pk
            primary key
);

alter table libraries
    owner to padjal;

create table if not exists categories
(
    category_name   varchar not null
        constraint categories_pk
            primary key,
    parent_category varchar
);

alter table categories
    owner to padjal;

create table if not exists stores
(
    book_number   integer,
    book_isbn     varchar,
    library_id    integer,
    category_name varchar
        constraint stores_category_fk
            references categories
);

alter table stores
    owner to padjal;

create table if not exists readers
(
    id       integer not null
        constraint readers_pk
            primary key,
    surname  varchar,
    name     varchar,
    address  varchar,
    birthday date
);

alter table readers
    owner to padjal;

create table if not exists borrow
(
    reader_id   integer,
    book_number integer,
    book_isbn   varchar,
    constraint borrow_book_fk
        foreign key (book_number, book_isbn) references books (number, isbn)
);

alter table borrow
    owner to padjal;

create table if not exists publishers
(
    name    varchar not null,
    address varchar not null,
    constraint publishers_pk
        primary key (name, address)
);

alter table publishers
    owner to padjal;

create table if not exists publishes
(
    publisher_name    varchar,
    publisher_address varchar,
    book_isbn         varchar,
    book_number       integer,
    constraint publishes_book_fk
        foreign key (book_isbn, book_number) references books,
    constraint publishes_publisher_fk
        foreign key (publisher_name, publisher_address) references publishers
);

alter table publishes
    owner to padjal;

