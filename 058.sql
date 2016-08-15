-- Schema: Computer firm

-- For each product type and maker in the Product table, find out, with a precision of two decimal places,
-- the percentage ratio of the number of models of the actual type produced by the actual maker
-- to the total number of models by this maker.
-- Result set: maker, product type, the percentage ratio mentioned above.

WITH counts AS
(
    SELECT q.maker, q.type, q.cm2, w.cm1, (100 / cm1) * cm2 prc
    FROM (
           SELECT maker, count(model) * 1.0 cm1
           FROM product
           GROUP BY maker
         ) w
      JOIN (
             SELECT maker, type, count(model) * 1.0 cm2
             FROM product
             GROUP BY maker, type
           ) q
        ON q.maker = w.maker
)

SELECT e.maker, r.type, CAST(COALESCE(prc, 0) AS NUMERIC(10, 2))
FROM (
       SELECT DISTINCT maker
       FROM product
     ) e
  CROSS JOIN (
               SELECT DISTINCT type
               FROM product
             ) r
  LEFT JOIN counts ON e.maker = counts.maker AND r.type = counts.type