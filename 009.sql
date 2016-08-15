-- Schema: Computer firm

-- Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker.

SELECT DISTINCT maker
FROM product
  JOIN pc
    ON product.model = pc.model
WHERE speed >= 450