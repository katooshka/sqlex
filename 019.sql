-- Schema: Computer firm

-- For each maker having models in the Laptop table, find out the average screen size of the laptops he produces.
-- Result set: maker, average screen size.

SELECT DISTINCT maker, avg(screen)
FROM product JOIN laptop ON product.model = laptop.model
GROUP BY maker