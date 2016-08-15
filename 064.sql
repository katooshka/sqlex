-- Schema: Recycling firm

-- Using the Income and Outcome tables, determine for each buy-back center the days when it received funds
-- but made no payments, and vice versa.
-- Result set: point, date, type of operation (inc/out), sum of money per day.

WITH aux_table AS (
  SELECT income.point, income.date, sum(inc) inc_, sum(out) out_
  FROM income LEFT JOIN outcome ON income.point = outcome.point AND income.date = outcome.date
  GROUP BY income.point, income.date

  UNION ALL

  SELECT outcome.point, outcome.date, sum(inc), sum(out)
  FROM outcome LEFT JOIN income ON income.point = outcome.point AND income.date = outcome.date
  GROUP BY outcome.point, outcome.date

  EXCEPT

  SELECT income.point, income.date, sum(inc), sum(out)
  FROM income JOIN outcome ON income.point = outcome.point AND income.date = outcome.date
  GROUP BY income.point, income.date
)

SELECT point, date, CASE
                    WHEN inc_ IS NULL
                      THEN 'out'
                    ELSE 'inc'
                    END comment, coalesce(inc_, out_)
FROM aux_table
