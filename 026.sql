-- Schema: Computer firm

-- Find out the average price of PCs and laptops produced by maker A.
-- Result set: one overall average price for all items.

WITH table_ AS (
  SELECT price
  FROM pc
    JOIN product
      ON pc.model = product.model
  WHERE maker = 'A'

  UNION ALL

  SELECT price
  FROM laptop
    JOIN product
      ON laptop.model = product.model
  WHERE maker = 'A'
)

SELECT avg(price)
FROM table_