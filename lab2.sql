1. 
SELECT *
FROM cities
WHERE population > 1000000

2.
SELECT *
FROM cities
WHERE region IN ('E', 'W')
ORDER BY population DESC

3.
SELECT *
FROM cities
WHERE region IN ('S', 'C', 'N') and population > 50000

4.
SELECT *
FROM cities
WHERE region IN ('E', 'W', 'N') and population > 150000 and population < 350000
LIMIT 20

5.
SELECT *
FROM cities
WHERE NOT region = 'E' and NOT region = 'W'
ORDER BY population DESC
LIMIT 10 OFFSET 10