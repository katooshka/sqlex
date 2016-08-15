-- Schema: Ships

-- Find the battles in which Kongo-class ships from the Ships table were engaged.

SELECT DISTINCT battle
FROM outcomes JOIN ships ON ship = name
WHERE class = 'Kongo'
