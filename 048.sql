-- Schema: Ships

-- Find the ship classes having at least one ship sunk in battles.

WITH sunk_ships AS (
    SELECT name, class
    FROM ships JOIN outcomes ON ships.name = outcomes.ship
    WHERE result = 'sunk'
)

SELECT classes.class
FROM classes JOIN sunk_ships ON classes.class = sunk_ships.class

UNION

SELECT class
FROM classes JOIN outcomes ON classes.class = outcomes.ship
WHERE result = 'sunk'
