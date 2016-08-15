-- Schema: Ships

-- In accordance with the Washington Naval Treaty concluded in the beginning of 1922,
-- it was prohibited to build battle ships with a displacement of more than 35 thousand tons.
-- Get the ships violating this treaty (only consider ships for which the year of launch is known).
-- List the names of the ships.

SELECT name
FROM classes JOIN ships ON classes.class = ships.class
WHERE displacement > 35000 AND type = 'bb' AND launched IS NOT NULL AND launched >= 1922