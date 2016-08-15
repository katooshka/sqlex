-- Schema: Ships

-- Find the names of the ships with the largest number of guns among all ships having the same displacement
-- (including ships in the Outcomes table).

WITH aux_table AS (
    SELECT displacement disp, max(numGuns) max_guns_number
    FROM classes
    WHERE class IN (
      SELECT class
      FROM ships
    ) OR class IN (
      SELECT ship
      FROM outcomes
    )
    GROUP BY displacement
)

SELECT name
FROM ships
  JOIN classes ON ships.class = classes.class
  JOIN aux_table ON displacement = disp
WHERE numGuns = max_guns_number

UNION ALL

SELECT DISTINCT ship
FROM outcomes
  JOIN classes ON outcomes.ship = classes.class
  JOIN aux_table ON displacement = disp
WHERE numGuns = max_guns_number AND outcomes.ship NOT IN (
  SELECT name
  FROM ships
)