-- Schema: Ships

--  With a precision of two decimal places, determine the average number of guns for the battleship classes.

SELECT cast(avg(numGuns * 1.0) AS NUMERIC(4, 2))
FROM classes
WHERE type = 'bb'
