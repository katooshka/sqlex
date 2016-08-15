-- Schema: Computer firm

-- Find the printer models having the highest price. Result set: model, price.

SELECT model, price
FROM printer
WHERE price = (
  SELECT max(price)
  FROM printer
)
