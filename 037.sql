-- Schema: Ships

-- Find classes for which only one ship exists in the database (including the Outcomes table).

WITH class_table AS (
  SELECT classes.class, count(name) AS col
  FROM classes JOIN ships ON classes.class = ships.class
  GROUP BY classes.class

  UNION ALL

  SELECT class, count(DISTINCT ship) AS col
  FROM outcomes JOIN classes ON classes.class = outcomes.ship
  WHERE ship NOT IN (
    SELECT name
    FROM ships
  )
  GROUP BY classes.class
)

SELECT class_table
FROM table_
GROUP BY class
HAVING sum(col) = 1
