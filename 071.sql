-- Schema: Computer firm

-- Find all the PC makers who have all their models of PC type in the PC table.

SELECT DISTINCT maker
FROM Product
WHERE type = 'PC'

EXCEPT

SELECT DISTINCT maker
FROM Product
WHERE type = 'PC' AND model NOT IN (
  SELECT model
  FROM PC
)