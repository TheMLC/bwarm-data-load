# Snowflake
Load Scripts to Snowflake from Snowflake stage (external or internal).

we use S3 folder connected to snowflake stage (called @IMPORTSTAGE)
see [Snowflake user guide](https://docs.snowflake.com/en/user-guide/data-load-s3-create-stage)

all .tsv files are stored in gzipped format in S3 folder
using plain .tsv files should work but you have to change the filenames

_Michael Ettl - Sonoton Music_