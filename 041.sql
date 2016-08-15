-- Schema: Computer firm

-- For the PC in the PC table with the maximum code value, obtain all its characteristics (except for the code) and display them in two columns:
-- - name of the characteristic (title of the corresponding column in the PC table);
-- - its respective value.

WITH new_table AS (
    SELECT *
    FROM pc
    WHERE code = (
      SELECT max(code)
      FROM pc)
)

SELECT 'model' AS characteristic, CAST(model AS VARCHAR(30)) AS value
FROM new_table

UNION ALL

SELECT 'speed', CAST(speed AS VARCHAR(30))
FROM new_table

UNION ALL

SELECT 'ram', CAST(ram AS VARCHAR(30))
FROM new_table

UNION ALL

SELECT 'hd', CAST(hd AS VARCHAR(30))
FROM new_table

UNION ALL

SELECT 'price', CAST(price AS VARCHAR(30))
FROM new_table

UNION ALL

SELECT 'cd', CAST(cd AS VARCHAR(30))
FROM new_table
