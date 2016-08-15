-- Schema: Ships

-- One of the characteristics of a ship is one-half the cube of the calibre of its main guns (mw).
-- Determine the average ship mw with an accuracy of two decimal places for each country having ships in the database.

WITH all_ships AS (
  SELECT country, name, power(bore, 3) / 2 mw
  FROM classes JOIN ships ON classes.class = ships.class

  UNION

  SELECT country, ship, power(bore, 3) / 2
  FROM classes JOIN outcomes ON classes.class = outcomes.ship
)

SELECT country, cast(avg(mw) AS NUMERIC(6, 2))
FROM all_ships
GROUP BY country

