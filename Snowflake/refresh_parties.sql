
SET snapshotid=ifnull((SELECT max(snapshotid) from MLC_SNAPSHOTS),0);

COPY INTO MLC_PARTIES
FROM (
    SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $snapshotid
    FROM @IMPORTSTAGE
)
FILES = ('/mlc/parties.tsv.gz')
FILE_FORMAT = TSV_FILE_FORMAT
ON_ERROR = CONTINUE
;

