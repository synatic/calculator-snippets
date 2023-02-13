# Queries

> Snippets for requesting and accessing data effectively within synatic

Level up your SQL-Fu.

## Notes

Many of the queries leverage the Synatic [sql-to-mongo library](https://github.com/synatic/sql-to-mongo).

In addition to buffer lookup step, aggregate queries are also supported on platform using the relevant flow steps.

## Tips

Make sure you pay attention to the structures of results returned by a query, and unwind or filter the results appropriately to prevent lookup errors.

Remember that you can use the buffer query section of the flow interface to dynamically test system lookups.

## General

General query structure and syntax examples.

Get all the data from a buffer using a buffer lookup:

```sql
SELECT * FROM `my-buffer--name`
```

Get data from a buffer based based on some record criteria:

```sql
SELECT * FROM `my-buffer--name`
WHERE name = '{@inputRecord}'
```

Get some data from a join:

```sql
SELECT a.col1, b.col2
FROM `my-buffer--name` a
LEFT JOIN `another--buffer` b
ON a.col1 = b.col2
```

> Warning: Depending on the cardinality of the joins and the way the result is returned, chances are you will need to use an operator to ensure that the joined result is not an array. Using "first" to match the first found record is the most typical approach.

```sql
SELECT a.col1, b.col2
FROM `my-buffer--name` a
LEFT JOIN `another--buffer` `b|first`
ON a.col1 = b.col2
```

> Warning: To expand a one to many join into an array within the record, use the unwind operator

```sql
SELECT a.col1, b.col2
FROM `my-buffer--name` a
LEFT JOIN `another--buffer` `b|unwind`
ON a.col1 = b.col2
```

## Antijoins

Antijoins are useful to find records that are not present within another table or buffer.

Doing a left antijoin can be done with a buffer lookup step, but it will require flattening the joined table objects with a "first" operator.

```sql
SELECT COUNT(*) as cnt
FROM `my-buffer--name` a
LEFT JOIN `another--buffer` `b|first`
ON a.col1 = b.col2
WHERE b.col2 IS NULL
```

Usually you can also use `NOT IN` or `NOT EXISTS` with a subquery, although you may encounter limitations in buffer query lookups currently.

There are usually also a bunch of other database or query specific operations (such as EXCEPT in SQL Server) which might make it more performant depending on what you're doing, but this serves most use cases.

To perform a similar antijoin with an aggregate lookup step, we will need to reference the secondary buffer within synatic. That requires us to know the buffer id of the target data buffer. We also use a temporary column (cl5WzFXG) which can be removed from the output.

This can also be parameterized so that such object definitions can be handled by precursory lookups steps, and referenced with template values.

```javascript
[
  {
    "$lookup": {
      "from": "{@tgtBufferId}",
      "localField": "{@srcUidField}",
      "foreignField": "{@tgtUidField}",
      "as": "cl5WzFXG"
    }
  },
  {
    "$match": {
      "cl5WzFXG": {
        "$size": 0
      }
    }
  },
  {
    "$project": {
      "cl5WzFXG": 0
    }
  }
]
```

If you want to understand the specifics of the aggregate better, there is a [medium post floating about](https://medium.com/dsmli/mongodb-left-anti-join-fac00eda33fc) describing antijoins with mongo aggregates.

## ANSI SQL

Some connectors, such ODBC connections to db2 for instance, might require using ANSI standard sql queries which have a slightly different syntax to other db engines.

### One Liners

Quick demos of the syntax used for common operations

- `SELECT * FROM table_name FETCH FIRST 10 ROWS ONLY;`: Get ten records only

## MS SQL Server

Microsoft SQL Server is a common database backend for enterprise apps, so having queries that work against it

### One Liners

Quick demos of the syntax used for common operations

- `SELECT TOP(10)* FROM AFW_GeneralLedgerTransaction;`: Get ten records only
- `CONVERT(datetime, (cast(GETDATE() as date)), 127)`: Todays date, as a date
- `CONVERT(datetime, (cast(GETDATE()-1 as date)), 127)`: Yesterdays date, as a date

### Introspection

Introspecting database structures is a common requirement for integration processes.

#### Search Columns

Looking for all the columns in the database related to "transaction" or "id"? Just swap out the string value in the `WHERE LIKE` filter and collate the tables and columns for all columns which include the string in their title.

```sql
SELECT c.name
AS 'ColumnName',
t.name AS 'TableName'
FROM sys.columns c
JOIN sys.tables t ON c.object_id = t.object_id
WHERE c.name LIKE '%id%'
ORDER BY TableName, ColumnName;
```

Looking for tables alone is much simpler

```sql
SELECT t.name AS 'TableName'
FROM sys.tables t
WHERE t.name LIKE '%afw%'
ORDER BY TableName;
```

#### Get Keys

Get the keys from (selected) tables

> HINT: You can also swap out `'PRIMARY KEY'` for `'FOREIGN KEY'` or another constraint type as well.

```sql
SELECT tc.TABLE_SCHEMA
    ,tc.TABLE_NAME
    ,tc.CONSTRAINT_NAME
    ,kcu.COLUMN_NAME
    ,kcu.ORDINAL_POSITION
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS kcu
    ON kcu.CONSTRAINT_NAME = tc.CONSTRAINT_NAME
WHERE tc.CONSTRAINT_TYPE = 'PRIMARY KEY'
--AND tc.TABLE_NAME IN ('table_1','table_2')
```

## PostgreSQL

Useful operations in postgres.

### One Liners

Quick demos of the syntax used for common operations

- `SELECT * FROM table_name LIMIT 10;`: Get ten records only

## Applications

Various applications and cloud platforms provide their own query operations and APIs for querying data.

### SOQL

Salesforce Object Query Language (SOQL) is a SQL-Like interface for salesforce APIS and is pretty handy for performing data lookups.

Example: `Select Id, Name From Account Where CustomSystem__SomeCustomIdField__c = '{@record.IdField}'`

### SuiteQL

Oracle NetSuite provides the SuiteQL API for retrieving objects from NetSuite

Example: `SELECT id as NsAccId, accountsearchdisplayname as NsAccName, acctnumber as NsAccNo, accttype as NsAccType FROM account WHERE acctnumber = '{@record.AccountNo}'`
