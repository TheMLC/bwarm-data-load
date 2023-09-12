TRUNCATE TABLE [dbo].[WORK_RECORDINGS];

print format(sysdatetime(), 'dd/MM/yyyy HH:mm:ss.fff');

BULK INSERT [dbo].[WORK_RECORDINGS]
from 'worksrecordings.tsv'
with (data_source = 'AzureDataLoadStgSource',
      fieldterminator = '\t',
      rowterminator='0x0a',
      batchsize=10000,
      maxerrors=10);
GO

DECLARE @SNAPSHOT_ID INT;
SELECT @SNAPSHOT_ID = MAX(snapshotid)
FROM [dbo].[SNAPSHOTS];

UPDATE [dbo].[WORK_RECORDINGS]
SET snapshotid = @SNAPSHOT_ID
WHERE snapshotid IS NULL;
GO

print format(sysdatetime(), 'dd/MM/yyyy HH:mm:ss.fff');