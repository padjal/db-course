create table if not exists games
(
    game_id       integer generated always as identity
        constraint games_pk
            primary key,
    name          varchar(40) not null,
    type          varchar(40),
    players       integer,
    duration_mins integer,
    description   varchar,
    image_link    varchar
);

create table if not exists events
(
    event_id       integer generated always as identity
        constraint events_pk
            primary key,
    game_id        integer not null
        constraint events_games_null_fk
            references games
            on update cascade on delete cascade,
    start_date     date,
    start_time     date,
    address        varchar,
    geocoordinates point,
    players_level  varchar
);

create table if not exists players
(
    player_id integer generated always as identity
        constraint players_pk
            primary key,
    username  varchar(20) not null,
    password  varchar(30) not null,
    level     varchar     not null
);

create table if not exists friends
(
    player1_id integer not null
        constraint friends_player1_fk
            references players,
    player2_id integer not null
        constraint friends_player2_fk
            references players
);

create table if not exists player_games_collection
(
    player_id integer not null
        constraint games_collection_player_fk
            references players,
    game_id   integer not null
        constraint games_collection_game_fk
            references games
);

create table if not exists events_log
(
    event_id      integer not null
        constraint events_log_event_fk
            references events,
    has_occured   boolean not null,
    duration_mins integer
);

create table if not exists event_winner
(
    event_id  integer
        constraint event_winner_event_fk
            references events,
    player_id integer
        constraint event_winner_player_fk
            references players
);


