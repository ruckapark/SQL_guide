use [AdventureWorks]

-- User defined functions
SELECT * FROM [Sales].[SalesTerritory]

-- careful at beginning of function it should be returns
CREATE FUNCTION YTDSALES()
RETURNS MONEY
AS
BEGIN
DECLARE @YTDSALES MONEY
SELECT @YTDSALES = SUM(SALESYTD) FROM [Sales].[SalesTerritory]
RETURN @YTDSALES
END

-- NEED TO RUN THIS ALL TOGETHER, ytdresults isnt STORED
DECLARE @YTDRESULTS AS MONEY
SELECT @YTDRESULTS = dbo.YTDSALES()
PRINT @YTDRESULTS

-- ONLY SUM VALUES MEETING CONDITION
CREATE FUNCTION YTD_GROUP
(@GROUP VARCHAR(50))
RETURNS MONEY
AS
BEGIN
DECLARE @YTDSALES AS MONEY
SELECT @YTDSALES = SUM(SalesYTD) FROM [Sales].[SalesTerritory]
WHERE [GROUP] = @GROUP
RETURN @YTDSALES
END

-- use inline function to calculate sum of sales in one area
DECLARE @RESULTS MONEY
SELECT @RESULTS = dbo.YTD_GROUP('North America')
PRINT @RESULTS


-- function return table results
DROP FUNCTION YTD_GROUP
DROP FUNCTION YTDSALES

CREATE FUNCTION ST_TABVALUED
(@TerritoryID INT)
RETURNS TABLE
AS RETURN
SELECT Name, CountryRegionCode, [Group], SalesYTD
FROM [Sales].[SalesTerritory]
WHERE TerritoryID = @TerritoryID

-- group in brackets so it doesnt assum the syst function
SELECT Name, [Group] FROM dbo.ST_TABVALUED(7)
