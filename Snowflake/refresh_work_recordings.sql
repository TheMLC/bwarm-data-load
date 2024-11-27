
SET snapshotid=ifnull((SELECT max(snapshotid) from MLC_SNAPSHOTS),0);

TRUNCATE MLC_WORK_RECORDINGS;

COPY INTO MLC_WORK_RECORDINGS
FROM (
    SELECT $1, $2, $3, $snapshotid
    FROM @IMPORTSTAGE
)
FILES = ('/mlc/worksrecordings.tsv.gz')
FILE_FORMAT = TSV_FILE_FORMAT
ON_ERROR = CONTINUE
;