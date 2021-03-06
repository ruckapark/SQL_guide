use [AdventureWorks]

-- working with functions - basic arithmetic and strings

-- MYSALARY
-- AGREGATE FUNCTIONS
SELECT * FROM MYSALARY
SELECT AVG(SALARY) FROM MYSALARY
SELECT COUNT(SALARY) FROM MYSALARY

SELECT COUNT(*) FROM MYSALARY

SELECT SUM(SALARY) FROM MYSALARY
SELECT MAX(SALARY) FROM MYSALARY

-- STRING FUNCTIONS USING MYORDER
SELECT * FROM MYORDER

--CONCAT
PRINT CONCAT('STRING1 ', 'STRING2')
-- ALWAYS SAME RANDOM NUMBER ONLY RUNS THAT ONCE
SELECT ORDERNUMBER, ORDERNAME, CONCAT(ORDERNAME, ' ', RAND()) AS CONCATENATEDTEXT
FROM MYORDER

-- TAKING SUBSTRINGS - LEFT
SELECT ORDERNUMBER, ORDERNAME, LEFT(ORDERNAME, 3) FROM MYORDER

-- RIGHT - SAME BUT FROM RIGHT OF WORD

-- SUBSTRING - NOTE INDEXING IS NOT LIKE PYTHON STARTS FROM 1
SELECT ORDERNUMBER, ORDERNAME, SUBSTRING(ORDERNAME, 2,2) FROM MYORDER
-- LOWER AND UPPER CASE IN STRINGS
SELECT ORDERNUMBER, ORDERNAME, LOWER(SUBSTRING(ORDERNAME, 2,2)) FROM MYORDER

-- LENGTH OF STR
SELECT ORDERNUMBER, LEN(ORDERNAME) AS STRLEN FROM MYORDER

-- USE LEN OF STRING TO CAPITALISE THE FIRST LETTER AND REMOVE REST
SELECT ORDERNUMBER, ORDERNAME, CONCAT(UPPER(LEFT(ORDERNAME, 1)), LOWER(SUBSTRING(ORDERNAME, 2, LEN(ORDERNAME))))
AS FORMATTED_NAME FROM MYORDER

--TRIM TO DEAL WITH SPACES - LEFT AND RIGHT TRIM
SELECT LEN('       HELLO ')
SELECT LEN(LTRIM('      HELLO  '))
SELECT LEN(LTRIM(RTRIM('      HELLO   '))) -- REMOVE FROM BOTH SIDES