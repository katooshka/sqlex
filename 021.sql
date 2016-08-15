-- Schema: Computer firm

-- Find out the maximum PC price for each maker having models in the PC table. Result set: maker, maximum price.

SELECT maker, max(price)
FROM pc JOIN product ON product.model = pc.model
GROUP BY maker
