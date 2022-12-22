create table if not exists halls
(
    number      integer not null
        constraint halls_pk
            primary key,
    capacity    integer,
    screen_type varchar
);

create table if not exists movies
(
    name         varchar not null
        constraint movies_pk
            primary key,
    year         integer,
    age_category varchar(1),
    length_mins  integer,
    category     varchar,
    director     varchar,
    country      varchar(3)
);

create table if not exists projections
(
    start_time    timestamp,
    movie_name    varchar
        constraint projections_movies_null_fk
            references movies,
    hall          integer,
    projection_id integer not null
        constraint projections_pk
            primary key,
    end_time      timestamp
);

create table if not exists seats
(
    number integer not null,
    hall   integer not null
        constraint seats_halls_null_fk
            references halls,
    type   varchar,
    constraint seats_pk
        primary key (hall, number)
);

create table if not exists users
(
    id      integer not null
        constraint users_pk
            primary key,
    name    varchar,
    surname varchar,
    age     integer,
    email   varchar
);

create table if not exists transactions
(
    id             integer generated always as identity (minvalue 100)
        constraint transactions_pk
            primary key,
    amount         double precision,
    user_id        integer
        constraint transactions_users_null_fk
            references users,
    timestamp      timestamp,
    payment_method varchar
);

create table if not exists bookings
(
    projection_id     integer,
    id                integer generated always as identity (minvalue 100)
        constraint bookings_pk
            primary key,
    user_id           integer
        constraint bookings_users_null_fk
            references users,
    status            integer,
    number_of_tickets integer,
    transaction_id    integer
        constraint bookings_transactions_null_fk
            references transactions,
    time              timestamp
);

comment on column bookings.status is 'enum';

comment on column bookings.transaction_id is 'Booking is only complete after transaction is complete';

create table if not exists projection_seats
(
    id            integer generated always as identity (minvalue 100)
        constraint projection_seats_pk
            primary key,
    hall          integer,
    number        integer,
    projection_id integer
        constraint projection_seats_schedule_null_fk
            references projections,
    is_booked     boolean,
    price         integer,
    booking_id    integer
        constraint projection_seats_bookings_null_fk
            references bookings,
    constraint projection_seats_seats_null_null_fk
        foreign key (hall, number) references seats
);

