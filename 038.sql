-- Schema: Ships

-- Find countries that ever had classes of both battleships (‘bb’) and cruisers (‘bc’).

SELECT country
FROM classes
WHERE type = 'bb'

INTERSECT

SELECT country
FROM classes
WHERE type = 'bc'
