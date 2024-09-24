1. 
SELECT name, UPPER(name) AS upper_name
FROM cities
ORDER BY name
LIMIT 5 OFFSET 5

2.
SELECT name, CHAR_LENGTH(name) AS LENGTH_name
FROM cities
WHERE CHAR_LENGTH(name) NOT BETWEEN 8 AND 10

3.
SELECT region, SUM(population) AS sum
FROM cities
WHERE region IN('S', 'C')
GROUP BY region;

4.
SELECT region, AVG(population) AS middle
FROM cities
WHERE region IN('W')

5.
SELECT region, COUNT(name) AS count
FROM cities
WHERE region IN('E')
