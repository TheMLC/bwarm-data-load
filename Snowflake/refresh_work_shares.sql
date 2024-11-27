
SET snapshotid=ifnull((SELECT max(snapshotid) from MLC_SNAPSHOTS),0);

TRUNCATE MLC_WORK_RIGHT_SHARES;

COPY INTO MLC_WORK_RIGHT_SHARES
FROM (
    SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $snapshotid
    FROM @IMPORTSTAGE
)
FILES = ('/mlc/workrightshares.tsv.gz')
FILE_FORMAT = TSV_FILE_FORMAT
ON_ERROR = CONTINUE
;
