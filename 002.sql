-- Schema: Computer firm

-- List all printer makers. Result set: maker.

SELECT DISTINCT maker
FROM product
WHERE type = 'printer'
