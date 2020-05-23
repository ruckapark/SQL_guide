#SQL CheatSheet with SQL Management Studio (Microsoft)  

## Part 1
### Tables
The very basics of working with tables in SQL

#### Steps to create a table
* Create a database on the local machine - preinstalled are just system databases
* Indicate to use the created database before creating table
* New query will open up and IDE like editor
* The server issued against is shown in the bottom right of the editor
* With created database execute with execute prompt of F5
* Within the created database, under the multiple files locate tables
* Create table (testtable e.g.) adhering to the syntax shown below (in brackets, declaring datatypes etc.)

_NOTE: the IDE will let you do this without code using buttons..._

#### Adding and Retrieving the data
* *insert into* yourtable(columns...) with the values(1,'column values for one row...')
* You could right click on the table and generate the query for top 1000 rows and look at the syntax
* *select* the columns you are interested in retrieving and indicate *from* which table
* (double check the correct db is being used.)

### Querying - BASIC
I take a prewritten database to be used as an example to explore in further detail querying. The sample databases from microsoft are fine.

#### Install sample databse
* Google adventure works database
* download the SQL script and excel files and follow instructions to generate the log and mdf file 
* Attach the mdf file to the databases and remain in the master branch

#### Querying the database
* highlight the text and F5 to only run a certain part of the query
* If you execute multiple queries then you will have to scroll through output windows
* Some tables have the same parent table seperated by a .
* The asterix (as is common) is a call all command
* *SELECT DISTINCT FROM* eradicates any duplicates like a set.
* Filtering has where clauses, OR and AND etc.
* You need an Or or and AND for a double clause - never x < value < you
* Lots of other filtering keywords - LIKE for a string match, = for value match, BETWEEN AND clause
* When matching string the % is used to allow for anything to precede or proceed the match

### Tables and More Queries

#### New columns
* You can quite happily just add a new column to the output after a comma (with AS name to give a col name)
* You can add a selected column set *into* a new table or a #temptable (only in live query)
* You can DELETE FROM a table WHERE something is true
* You can UPDATE [table] and SET something = new WHERE a condition is true

#### Joins
* CREATE TABLE (with the conlumns and data type) and the INSERT INTO the table some VALUES
* Inner join of two tables on a column produces a table only with common rows
* You have to give the tables alias names Table1 A and Table2 B and select the table names A.column_name
* You have to indicate that the join should be performed ON two equal columns
* Outer join: LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN will take all join column values on left and add nulls or right or both repsectively
* Cross join: Takes the columns in the left table and assigned each column to every column on right.

### Inbuilt useful functions

A couple functions with dates, arithmetic and strings

#### Dates
* GETDATE() will return todays exact date, any arithmetic with it will assume days
* DATEPART() is easy enough to look up, but used to select the useful part of the date
* DATES can be interpreted from 'dd/mm/yyyy' strings easily
* DATEADD(datepart, amount, originaldate) can be used to add dates or amounts to dates
* DATEDIFF(datepart,start,end) will give a difference.

NOTE: there are tons more date functions, which are very easy to look up and understand...

#### Arithmetic
* Many functions exist such as AVG, SUM, COUNT, MIN/MAX etc.
* Generators also exist such as RAND()
* PRINT at the beginning of the line works similarly to SELECT
* CONCAT function concatenates and strings but also strings and numbers
* LEN returns the length and can be used on all value in column without for loop etc
* LEFT, RIGHT and SUBSTRING (for certain range) can be used to select subst
* Idexing starts from 1 and not 0
* UPPER and LOWER will change the format of the string.