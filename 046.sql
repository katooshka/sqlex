-- Schema: Ships

-- For each ship that participated in the Battle of Guadalcanal, get its name, displacement, and the number of guns.

SELECT name, displacement, numGuns
FROM ships JOIN classes ON classes.class = ships.class
WHERE name IN (
  SELECT ship
  FROM outcomes
  WHERE battle = 'Guadalcanal'
)

UNION ALL

SELECT DISTINCT ship, displacement, numGuns
FROM outcomes LEFT JOIN classes ON classes.class = outcomes.ship
WHERE ship IN (
  SELECT ship
  FROM outcomes
  WHERE battle = 'Guadalcanal'
) AND ship NOT IN (
  SELECT name
  FROM ships
)