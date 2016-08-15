-- Schema: Airport

-- Among the clients which only use a single company,
-- find the different passengers who have flown the most. Result set: passenger name, number of trips.

WITH aux_table AS (
    SELECT id_psg, count(pass_in_trip.trip_no) trip_num
    FROM trip JOIN pass_in_trip ON trip.trip_no = pass_in_trip.trip_no
    GROUP BY id_psg
    HAVING count(DISTINCT id_comp) = 1
)
SELECT name, trip_num
FROM aux_table JOIN passenger ON aux_table.id_psg = passenger.id_psg
WHERE trip_num = (
  SELECT max(trip_num)
  FROM aux_table
)
