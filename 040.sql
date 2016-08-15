-- Schema: Ships

-- For the ships in the Ships table that have at least 10 guns, get the class, name, and country.

SELECT classes.class, name, country
FROM ships JOIN classes ON classes.class = ships.class
WHERE numGuns >= 10
