1. 
SELECT *
FROM cities
WHERE name LIKE '%ськ';

2.
SELECT *
FROM cities
WHERE name LIKE '%донец%';

3.
SELECT Concat(name, '(' , region , ')')
FROM cities
WHERE population > 100000 
ORDER BY name 

4.
SELECT name, population, population/400000 AS percent
FROM cities
ORDER BY population DESC
LIMIT 10 

5.
SELECT Concat(name, '-', population / 400000 , '%') AS percent
FROM cities
WHERE (population / 400000) >= 0.1
ORDER BY (population / 400000) DESC