-- Schema: Computer firm

-- Get the makers who produce only one product type and more than one model. Output: maker, type.

SELECT DISTINCT maker, type
FROM product
WHERE maker IN (
  SELECT maker
  FROM product
  GROUP BY maker
  HAVING count(DISTINCT model) > 1 AND count(DISTINCT type) = 1
)
