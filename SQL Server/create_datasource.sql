CREATE DATABASE SCOPED CREDENTIAL AzureMICredential
WITH IDENTITY = 'Managed Identity';

CREATE EXTERNAL DATA SOURCE AzureDataLoadStgSource
WITH ( TYPE = BLOB_STORAGE,
          LOCATION = 'https://<change-me>.blob.core.windows.net/temp'
          , CREDENTIAL = AzureMICredential
);