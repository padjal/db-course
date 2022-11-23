create table if not exists olympiads
(
    olympiad_id integer generated always as identity
        constraint olympiads_pk
            primary key,
    year        integer,
    city        varchar(20),
    season      varchar(1),
    country     varchar(3)
);

create table if not exists events
(
    event_id   integer generated always as identity
        constraint events_pk
            primary key,
    sport_name varchar(50),
    event_name varchar(50),
    venue      varchar(30),
    date       date,
    time       time
);

create table if not exists teams
(
    team_id integer generated always as identity
        constraint teams_pk
            primary key,
    name    varchar(50),
    country varchar(3),
    sport   varchar(50)
);

create table if not exists athletes
(
    athlete_id             integer generated always as identity
        constraint athletes_pk
            primary key,
    name                   varchar(40),
    gender                 varchar(10),
    country                varchar(3),
    birthdate              date,
    olympic_certificate_id integer,
    team_id                integer
        constraint athletes_team_fk
            references teams
);

comment on table athletes is 'Preserves data about athletes.';

comment on column athletes.team_id is 'If null, player is playing an individual sport.';

create table if not exists games
(
    game_id          integer not null,
    type_of_athletes varchar(50),
    event_id         integer
        constraint games_event_fk
            references events
);

create table if not exists participants_in_events
(
    event_id   integer not null
        constraint participants_in_events_event_fk
            references events,
    athlete_id integer
        constraint participants_in_events_athlete_fk
            references athletes
);

create table if not exists event_results
(
    event_id          integer
        constraint event_results_event_fk
            references events,
    participant_id    integer,
    participant_place integer
);

