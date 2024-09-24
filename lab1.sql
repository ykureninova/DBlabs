1. 
SELECT *
FROM cities
ORDER BY population DESC
LIMIT 10 OFFSET 10

2.
SELECT *
FROM cities
ORDER BY name DESC
LIMIT 30

3.
SELECT *
FROM cities
ORDER BY region ASC, population DESC

4.
SELECT DISTINCT region
FROM cities

5.
SELECT *
FROM cities
ORDER BY region DESC, name DESC