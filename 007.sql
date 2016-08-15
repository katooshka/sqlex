-- Schema: Computer firm

-- Find out the models and prices for all the products (of any type) produced by maker B.

SELECT DISTINCT product.model, price
FROM product JOIN pc ON product.model = pc.model
WHERE maker = 'B'

UNION ALL

SELECT DISTINCT product.model, price
FROM product JOIN laptop ON product.model = laptop.model
WHERE maker = 'B'

UNION ALL

SELECT DISTINCT product.model, price
FROM product JOIN printer ON product.model = printer.model
WHERE maker = 'B'