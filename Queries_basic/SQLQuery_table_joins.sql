use [AdventureWorks]

-- JOINS
-- IN THE REAL WORLD WE ARE GOING TO BE USING MULTIPLE TABLES
-- WE JOIN ON A COMMON COLUMN

CREATE TABLE MYEMPLOYEE (EMPLOYEEID INT, FIRSTNAME VARCHAR(20), LASTNAME VARCHAR(20))
INSERT INTO MYEMPLOYEE VALUES(1, 'Michael', 'Scott')
INSERT INTO MYEMPLOYEE VALUES(2, 'George', 'Ruck')
INSERT INTO MYEMPLOYEE VALUES(3, 'Loretta', 'Olianti')

CREATE TABLE MYSALARY (EMPLOYEEID INT, SALARY FLOAT)
INSERT INTO MYSALARY VALUES(1, 10000)
INSERT INTO MYSALARY VALUES(2, 8000)
INSERT INTO MYSALARY VALUES(3, 6000)

SELECT * FROM MYEMPLOYEE
SELECT * FROM MYSALARY

-- INNER JOIN - ONLY ROWS COMMON ACROSS TABLES
-- GIVE ALIAS OF TABLES AND COMMON COLUMN
SELECT A.FIRSTNAME, A.LASTNAME, B.SALARY
FROM MYEMPLOYEE A INNER JOIN MYSALARY B ON A.EMPLOYEEID = B.EMPLOYEEID

-- OUTER JOIN - WILL TAKE ALL ROWS AND JUST HAVE EMPTY ROWS
-- left OUTER JOIN - ALL ROWS OF LEFT TABLE AND TRY TO MATCH RIGHT (NULLS APPEAR)
CREATE TABLE MYPHONE (EMPLOYEEID INT, PHONENUMBER INT)

INSERT INTO MYPHONE VALUES (1,123412322)
INSERT INTO MYPHONE VALUES (2,123232322)

--WILL GIVE NULL IF NOT EXISTANT
SELECT A.FIRSTNAME, A.LASTNAME, B.PHONENUMBER FROM MYEMPLOYEE A LEFT JOIN MYPHONE B
ON A.EMPLOYEEID = B.EMPLOYEEID

-- right OUTER JOIN - THE COMMON COLUMN WILL BE ON LEFT OF RIGHT TABLE - TABLE OF LEFT WILL HAVE NULLS BUT JOINED ON LEFT
CREATE TABLE MYPARKING (EMPLOYEEID INT, PARKINGSPOT VARCHAR(20))
INSERT INTO MYPARKING VALUES(1, 'A1')
INSERT INTO MYPARKING VALUES(2, 'A2')

-- THIS TIME NULL WILL APPEAR IN LEFT TABLE
SELECT A.PARKINGSPOT, B.FIRSTNAME, B.LASTNAME FROM MYPARKING A RIGHT JOIN MYEMPLOYEE B ON A.EMPLOYEEID = B.EMPLOYEEID

-- FULL OUTER JOIN - IN COMMON COLUMN TAKE ALL OF LEFT AND RIGHT VALUES AND ADD NULLS TO LEFT AND RIGHT!
CREATE TABLE MYCUSTOMER (CUSTOMERID INT, CUSTOMERNAME VARCHAR(20))
INSERT INTO MYCUSTOMER VALUES (1, 'JOJO')
INSERT INTO MYCUSTOMER VALUES (3, 'WILLY')

CREATE TABLE MYORDER (ORDERNUMBER INT, ORDERNAME VARCHAR(20), CUSTOMERID INT)
INSERT INTO MYORDER VALUES(1,'BEANS',1)
INSERT INTO MYORDER VALUES(2,'JELLY',2)
INSERT INTO MYORDER VALUES(3,'BREAD',7)
INSERT INTO MYORDER VALUES(4,'PASTA',8)

SELECT * FROM MYCUSTOMER
SELECT * FROM MYORDER

SELECT A.CUSTOMERID, A.CUSTOMERNAME, B.ORDERNUMBER, B.ORDERNAME
FROM MYCUSTOMER A FULL OUTER JOIN MYORDER B
ON A.CUSTOMERID = B.CUSTOMERID

-- CROSS JOIN - EVERY ROW IN FIRST TABLE ADDED TO A ROW OF EACH ROW IN TABLE 2 (END UP WITH HUGE TABLE) - TABLE 1 IS A PARENT TABLE
SELECT * FROM MYCUSTOMER CROSS JOIN MYSALARY
SELECT * FROM MYCUSTOMER, MYSALARY -- ANOTHER WAY OF WRITING IT

-- DROP TABLE --to delete a table from the database
-- TRUNCATE TABLE --deletes table content if want to alter - doesnt delete actual table