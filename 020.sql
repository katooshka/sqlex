-- Schema: Computer firm

-- Find the makers producing at least three distinct models of PCs.
-- Result set: maker, number of PC models.

SELECT maker, count(model)
FROM product
WHERE type = 'pc'
GROUP BY maker
HAVING count(model) >= 3
