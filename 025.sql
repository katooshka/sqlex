-- Schema: Computer firm

-- Find the printer makers also producing PCs with the lowest RAM capacity and the highest processor speed of all PCs having the lowest RAM capacity.
-- Result set: maker.

WITH min_ram_pc AS
(SELECT model, ram, speed
 FROM pc
 WHERE ram = (
   SELECT min(ram)
   FROM pc
 )
)

SELECT DISTINCT maker
FROM min_ram_pc JOIN product ON product.model = min_ram_pc.model
WHERE ram = (
  SELECT min(ram)
  FROM min_ram_pc
) AND speed = (
  SELECT max(speed)
  FROM min_ram_pc
) AND maker IN (
  SELECT maker
  FROM product
  WHERE type = 'printer'
)