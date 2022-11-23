create table public.participation_olympiad
(
    olympiad_id integer
        constraint participation_olympiad_olympiad_fk
            references public.olympiads (olympiad_id),
    athlete_id  integer
        constraint participation_olympiad_athlete_fk
            references public.athletes (athlete_id)
);

