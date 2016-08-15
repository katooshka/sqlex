-- Schema: Ships

-- For classes having irreparable combat losses and at least three ships in the database,
-- display the name of the class and the number of ships sunk.


WITH ship_classes AS (
  SELECT classes.class class, name ship_name
  FROM classes JOIN ships ON classes.class = ships.class
  UNION
  SELECT classes.class, ship
  FROM classes JOIN outcomes ON classes.class = outcomes.ship
), sunk_ships AS (
  SELECT class, ship_name
  FROM ship_classes JOIN outcomes ON outcomes.ship = ship_classes.ship_name
  WHERE result = 'sunk'
)

SELECT class, count(ship_name)
FROM sunk_ships
GROUP BY class
HAVING class IN (
  SELECT class
  FROM ship_classes
  GROUP BY class
  HAVING count(ship_name) >= 3
)