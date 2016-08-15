-- Schema: Recycling firm

-- Calculate the cash balance of each buy-back center for the database with money transactions being recorded not more than once a day.
-- Result set: point, balance.

WITH aux_table AS (
  SELECT income_o.point point, sum(inc) bal
  FROM income_o
  GROUP BY income_o.point

  UNION

  SELECT outcome_o.point, -sum(out)
  FROM outcome_o
  GROUP BY outcome_o.point
)

SELECT point, sum(bal) AS balance
FROM aux_table
GROUP BY point