
SET snapshotid=ifnull((SELECT max(snapshotid) from MLC_SNAPSHOTS),0);

TRUNCATE MLC_RELEASE_IDENTIFIERS;

COPY INTO MLC_RELEASE_IDENTIFIERS
FROM (
    SELECT $1, $2, $3, $4, $snapshotid
    FROM @IMPORTSTAGE
)
FILES = ('/mlc/releaseidentifiers.tsv.gz')
FILE_FORMAT = TSV_FILE_FORMAT
ON_ERROR = CONTINUE
;