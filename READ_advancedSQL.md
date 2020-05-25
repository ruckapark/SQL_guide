# Advaced SQL

This document provides information on the SQL functionality I found to be more important with more advanced querying concepts

## Views

Views allow someone connecting to a server to see part of an exisiting table through the view, without necessarily seeing the full table

### Creating a New Views
* Could just do it in the IDE with new view from tables and views
* Better way is going to Template Explorer within view
* In the browser select the template for Create View
* This will generate the general query for creating a view
* If not comfortable directly changing values, Query -> Specify Params and fill them in
* The best way for simple queries is to write the query from scratch (see Create_view query)

## Triggers

Imagine we have a sales table with id,amount,data. If we have a sale of 1000$ there should always be an email sent. If its 1m then we want a rollback, email and login change as it indicates a hack.
What if total sales in a month is over a certain amount, we want to log something in a table.

These are triggers (automatically run on conditional inserts in tables)

### Generating a triggers
* They are stored in the drop down of a specific table
* It would be possible to make it with right clicks etc.
* Would also be in the template explorer - as with any feature

#### Writing from scratch.

Could also see the code in SQL gen trigger file in advanced SQL

* CREATE TRIGGER, ON a database or a table
* Specify AFTER what action (TRANSACTION)
* AS
* BEGIN GO statement containing the action to take preceed by an error message to be printed
* A database example could be if someone tries to create a new table stop them with the message 'NOT ALLOWED'
* Database triggers stored in programmability

## Computed Columns

Clearly we may want to generate columns from inputs of other columns (ie full name from an online form in first name and last name)

* This can be done manually with a column AS a combination or manipulation of other columns
* It may be easier to do this with the IDE by creating a table and select column type as calculated

Look at the computed column SQL query for an demonstration of how this could be done

## Stored Procedures

Subroutine for application that acces a relational database system.
When someone searches amazon a stored procedure would be used when accessing the databse of products, and thus return the relevant objects.
Parameterised store procedure to get all products where product name = searchvalue

Stored procedure could also of course refer to altering, deleted etc.
Imaging on amazon adding an item to the shopping cart - here we add to an initially empty table using a store procedure.

If we then use a store procedure to update the quantity once in the cart up so more amounts are added - updating rows.
Queries can get long and complicated so we can store the procedure containing embedded logic. (Function)

### Creating Store Procedure 
* Lots of templates exist for stored procedures (can also right click and create new and update params)
* Better to create from scratch
* CREATE PROC procudure name // AS // something
* SET NOCOUNT ON if you aren't bothered by how many rows are affected
* with input @parameters initialise the before defining the SP AS something
* These params can take a default value
* Like deleting things in SQL we can DROP or ALTER/EDIT the values.
* OUTPUT values need to be defined as OUTPUT when creating the proc
* In the code you can DECLARE an @variable the EXECUTE the SP and SELECT the variable

The best way to capture this is to check the StoreParams query in advanced SQL

## User Defined Functions

The equivalent of a function in languages. Accepts parameters and returns.
These differ to store procudures, user defined functions can be used inline.
Directly put into the logic of a where clause for example.

* Scalar functions - Return single value from function
* Tabe Valued Functions - Return a table
* System functions - Getdate() for example.

### Creating User Defined Functions

Remember if randomly defining for examples to drop them after use.

* CREATE FUNCTION with_name() initially can be with no input parameters
* Input any @paramter type that may but an input
* Indicate what it RETURNS and the type (INT for example)
* BEGIN and END function if returning a variable
* DECLARE the return @variable and type
* SELECT clause to define how to calculate the variable
* If the function is returning a table, do not have BEGIN END, instead go to AS RETURN followed by the table SELECT with any conditional logic

After declaring the function, remember that we DECLARE the function, SELECT it with the function in line and PRINT all in one query. Variables are not stocked as in standard languages...
If a function returning a table is called just call like any table, except with function inline instead of table name.

## Error Handling

### Database concepts
* A transaction is a single unit of work, only when a database fully completes a set of operations is new data stored, otherwise the code should be intelligent enough to rollback.
* ACID properties guarantee that transactions are processed reliably: Atomicity, Consistency, Isolation, Durability.
* A single logical operation on the data is a transaction
* Atomicity: Whatever transactions should be all or nothing - no error ok, one error all rollback
* Consistency: Takes db from one valid state to another. Whatever logic executed always keeps the db in consistent state.
* Isolation: Ensures concurrent execution of transactions results in same outcome of serial execution. (Concepts of exclusive locks and rollover locks)
* Durability: Once updated, data should remain in the system.

### Transactions and E.H.

Imagine you have you account at Bank1, we want to transfer money to a Bank2.

1. Your debit from Bank1
2. Credit to Bank2 

What if one of these goes wrong? Then we should always rollback the full process. Otherwise, a credit could appear in Bank2 whilst no debit is taken from Bank1.

We need error handling with a TRY, CATCH, so that when something has to be rolledback we can evaluate how to handle the errors: email, phonecall etc.
An example is maybe a live DB might be restored every 5 hours, for ten minutes we might get errors if querying. 
We would want to know if that's the problem, as we would then just wait to try again later.
With no try catch you would get a direct error.

### SQL Creating Transations
#### No error handle
* BEGIN TRANSACTION 
* I prefer to write logic indented as one would with standard code
* Here for example could have an UPDATE table, SET col = 1 WHERE condition
* COMMIT TRANSACTION 

The problem here is if the transaction fails, SQL will throw an error

#### Error Handles

@@Error is the type of error thrown back. If this is 0, then it indicates a success, anything above 0 is a certain type of error.
If we take the example of inserting a row to a column, the frist time the trans will work, but afterwards it won't as there can't be a duplicate.

* DECLARE THE @VARIABLE type
* BEGIN TRANSACTION 
* ---- INSERT INTO table
* ---- ---- (cols)
* ---- VALUES
* ---- ---- (vals)
* SET @ERROR var that was created before = @@ERROR 
* IF(@ERRORRESULTS = 0)
* BEGIN PRINT, COMMIT TRANS END
* ELSE
* BEGIN RAISEERROR('fail',type,severity), ROLLBACK TRANS , END

this also nicely indicates the concept of a rollback. It will print the message but still raise the error and send it back

#### Try Catch

* The nice thing about the try catch, is we can print error message without sending error to terminal
* BEGIN TRY --all transaction-- COMMIT TRANS   END Try
* BEGIN CATCH --error handle-- END CATCH

## Temporary Storage, Grouping and Ranking

We may want to use CTE (common table expression) to store some table temporarily
Groupbys are also very useful when making tables with various combinations of subtables.

### CTE

### Grouping
* Brute force with UNION
* GROUPBY
* ROLLUP
* CUBE
