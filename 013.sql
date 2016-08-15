-- Schema: Computer firm

-- Find out the average speed of the PCs produced by maker A.

SELECT avg(speed)
FROM pc JOIN product ON product.model = pc.model
WHERE maker = 'A'
