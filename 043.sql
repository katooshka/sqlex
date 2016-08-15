-- Schema: Ships

-- Get the battles that occurred in years when no ships were launched into water.

SELECT name
FROM battles
WHERE datepart(YYYY, date) NOT IN (
  SELECT launched
  FROM ships
  WHERE launched IS NOT NULL
)
