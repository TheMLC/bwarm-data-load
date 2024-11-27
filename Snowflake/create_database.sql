-- Michael Ettl - Sonoton Music
-- 
-- Create BWARM table structure in Snowflake
-- Attention - this will drop all your data, 
-- if you want to use different snapshots don't run this if tables already exist
--
-- select your schema
USE DB.SCHEMA;

-- create TSV import format settings
CREATE OR REPLACE FILE FORMAT TSV_FILE_FORMAT TYPE = 'CSV' COMPRESSION = 'AUTO'
FIELD_DELIMITER = '\t' RECORD_DELIMITER = '\n' SKIP_HEADER = 0
FIELD_OPTIONALLY_ENCLOSED_BY = 'NONE' TRIM_SPACE = FALSE 
ERROR_ON_COLUMN_COUNT_MISMATCH = TRUE ESCAPE = 'NONE' 
ESCAPE_UNENCLOSED_FIELD = '\134' DATE_FORMAT = 'AUTO' 
TIMESTAMP_FORMAT = 'AUTO' NULL_IF = ('\\N');

CREATE OR REPLACE TABLE MLC_SNAPSHOTS (
    snapshotid INT NOT NULL AUTOINCREMENT,
    created_date DATETIME,
    PRIMARY KEY (snapshotid)
);

CREATE OR REPLACE TABLE MLC_WORKS (
    FeedProvidersWorkId VARCHAR(3000),
    ISWC VARCHAR(11),
    WorkTitle VARCHAR,
    OpusNumber VARCHAR(3000),
    ComposerCatalogNumber VARCHAR(3000),
    NominalDuration VARCHAR(3000),
    HasRightsInDispute BOOLEAN,
    TerritoryOfPublicDomain VARCHAR,
    IsArrangementOfTraditionalWork BOOLEAN,
    AlternativeWorkForUsStatutoryReversion VARCHAR(3000),
    UsStatutoryReversionDate VARCHAR(100),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersWorkId)
);

CREATE OR REPLACE TABLE MLC_ALTERNATIVE_WORK_TITLES (
    FeedProvidersWorkAlternativeTitleId VARCHAR(3000),
    FeedProvidersWorkId VARCHAR(3000),
    AlternativeTitle VARCHAR,
    LanguageAndScriptCode VARCHAR(3000),
    TitleType VARCHAR(3000),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersWorkAlternativeTitleId)
);

CREATE OR REPLACE TABLE MLC_WORK_IDENTIFIERS (
    FeedProvidersWorkProprietaryIdentifierId VARCHAR(3000),
    FeedProvidersWorkId VARCHAR(3000),
    Identifier VARCHAR(3000),
    FeedProvidersAllocatingPartyId VARCHAR(3000),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersWorkProprietaryIdentifierId)
);

CREATE OR REPLACE TABLE MLC_PARTIES (
    FeedProvidersPartyId VARCHAR(3000),
    ISNI VARCHAR(15),
    IpiNameNumber INTEGER,
    CisacSocietyId VARCHAR(3),
    DPID VARCHAR(100),
    FullName VARCHAR,
    NamesBeforeKeyName VARCHAR,
    KeyName VARCHAR,
    NamesAfterKeyName VARCHAR,
    snapshotid INT,
    PRIMARY KEY (FeedProvidersPartyId)
);

CREATE OR REPLACE TABLE MLC_WORK_RIGHT_SHARES (
    FeedProvidersWorkRightShareId VARCHAR(3000),
    FeedProvidersWorkId VARCHAR(3000),
    FeedProvidersPartyId VARCHAR(3000),
    PartyRole VARCHAR(100),
    RightSharePercentage FLOAT, 
    RightShareType VARCHAR(100),
    RightsType VARCHAR(100),
    ValidityStartDate DATE,
    ValidityEndDate DATE,
    FeedProvidersParentWorkRightShareId VARCHAR(3000),
    TerritoryCode VARCHAR(3000),
    UseType VARCHAR(3000),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersWorkRightShareId)
);

