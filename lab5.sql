1. 
SELECT region, SUM(population) AS populationinregion
FROM cities
GROUP BY region;

2.
SELECT region, SUM(population) AS population_in_region, COUNT(name) AS sum_of_cities
FROM cities
GROUP BY region
HAVING COUNT(name) >= 10

3.
SELECT name, population
FROM cities
WHERE region IN (
SELECT region
FROM cities
GROUP BY region
HAVING COUNT(name) >= 5)
ORDER BY population DESC
LIMIT 5 OFFSET 10

4.
SELECT region, SUM(population) AS population_in_regions
FROM cities
GROUP BY region
HAVING SUM(population) > 300000

5.
SELECT name, population
FROM cities
WHERE population NOT between 150000 and 500000
and region IN (SELECT uuid
FROM regions
WHERE area_quantity <= 5)
