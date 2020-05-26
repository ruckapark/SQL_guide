use [AdventureWorks]

-- SQ BRACKETS PUT IN GRID FORMAT
SELECT * FROM [Sales].[SalesTerritory]

-- SYNTAX FOR SIMPLE TRANSACTION. ONLY PERM IF IT WORKS
BEGIN TRANSACTION
	UPDATE [Sales].[SalesTerritory]
	SET CostYTD = 1.00
	WHERE TerritoryID = 1
COMMIT TRANSACTION

-- LOOK AT SOME SIMPLE ERRORS
--@@ERROR 0 IS A SUCCESS - ABOVE ARE LESS SUCCESSFUL

-- RUN BELOW TRANS TWICE AND SECOND TIME FAILS
DECLARE @ERRORRESULTS VARCHAR(50)
-- FIND TABLE AND SCRIPT TABLE AS INSERT INTO
-- REPLACE TEMPLATE WITH RANDOM INSERTS
BEGIN TRANSACTION
	INSERT INTO [Sales].[SalesTerritory]
           ([Name]
           ,[CountryRegionCode]
           ,[Group]
           ,[SalesYTD]
           ,[SalesLastYear]
           ,[CostYTD]
           ,[CostLastYear]
           ,[rowguid]
           ,[ModifiedDate])
     VALUES
           ('ABC'
           ,'us'
           ,'na'
           ,1.00
           ,1.00
           ,1.00
           ,1.00
           ,'6DC4165A-5E4C-42F3-809D-4344E0AC75E7'
           ,GETDATE())

SET @ERRORRESULTS = @@ERROR

IF(@ERRORRESULTS = 0)
BEGIN
	PRINT 'SUCCESS'
	COMMIT TRANSACTION
END
ELSE
BEGIN
	PRINT 'STATEMENT FAILED'
	ROLLBACK TRANSACTION
END

-- EVEN AFTER RUNNING TWICE, ONLY ONE ENTRY FROM TRANSACTION AS WE ROLLED BACK SECOND TIME
SELECT * FROM [Sales].[SalesTerritory]

-- SAME TRANSACTION BUT USING A RAISE ERROR
DECLARE @ERRORRESULTS VARCHAR(50)
-- FIND TABLE AND SCRIPT TABLE AS INSERT INTO
-- REPLACE TEMPLATE WITH RANDOM INSERTS
BEGIN TRANSACTION
	INSERT INTO [Sales].[SalesTerritory]
           ([Name]
           ,[CountryRegionCode]
           ,[Group]
           ,[SalesYTD]
           ,[SalesLastYear]
           ,[CostYTD]
           ,[CostLastYear]
           ,[rowguid]
           ,[ModifiedDate])
     VALUES
           ('ABC'
           ,'us'
           ,'na'
           ,1.00
           ,1.00
           ,1.00
           ,1.00
           ,'6DC4165A-5E4C-42F3-809D-4344E0AC75E7'
           ,GETDATE())

SET @ERRORRESULTS = @@ERROR

IF(@ERRORRESULTS = 0)
BEGIN
	PRINT 'SUCCESS'
	COMMIT TRANSACTION
END
ELSE
BEGIN
	RAISERROR('STATEMENT FAILED- CUSTOM MESSAGE', 16, 1)
	ROLLBACK TRANSACTION
END

-- USED LEVELS AND STATES AS THREE PARAMETERS FOR MORE DETAILED ERROR MESSAGE


-- TRY AND CATCH METHODS (SOMETIMES WE KNOW HOW TO HANDLE A CERTAIN ERROR AND WON'T WANT SOMEONE TO SEE THEIR ERROR
BEGIN TRY
BEGIN TRANSACTION
DECLARE @ERRORRESULTS VARCHAR(50)
BEGIN TRANSACTION
	INSERT INTO [Sales].[SalesTerritory]
           ([Name]
           ,[CountryRegionCode]
           ,[Group]
           ,[SalesYTD]
           ,[SalesLastYear]
           ,[CostYTD]
           ,[CostLastYear]
           ,[rowguid]
           ,[ModifiedDate])
     VALUES
           ('ABC'
           ,'us'
           ,'na'
           ,1.00
           ,1.00
           ,1.00
           ,1.00
           ,'6DC4165A-5E4C-42F3-809D-4344E0AC75E7'
           ,GETDATE())

COMMIT TRANSACTION
END TRY
--THIS TIME THERE WILL BE NO ERROR AS WE HANDLED IT IN THE CATCH...
BEGIN CATCH
	PRINT 'CATCH STATEMENT ENTERED'
	ROLLBACK TRANSACTION
END CATCH

-- DEADLOCKS ARE IF TWO PEOPLE ARE TRYING TO ACCESS RESOURCES, RESOLVING MECHANISMS CAN RESOLVE THEM