-- Michael Ettl - Sonoton Music
-- 
-- use snowflake to load BWARM data from snowflake stage into snowflake tables
-- we use S3 folder connected to snowflake stage - see https://docs.snowflake.com/en/user-guide/data-load-s3-create-stage
-- all .tsv files are stored in gzipped format in S3 folder
-- if you can use plain .tsv files this should work but don't forget to change the filenames
--

-- create snapshotid with timestamp
INSERT INTO MLC_SNAPSHOTS (created_date) VALUES (CURRENT_TIMESTAMP);
