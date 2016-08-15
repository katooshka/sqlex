-- Schema: Recycling firm

-- For the database with money transactions being recorded not more than once a day,
-- calculate the total cash balance of all buy-back centers at the beginning of 04/15/2001.

WITH aux_table AS (
  SELECT income_o.point, date, sum(inc) balance
  FROM income_o
  GROUP BY income_o.point, date
  HAVING date < '20010415'

  UNION

  SELECT outcome_o.point, date, -sum(out)
  FROM outcome_o
  GROUP BY outcome_o.point, date
  HAVING date < '20010415'
)

SELECT sum(balance)
FROM aux_table