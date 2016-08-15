-- Schema: Ships

-- Find the ships that "survived for future battles";
-- that is, after being damaged in a battle, they participated in another one, which occurred later.

SELECT DISTINCT outcomes.ship
FROM outcomes JOIN battles ON outcomes.battle = battles.name
WHERE result = 'damaged' AND exists(
    SELECT ship
    FROM outcomes future_outcomes JOIN battles future_battles ON future_outcomes.battle = future_battles.name
    WHERE outcomes.ship = future_outcomes.ship AND future_battles.date > battles.date
)

