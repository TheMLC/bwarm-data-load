# Microsoft SQL Server
Scripts to load the data from .tsv files into Microsoft SQL Server.

These scripts are designed for Azure SQL, and will set up a database credential
using Azure Managed Identity, which is used to connect to Azure Blob
Storage where the BWARM .tsv files are presumed to be saved.
If you are using your own SQL Server (i.e. not Azure managed SQL), you can omit to run the create_datasource.sql script, and modify each of the refresh scripts so that the BULK INSERT statement uses your own file source, for example a local disk or network share.

Prerequisites:
1. An Azure SQL Server with an empty database.
2. An Azure Blob Storage account.
3. A Managed Identity for the SQL Server which has at least read access to the Blob Storage container.
4. A database master key set up.
5. create_datasource.sql modified to reflect your blob storage account name.

The two create scripts will need to be run before the refresh scripts.

Load speed for the data will vary depending on scale, and a temporary upscale is recommended for the loading duration.


Footnotes:
- All scripts have been written from scratch using information from the equivalent MySQL scripts supplied by The MLC.
- Where the MEDIUMTEXT field type was used in MySQL, VARCHAR(MAX) has been used in SQL Server.
- A Primary Key (i.e. a clustered index) was added to the UNCLAIMED_WORKS table in SQL Server, where it did not exist in the equivalent MySQL scripts. In SQL Server it is usually not considered good practice to have a table without a clustered index.