-- Schema: Ships

-- For ship classes with a gun caliber of 16 in. or more, display the class and the country.

SELECT class, country
FROM classes
WHERE bore >= 16