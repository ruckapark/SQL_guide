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

## Computed Columns
