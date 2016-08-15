-- Schema: Computer firm

-- Find the makers of the cheapest color printers.
-- Result set: maker, price.

SELECT DISTINCT maker, price
FROM product JOIN printer ON product.model = printer.model
WHERE color = 'y' AND price = (
  SELECT min(price)
  FROM printer
  WHERE color = 'y'
)
