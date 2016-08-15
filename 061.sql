-- Schema: Recycling firm

-- For the database with money transactions being recorded not more than once a day,
-- calculate the total cash balance of all buy-back centers.

WITH aux_table AS (
 SELECT sum(inc) money
 FROM income_o

 UNION

 SELECT sum(out) * (-1)
 FROM outcome_o
)

SELECT sum(money)
FROM aux_table
