-- Schema: Computer firm

-- Find out the average hard disk drive capacity of PCs produced by makers who also manufacture printers.
-- Result set: maker, average HDD capacity.

SELECT maker, avg(hd)
FROM pc JOIN product ON pc.model = product.model
GROUP BY maker
HAVING maker IN (
  SELECT maker
  FROM product
  WHERE type = 'Printer'
)


