-- Schema: Ships

-- List the names of lead ships in the database (including the Outcomes table).

SELECT classes.class
FROM classes JOIN ships ON classes.class = ships.class
WHERE classes.class = name

UNION

SELECT ship
FROM classes JOIN outcomes ON classes.class = outcomes.ship
