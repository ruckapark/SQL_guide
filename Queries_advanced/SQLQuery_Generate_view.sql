use [AdventureWorks]

SELECT TOP 1000 * FROM [Sales].[SalesTerritory]

-- US VIEW WHERE COUNTRY REGION CODE IS US
CREATE VIEW MyCustomUSView
AS
SELECT * FROM [Sales].[SalesTerritory]
WHERE CountryRegionCode LIKE 'US'

-- JOIN TABLE INTO VIEW
CREATE VIEW NASalesQuota
AS
SELECT [Name], [Group], [SalesQuota], [Bonus]
FROM [Sales].[SalesTerritory] A INNER JOIN [Sales].[SalesPerson] B
on A.TerritoryID = B.TerritoryID
WHERE [Group] LIKE 'North America'

-- LOOK AT THE VIEW - MORE EFFICIENT THAN RECREATING A TABLE
SELECT * FROM NASalesQuota