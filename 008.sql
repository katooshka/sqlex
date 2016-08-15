-- Schema: Computer firm

-- Find the makers producing PCs but not laptops.

SELECT DISTINCT maker
FROM product
WHERE type = 'pc'

EXCEPT

SELECT DISTINCT maker
FROM product
WHERE type = 'laptop'