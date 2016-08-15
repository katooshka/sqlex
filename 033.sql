-- Schema: Ships

-- Get the ships sunk in the North Atlantic battle.
-- Result set: ship.

SELECT ship
FROM outcomes
WHERE result = 'sunk' AND battle = 'North Atlantic'
