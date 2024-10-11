1. 
SELECT cities.name AS cityname, regions.name AS regionname, cities.population
FROM cities
INNER JOIN regions ON cities.region = regions.uuid
WHERE cities.population > 350000
ORDER BY cities.population DESC;

2.
SELECT cities.name AS cityname, regions.name AS regionname
FROM cities
INNER JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Nord';
