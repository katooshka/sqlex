-- Schema: Ships

-- Determine the names of all ships in the Ships table that can be a Japanese battleship
-- having at least nine main guns with a caliber of less than 19 inches and a displacement of not more than 65 000 tons.

SELECT name
FROM ships JOIN classes ON ships.class = classes.class
WHERE (type = 'bb' OR type IS NULL) AND
      (country = 'Japan' OR country IS NULL) AND
      (numGuns >= 9 OR numGuns IS NULL) AND
      (bore < 19 OR bore IS NULL) AND
      (displacement <= 65000 OR displacement IS NULL)
