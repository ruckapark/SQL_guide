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
