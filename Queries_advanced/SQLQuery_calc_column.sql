use [AdventureWorks]

CREATE TABLE MYNAMES
(Firstname varchar(15), Lastname varchar(15), Fullname AS Firstname + ' ' + Lastname)

INSERT INTO MYNAMES (Firstname,Lastname)
VALUES('Geo','Ruck')
INSERT INTO MYNAMES (Firstname,Lastname)
VALUES('Lolo','Ferarri')

SELECT * FROM MYNAMES