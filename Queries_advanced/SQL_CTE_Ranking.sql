use [AdventureWorks]

--RANKING FUNCTIONS
SELECT * FROM [Person].[Address]

-- use the postal codes
-- EVEN THOUGH STRINGS, ORDER BY WORKS HERE AS IF THEY WERE NUMS
-- ROWNUM() SYS FUNC NEEDS OVER PROCEEDING IT.
SELECT POSTALCODE
,ROW_NUMBER() OVER (ORDER BY POSTALCODE) AS 'ROW_NUMBER'
FROM [Person].[Address]
WHERE PostalCode IN ('98011','54455','90210','97205')

-- LETS ACTUALLY RANK THEM
SELECT POSTALCODE
,ROW_NUMBER() OVER (ORDER BY POSTALCODE) AS 'ROW_NUMBER'
,RANK() OVER (ORDER BY POSTALCODE) AS 'RANK'
FROM [Person].[Address]
WHERE PostalCode IN ('98011','54455','90210','97205')

-- THAT WAS STANDARD RANK WHERE IT ACCUMS
-- IF WE WANT A CONTINUATION WE DO THIS:
SELECT POSTALCODE
,ROW_NUMBER() OVER (ORDER BY POSTALCODE) AS 'ROW_NUMBER'
,DENSE_RANK() OVER (ORDER BY POSTALCODE) AS 'RANK'
FROM [Person].[Address]
WHERE PostalCode IN ('98011','54455','90210','97205')


-- GROUPING WITH BUCKETING - GROUPING INTO 10 BUCKETS
SELECT POSTALCODE
,ROW_NUMBER() OVER (ORDER BY POSTALCODE) AS 'ROW_NUMBER'
,DENSE_RANK() OVER (ORDER BY POSTALCODE) AS 'RANK'
,NTILE(10) OVER (ORDER BY POSTALCODE) AS 'NTILE'
FROM [Person].[Address]
WHERE PostalCode IN ('98011','54455','90210','97205')


