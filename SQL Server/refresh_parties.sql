TRUNCATE TABLE [dbo].[PARTIES];

print format(sysdatetime(), 'dd/MM/yyyy HH:mm:ss.fff');

DECLARE @SNAPSHOT_ID INT;
SELECT @SNAPSHOT_ID = MAX(snapshotid)
FROM [dbo].[SNAPSHOTS];
GO

BULK INSERT [dbo].[PARTIES]
from 'parties.tsv'
with (data_source = 'AzureDataLoadStgSource',
      fieldterminator = '\t',
      rowterminator='0x0a',
      batchsize=10000,
      maxerrors=10);
GO

print format(sysdatetime(), 'dd/MM/yyyy HH:mm:ss.fff');