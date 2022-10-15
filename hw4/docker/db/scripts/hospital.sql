create schema public;

comment on schema public is 'standard public schema';

alter schema public owner to padjal;

grant create, usage on schema public to public;

create table if not exists patients
(
    number  integer not null
        constraint patients_pk
            primary key,
    name    varchar,
    disease varchar
);

alter table patients
    owner to padjal;

create table if not exists rooms
(
    number integer not null
        constraint rooms_pk
            primary key,
    beds   integer
);

alter table rooms
    owner to padjal;

create table if not exists stations
(
    number integer not null
        constraint stations_pk
            primary key,
    name   varchar
);

alter table stations
    owner to padjal;

create table if not exists station_personell
(
    number integer not null
        constraint station_personell_pk
            primary key,
    name   varchar
);

alter table station_personell
    owner to padjal;

create table if not exists doctors
(
    personell_number integer
        constraint doctors_personell_fk
            references station_personell (personal_number),
    area             varchar,
    rank             varchar
);

alter table doctors
    owner to padjal;

create table if not exists treats
(
    personell_number integer
        constraint treats_doctor_fk
            references station_personell (personal_number),
    patient_number   integer
        constraint treats_patient_fk
            references patients
);

alter table treats
    owner to padjal;

create table if not exists works_for
(
    personell_number integer
        constraint works_for_personell_fk
            references station_personell,
    station_number   integer
        constraint works_for_station_fk
            references stations
);

alter table works_for
    owner to padjal;

create table if not exists admission
(
    patient_number integer
        constraint admission_patient_fk
            references patients,
    "to"           varchar,
    "from"         varchar,
    room_number    integer
        constraint admission_room_fk
            references rooms
);

alter table admission
    owner to padjal;

