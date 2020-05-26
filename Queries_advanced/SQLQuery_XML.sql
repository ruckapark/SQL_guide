use [AdventureWorks]

--XML
SELECT * FROM [dbo].[samplexmltable]

-- TAKE SAMPLE DATA FROM W3 FIRSTONE
INSERT INTO [dbo].[samplexmltable] (xmldata) VALUES
('<note>
<to>Tove</to>
<from>Jani</from>
<heading>Reminder</heading>
<body>Dont forget me this weekend!</body>
</note>')

-- GIVES A HYPERLINK TO A NEW SQL TAB TO VIEW NICELY
SELECT * FROM [dbo].[samplexmltable]

-- WHAT IF WE WANT TO PUT DATA INTO AN XML TABLE?
-- base off of territory, auto easier for now than raw.
SELECT * FROM [Sales].[SalesTerritory]
FOR XML AUTO, ELEMENTS, ROOT ('SalesTerritory')
-- each row is one data entry in the xml

-- more control with row tags
SELECT * FROM [Sales].[SalesTerritory]
FOR XML raw, ELEMENTS, ROOT ('Salesterritory')

-- querying the data
-- what if we only want on value
SELECT [XMLDATA].query('/note/to') as [to]
from [dbo].[samplexmltable]

-- what if we dont want tags, just the values Tove
-- value takes two params, part and datatype returned
SELECT [XMLDATA].value('(/note/to)[1]', 'varchar(10)') as [to]
from [dbo].[samplexmltable]

-- only selected the one column for these columns
SELECT TOP 10 territoryID from [Sales].[SalesTerritory]
for xml auto, elements, root('SalesTerritory')

-- load xml and output inot column  row table format
SELECT * from [Sales].[SalesTerritory]
for xml auto, elements, root('SalesTerritory')

--parsing logic
declare @xmlhandle int
declare @xmldocument xml

set @xmldocument = (select * from [Sales].[SalesTerritory]
for xml auto, elements, root('SalesTerritory'))

exec sp_xml_preparedocument @xmlhandle output, @xmldocument

--use logic and go 2 levels down CASE SENSITIVE!!
select * from openxml(@xmlhandle, '/SalesTerritory/Sales.SalesTerritory', 2)
with (TerritoryID int, SalesYTD MONEY)
--columns^
-- free up resources
exec sp_xml_removedocument @xmlhandle