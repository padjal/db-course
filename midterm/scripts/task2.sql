/* [2 балла] Напишите запрос на SQL к БД, спроектированной в задании 1, возвращающий таблицу игр на заданную дату,
   в которых еще есть свободные места.
 */
SELECT DISTINCT g.name,
                g.description,
                g.players - (select count(player_id)
                             from event_registration
                             where event_id = 1) as remaining_players
FROM events
         Join games g on g.game_id = events.game_id
WHERE start_date = '2022-11-07'
  AND (
          -- How many people are registered already for this event
          select count(player_id)
          from event_registration
          where event_id = 1) < g.players;