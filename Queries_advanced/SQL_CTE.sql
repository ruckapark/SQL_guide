
use [AdventureWorks]

SELECT * FROM [Sales].[SalesTerritory]

-- END CTE IN SEMICOLON
WITH CTE_SALESTERR
AS
(
	SELECT Name, CountryRegionCode FROM [Sales].[SalesTerritory]
)

SELECT * FROM CTE_SALESTERR
WHERE NAME LIKE 'NORTH%';

-- THESE ARE GREAT TO BREAK DOWN LONG QUERIES INTO MULTIPLE CTES


-- GROUP BY
SELECT * FROM [Sales].[SalesTerritory]
-- GIVE ALL NAMES AND SUM OF SALESYTD

SELECT NAME, SUM(SALESYTD)
FROM [Sales].[SalesTerritory]
GROUP BY Name

-- now we want slightly different
SELECT NAME, CountryRegionCode, SUM(SALESYTD) as sums
FROM [Sales].[SalesTerritory]
GROUP BY Name, CountryRegionCode

-- what if we want to join the tables.
-- here we can give grouping sets.
SELECT Name, CountryRegionCode, [Group], SUM(SALESYTD)
FROM [Sales].[SalesTerritory]
GROUP BY GROUPING SETS
(
	(Name),
	(Name, CountryRegionCode),
	(Name, CountryRegionCode,[Group])
)
-- this didn't need a UNION of the commands, it was able to figure things out.
-- we see in the table, the three groups

-- ROLLUP CLAUSE gives the master and drops one if not possible
SELECT Name, CountryRegionCode, [Group], SUM(SalesYTD)
FROM [SALES].[SalesTerritory]
GROUP BY ROLLUP
-- GIVE LIKE A MASTER
(
	(Name, CountryRegionCode, [Group])
)

-- USE A CUBE TO GET ALL THE COMBINATIONS
SELECT Name, CountryRegionCode, [Group], SUM(SalesYTD)
FROM [SALES].[SalesTerritory]
GROUP BY CUBE
(
	(Name, CountryRegionCode, [Group])
)