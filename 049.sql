-- Schema: Ships

-- Find the names of the ships having a gun caliber of 16 inches (including ships in the Outcomes table).

SELECT name
FROM ships JOIN classes ON classes.class = ships.class
WHERE bore = 16

UNION

SELECT ship
FROM outcomes JOIN classes ON classes.class = outcomes.ship
WHERE bore = 16
