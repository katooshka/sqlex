-- Schema: Ships

-- For each class, find out the number of ships of this class that were sunk in battles.
-- Result set: class, number of ships sunk.

WITH aux_table AS (
  SELECT classes.class, name ship_name, result
  FROM ships RIGHT JOIN classes ON classes.class = ships.class JOIN outcomes ON ships.name = outcomes.ship

  UNION

  SELECT classes.class, ship, result
  FROM classes LEFT JOIN outcomes ON classes.class = outcomes.ship
)

SELECT classes.class, sum(sunk_ships)
FROM
  (SELECT classes.class, count(result) sunk_ships
   FROM aux_table
   WHERE result = 'sunk'
   GROUP BY class

   UNION

   SELECT class, 0
   FROM aux_table
  ) t
GROUP BY class
