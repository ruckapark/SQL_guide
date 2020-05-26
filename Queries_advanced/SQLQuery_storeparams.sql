use [AdventureWorks]

-- stored procedures are cached, so this will be more efficient
-- stored in programmibility (SQL already has tons)

-- BASIC PROC TO CALL THE WHOLE TABLE
CREATE PROCEDURE MYTESTPROC
AS
SET NOCOUNT ON
SELECT * FROM [HumanResources].[Shift]

-- EVERYONE COULD USE THIS THE STORED PROC IS OPEN SECURITY WISE
EXECUTE MYTESTPROC

-- SET NOCOUNT OFF
CREATE PROCEDURE MYTESTPROC_cnt
AS
SET NOCOUNT OFF
SELECT * FROM [HumanResources].[Shift]

EXEC MYTESTPROC
-- ONLY DIFFERENCE IS IT OUTPUTS HOW MANY ROWS HAVE BEEN AFFECTED
EXEC MYTESTPROC_cnt

-- LETS CREATE A PARAMETERISED STORED PROC
CREATE PROCEDURE MyFirstParamProc
@Param_Name VARCHAR(50)
AS
SET NOCOUNT ON
SELECT * FROM [HumanResources].[Shift]
WHERE Name = @Param_Name

-- use it
EXEC MyFirstParamProc @Param_Name = 'Day'
EXEC MyFirstParamProc 'Day'

-- be careful not @ vars if there are multiple it has to be in the correct order
-- lets handle the no input error (people make mistakes!)
EXEC MyFirstParamProc -- gives error

-- DELETE IT
DROP PROC MyFirstParamProc

CREATE PROCEDURE MyFirstParamProc
@Param_Name VARCHAR(50) = 'Evening'
AS
SET NOCOUNT ON
SELECT * FROM [HumanResources].[Shift]
WHERE Name = @Param_Name

-- no error now
exec MyFirstParamProc

-- OUTPUT PARAMS
CREATE PROC MyOutputSP
@TopShift varchar(50) OUTPUT
AS
SET @TopShift = (SELECT TOP(1) ShiftID FROM [HumanResources].[Shift])

-- MAKE A VAR CALLED OUTPUT RESULT AND ASSIGN IT WITH THE SP
DECLARE @outputresult VARCHAR(50)
EXEC MyOutputSP @outputresult output
SELECT @outputresult
-- CANT THEN CALL OUTPUT RESULT LATER THOUGH

DROP PROC MyOutputSP

-- RETURNING VALUES FROM SP
CREATE PROC MyFirstReturnSP
AS
RETURN 12

DECLARE @RETURNVAL INT
EXEC @RETURNVAL = MyFirstReturnSP
SELECT @RETURNVAL