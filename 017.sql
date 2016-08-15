-- Schema: Computer firm

-- Get the laptop models that have a speed smaller than the speed of any PC.
-- Result set: type, model, speed.

SELECT DISTINCT type, laptop.model, speed
FROM laptop JOIN product ON laptop.model = product.model
WHERE speed < ALL (
  SELECT speed
  FROM pc
)
