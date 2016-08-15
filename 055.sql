-- Schema: Ships

-- For each class, determine the year the first ship of this class was launched.
-- If the lead ship’s year of launch is not known, get the minimum year of launch for the ships of this class.
-- Result set: class, year.

WITH aux_table AS
(SELECT classes.class, launched
 FROM classes LEFT JOIN ships ON classes.class = ships.class)

SELECT classes.class, min(launched)
FROM aux_table
GROUP BY class
