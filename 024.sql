-- Schema: Computer firm

-- List the models of any type having the highest price of all products present in the database.

WITH new_table AS (
  SELECT model, price
  FROM pc
  WHERE price = (
    SELECT max(price)
    FROM pc
  )

  UNION

  SELECT model, price
  FROM laptop
  WHERE price = (
    SELECT max(price)
    FROM laptop
  )

  UNION

  SELECT model, price
  FROM printer
  WHERE price = (
    SELECT max(price)
    FROM printer
  )
)

SELECT model
FROM new_table
WHERE price = (
  SELECT max(price)
  FROM new_table
)
