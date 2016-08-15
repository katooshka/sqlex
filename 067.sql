-- Schema: Airport

-- Determine number of routes which are served by the greatest number of flights (trips).
-- Notes.
-- 1) A - B and B - A are to be considered as DIFFERENT routes.
-- 2) Use only Trip table

WITH aux_table AS (
    SELECT town_from, town_to, count(town_from + town_to) routes_number
    FROM trip
    GROUP BY town_from, town_to
)

SELECT count(routes_number)
FROM aux_table
WHERE routes_number = (
  SELECT max(routes_number)
  FROM aux_table
)
