create database postgres
    with owner padjal;

create table if not exists cities
(
    name   varchar not null,
    region varchar not null,
    constraint city_pk
        primary key (name, region)
);

alter table cities
    owner to padjal;

create table if not exists stations
(
    name   varchar not null
        constraint stations_pk
            primary key,
    tracks integer
);

alter table stations
    owner to padjal;

create table if not exists trains
(
    number           integer not null
        constraint trains_pk
            primary key,
    number_of_wagons integer
);

alter table trains
    owner to padjal;

create table if not exists lie_in
(
    city_region  varchar,
    city_name    varchar,
    station_name varchar
        constraint lie_in_station_fk
            references stations,
    constraint lie_in_city_fk
        foreign key (city_name, city_region) references cities
);

alter table lie_in
    owner to padjal;

create table if not exists ends
(
    station_name varchar
        constraint ends_station_fk
            references stations,
    train_number integer
        constraint ends_train_fk
            references trains
);

alter table ends
    owner to padjal;

create table if not exists starts
(
    station_name varchar
        constraint starts_station_fk
            references stations,
    train_number integer
        constraint starts_train_fk
            references trains
);

alter table starts
    owner to padjal;

create table if not exists connected
(
    station_from_name varchar
        constraint connected_station_from_fk
            references stations,
    station_to_name   varchar
        constraint connected_station_to_fk
            references stations,
    departure         date,
    arrival           date,
    train_number      integer
        constraint connected_train_fk
            references trains
);

alter table connected
    owner to padjal;

