/*
 Напишите запрос на SQL к БД, спроектированной в задании 1, возвращающий таблицу пользователей, а для каждого
 пользователя – количество игр в которых он выиграл, количество состоявшихся мероприятий, которые он создал,
 и количество мероприятий, на которые он записался, но они не состоялись.
 */
SELECT player_id,
       username,
       level,
       (-- Number of games won
           SELECT count(events.event_id)
           FROM events
                    JOIN event_winner ew on events.event_id = ew.event_id
           WHERE ew.player_id = players.player_id) as won_games,
       (-- Event that has occurred
           SELECT count(el.event_id)
           FROM events
                    JOIN events_log el on events.event_id = el.event_id
           WHERE el.has_occured
             AND created_by = players.player_id)   as created_games,
       (-- Number of missed games
           SELECT count(el.event_id)
           FROM event_registration
                    LEFT JOIN events_log el on event_registration.event_id = el.event_id
           WHERE player_id = 1000
             AND el.has_occured <> true)           as registerd_but_not_occured

FROM players;