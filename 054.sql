-- Schema: Ships

-- With a precision of two decimal places, determine the average number of guns for all battleships
-- (including the ones in the Outcomes table).

WITH aux_table AS
(SELECT name, numGuns
 FROM ships JOIN classes ON classes.class = ships.class
 WHERE type = 'bb'

 UNION

 SELECT ship, numGuns
 FROM outcomes JOIN classes ON classes.class = outcomes.ship
 WHERE type = 'bb')

SELECT cast(avg(numGuns * 1.0) AS NUMERIC(3, 2))
FROM aux_table
