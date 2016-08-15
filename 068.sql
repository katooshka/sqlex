-- Schema: Airport

-- Determine number of routes which are served by the greatest number of flights (trips).
-- Notes.
-- 1) A - B and B - A are to be considered the SAME route.
-- 2) Use only Trip table

WITH double_trips AS (
  SELECT town_from t1, town_to t2
  FROM Trip
  UNION ALL
  SELECT town_to t1, town_from t2
  FROM Trip
), pairs_count AS (
    SELECT t1, t2, count(*) c
    FROM double_trips
    GROUP BY t1, t2
)
SELECT count(*) / 2
FROM pairs_count
WHERE c = (
  SELECT max(c)
  FROM pairs_count
)
