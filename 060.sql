-- Schema: Recycling firm

-- For the database with money transactions being recorded not more than once a day,
-- calculate the cash balance of each buy-back center at the beginning of 4/15/2001.
-- Note: exclude centers not having any records before the specified date.
-- Result set: point, balance


WITH aux_table AS
(
  SELECT income_o.point point, date, sum(inc) bal
  FROM income_o
  GROUP BY income_o.point, date
  HAVING date < '20010415'

  UNION

  SELECT outcome_o.point, date, -sum(out)
  FROM outcome_o
  GROUP BY outcome_o.point, date
  HAVING date < '20010415'
)

SELECT point, sum(bal)
FROM aux_table
GROUP BY point
