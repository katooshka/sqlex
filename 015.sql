-- Schema: Computer firm

-- Get hard drive capacities that are identical for two or more PCs.
-- Result set: hd.

SELECT hd
FROM pc
GROUP BY hd
HAVING count(model) >= 2