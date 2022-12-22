-- Check data in all the tables
select * from bookings limit 10;
select * from halls limit 10;
select * from movies limit 10;
select * from projection_seats limit 10;
select * from projections limit 10;
select * from seats limit 10;
select * from transactions limit 10;
select * from users limit 10;

--Users being able to see available projections in the next week
select projection_id, movie_name, director, year, category, age_category, country ,start_time, hall
from projections p
join movies m on m.name = p.movie_name
where p.start_time > now() and p.start_time < now() + interval '1 week';

-- See all available seats for a projection
select * from projection_seats
where projection_id = 54 and is_booked = false;

--Book tickets
update projection_seats
set is_booked = false
where projection_id = 54
and id in (10875, 10876);

--Make payment
insert into transactions(amount, user_id, timestamp, payment_method)
values (40, 614, now(), 'cash');

--Log booking
insert into bookings (projection_id, user_id, status, number_of_tickets, transaction_id, time)
values (54, 614, 2, 2, 199, now());
