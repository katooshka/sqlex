-- Schema: Recycling firm

-- Under the assumption that receipts of money (inc) and payouts (out) are registered not more than once a day for each collection point [i.e. the primary key consists of (point, date)], write a query displaying cash flow data (point, date, income, expense).
-- Use Income_o and Outcome_o tables.

SELECT coalesce(income_o.point, outcome_o.point), coalesce(income_o.date, outcome_o.date), inc, out
FROM income_o FULL JOIN outcome_o ON income_o.date = outcome_o.date AND income_o.point = outcome_o.point
