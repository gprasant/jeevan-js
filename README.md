jeevan-js
=========

node-js version of jeevan

## DB Import

In order to import data from a csv file to the database, make sure that the csv has the exact schema as that of the database table then the command to import data is :

  COPY table_name (*Column names*)
    FROM 'CSV_FILE' WITH CSV HEADER;

## Dump and Restore DB

In order to backup and restor the data on local to the remote server three steps should be performed

1. Generate a sql script dump of the database (containing SQL scripts to build the database)
2. scp the file on to the database server
3. Run the file on the server wth the psql -f