CREATE OR REPLACE TABLE MLC_RECORDINGS (
    FeedProvidersRecordingId VARCHAR(3000),
    ISRC VARCHAR(12),
    RecordingTitle VARCHAR, 
    RecordingSubTitle VARCHAR, 
    DisplayArtistName VARCHAR, 
    DisplayArtistISNI VARCHAR(16),
    PLine VARCHAR(3000),
    Duration  VARCHAR(100),
    FeedProvidersReleaseId VARCHAR(3000),
    StudioProducerName VARCHAR, 
    StudioProducerId VARCHAR(3000),
    OriginalDataProviderName VARCHAR(3000),
    OriginalDataProviderDPID VARCHAR(3000),
    IsDataProvidedAsReceived BOOLEAN,
    snapshotid INT,
    PRIMARY KEY (FeedProvidersRecordingId)
);

CREATE OR REPLACE TABLE MLC_ALTERNATIVE_RECORDING_TITLES (
    FeedProvidersRecordingAlternativeTitleId VARCHAR(3000),
    FeedProvidersRecordingId VARCHAR(3000),
    AlternativeTitle VARCHAR,
    LanguageAndScriptCode VARCHAR(3000),
    TitleType VARCHAR(3000),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersRecordingAlternativeTitleId)
);

CREATE OR REPLACE TABLE MLC_RECORDING_IDENTIFIERS (
    FeedProvidersRecordingProprietaryIdentifierId VARCHAR(3000),
    FeedProvidersRecordingId VARCHAR(3000),
    Identifier VARCHAR(3000),
    FeedProvidersAllocatingPartyId VARCHAR(3000),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersRecordingProprietaryIdentifierId)
);

CREATE OR REPLACE TABLE MLC_RELEASES (
    FeedProvidersReleaseId VARCHAR(3000),
    ICPN VARCHAR(15),
    ReleaseTitle VARCHAR,
    ReleaseSubTitle VARCHAR,
    DisplayArtistName VARCHAR,
    DisplayArtistISNI VARCHAR(16),
    LabelName VARCHAR(3000),
    ReleaseDate DATE,
    OriginalDataProviderName VARCHAR(3000),
    OriginalDataProviderDPID VARCHAR(3000),
    IsDataProvidedAsReceived BOOLEAN,
    snapshotid INT,
    PRIMARY KEY (FeedProvidersReleaseId)
);

CREATE OR REPLACE TABLE MLC_RELEASE_IDENTIFIERS (
    FeedProvidersReleaseProprietaryIdentifierId VARCHAR(3000),
    FeedProvidersReleaseId VARCHAR(3000),
    Identifier VARCHAR(3000),
    FeedProvidersAllocatingPartyId VARCHAR(3000),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersReleaseProprietaryIdentifierId)
);

CREATE OR REPLACE TABLE MLC_WORK_RECORDINGS (
    FeedProvidersLinkId VARCHAR(3000),
    FeedProvidersWorkId VARCHAR(3000),
    FeedProvidersRecordingId VARCHAR(3000),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersLinkId)
);

CREATE OR REPLACE TABLE MLC_UNCLAIMED_WORKS (
    FeedProvidersRightShareId VARCHAR(3000),
    FeedProvidersRecordingId VARCHAR(3000),
    FeedProvidersWorkId VARCHAR(3000),
    ISRC  VARCHAR(12),
    DspRecordingId  VARCHAR(3000),
    RecordingTitle VARCHAR,
    RecordingSubTitle VARCHAR,
    AlternativeRecordingTitle VARCHAR,
    DisplayArtistName VARCHAR,
    DisplayArtistISNI VARCHAR(16),
    Duration VARCHAR(100),
    UnclaimedPercentage FLOAT,
    PercentileForPrioritisation FLOAT,
    snapshotid INT
);