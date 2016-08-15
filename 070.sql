-- Schema: Ships

-- Point out the battles in which at least three ships from the same country took part.

SELECT DISTINCT battle
FROM (
       SELECT battle, country
       FROM (
              SELECT battle, country, ship
              FROM Outcomes
                INNER JOIN Classes ON ship = class

              UNION

              SELECT battle, country, ship
              FROM Outcomes o
                INNER JOIN Ships s ON o.ship = s.name
                INNER JOIN Classes c ON s.class = c.class
            ) x
       GROUP BY battle, country
       HAVING COUNT(country) >= 3
     ) y
