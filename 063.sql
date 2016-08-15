-- Schema: Airport

-- Find the names of different passengers that ever travelled more than once occupying seats with the same number.

WITH aux_table AS (
    SELECT id_psg, count(place) places
    FROM (
           SELECT id_psg, place, count(place) places
           FROM pass_in_trip
           GROUP BY id_psg, place
           HAVING count(place) > 1
         ) t
    GROUP BY id_psg
)

SELECT name
FROM aux_table JOIN passenger ON passenger.id_psg = aux_table.id_psg




