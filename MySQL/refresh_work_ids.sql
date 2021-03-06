
TRUNCATE TABLE WORK_IDENTIFIERS;

SELECT @SNAPSHOT_ID := MAX(snapshotid) FROM SNAPSHOTS;

SELECT NOW() FROM DUAL;

LOAD DATA INFILE 'workidentifiers.tsv'
    INTO TABLE WORK_IDENTIFIERS
    FIELDS TERMINATED BY '\t' OPTIONALLY ENCLOSED BY '"' ESCAPED BY '\\'
    SET snapshotid= @SNAPSHOT_ID
;

SELECT NOW() FROM DUAL;
