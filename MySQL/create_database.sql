
DROP TABLE  `SNAPSHOTS`;
DROP TABLE  `PUBLIC_DB_STATS`;
DROP TABLE  `WORKS`;
DROP TABLE  `ALTERNATIVE_WORK_TITLES`;
DROP TABLE  `WORK_IDENTIFIERS`;
DROP TABLE  `PARTIES`;
DROP TABLE  `WORK_RIGHT_SHARES`;
DROP TABLE  `RECORDINGS`;
DROP TABLE  `ALTERNATIVE_RECORDING_TITLES`;
DROP TABLE  `RECORDING_IDENTIFIERS`;
DROP TABLE  `RELEASES`;
DROP TABLE  `RELEASE_IDENTIFIERS`;
DROP TABLE  `WORK_RECORDINGS`;
DROP TABLE  `UNCLAIMED_WORKS`;


CREATE TABLE `SNAPSHOTS` (
    snapshotid INT NOT NULL AUTO_INCREMENT,
    created_date DATE,
    PRIMARY KEY (snapshotid)
);

CREATE TABLE PUBLIC_DB_STATS (
    snapshotid   VARCHAR(3000),
    stats_type   VARCHAR(3000),
    stats        INTEGER
);

CREATE TABLE `WORKS` (
    FeedProvidersWorkId VARCHAR(3000),
    ISWC VARCHAR(11),
    Workitle MEDIUMTEXT,
    OpusNumber VARCHAR(3000),
    ComposerCatalogNumber VARCHAR(3000),
    NominalDuration VARCHAR(3000),
    HasRightsInDispute VARCHAR(6),
    TerritoryOfPublicDomain MEDIUMTEXT,
    IsArrangementOfTraditionalWork VARCHAR(6),
    AlternativeWorkForUsStatutoryReversion VARCHAR(3000),
    UsStatutoryReversionDate VARCHAR(100),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersWorkId)
);

CREATE TABLE `ALTERNATIVE_WORK_TITLES` (
    FeedProvidersWorkAlternativeTitleId VARCHAR(3000),
    FeedProvidersWorkId VARCHAR(3000),
    AlternativeTitle MEDIUMTEXT,
    LanguageAndScriptCode VARCHAR(3000),
    TitleType VARCHAR(3000),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersWorkAlternativeTitleId)
);

CREATE TABLE `WORK_IDENTIFIERS` (
    FeedProvidersWorkProprietaryIdentifierId VARCHAR(3000),
    FeedProvidersWorkId VARCHAR(3000),
    Identifier VARCHAR(3000),
    FeedProvidersAllocatingPartyId VARCHAR(3000),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersWorkProprietaryIdentifierId)
);

CREATE TABLE `PARTIES` (
    FeedProvidersPartyId VARCHAR(3000),
    ISNI VARCHAR(15),
    IpiNameNumber INTEGER,
    CisacSocietyId VARCHAR(3),
    DPID VARCHAR(100),
    FullName MEDIUMTEXT,
    NamesBeforeKeyName MEDIUMTEXT,
    KeyName MEDIUMTEXT,
    NamesAfterKeyName MEDIUMTEXT,
    snapshotid INT,
    PRIMARY KEY (FeedProvidersPartyId)
);

CREATE TABLE `WORK_RIGHT_SHARES` (
    FeedProvidersWorkRightShareId VARCHAR(3000),
    FeedProvidersWorkId VARCHAR(3000),
    FeedProvidersPartyId VARCHAR(3000),
    PartyRole VARCHAR(100),
    RightSharePercentage FLOAT, 
    RightShareType VARCHAR(100),
    RightsType VARCHAR(100),
    ValidityStartDate VARCHAR(10),
    ValidityEndDate VARCHAR(10),
    FeedProvidersParentWorkRightShareId VARCHAR(3000),
    TerritoryCode VARCHAR(3000),
    UseType VARCHAR(3000),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersWorkRightShareId)
);

CREATE TABLE `RECORDINGS` (
    FeedProvidersRecordingId VARCHAR(3000),
    ISRC VARCHAR(11),
    RecordingTitle MEDIUMTEXT, 
    RecordingSubTitle MEDIUMTEXT, 
    DisplayArtistName MEDIUMTEXT, 
    DisplayArtistISNI VARCHAR(15),
    PLine VARCHAR(3000),
    Duration  VARCHAR(100),
    FeedProvidersReleaseId VARCHAR(3000),
    StudioProducerName MEDIUMTEXT, 
    StudioProducerId VARCHAR(3000),
    OriginalDataProviderName VARCHAR(3000),
    OriginalDataProviderDPID VARCHAR(3000),
    IsDataProvidedAsReceived VARCHAR(6),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersRecordingId)
);

CREATE TABLE `ALTERNATIVE_RECORDING_TITLES` (
    FeedProvidersRecordingAlternativeTitleId VARCHAR(3000),
    FeedProvidersRecordingId VARCHAR(3000),
    AlternativeTitle MEDIUMTEXT,
    LanguageAndScriptCode VARCHAR(3000),
    TitleType VARCHAR(3000),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersRecordingAlternativeTitleId)
);

CREATE TABLE `RECORDING_IDENTIFIERS` (
    FeedProvidersRecordingProprietaryIdentifierId VARCHAR(3000),
    FeedProvidersRecordingId VARCHAR(3000),
    Identifier VARCHAR(3000),
    FeedProvidersAllocatingPartyId VARCHAR(3000),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersRecordingProprietaryIdentifierId)
);

CREATE TABLE `RELEASES` (
    FeedProvidersReleaseId VARCHAR(3000),
    ICPN VARCHAR(15),
    ReleaseTitle MEDIUMTEXT,
    ReleaseSubTitle MEDIUMTEXT,
    DisplayArtistName MEDIUMTEXT,
    DisplayArtistISNI VARCHAR(15),
    LabelName VARCHAR(3000),
    ReleaseDate VARCHAR(10),
    OriginalDataProviderName VARCHAR(3000),
    OriginalDataProviderDPID VARCHAR(3000),
    IsDataProvidedAsReceived VARCHAR(6),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersReleaseId)
);

CREATE TABLE `RELEASE_IDENTIFIERS` (
    FeedProvidersReleaseProprietaryIdentifierId VARCHAR(3000),
    FeedProvidersReleaseId VARCHAR(3000),
    Identifier VARCHAR(3000),
    FeedProvidersAllocatingPartyId VARCHAR(3000),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersReleaseProprietaryIdentifierId)
);

CREATE TABLE `WORK_RECORDINGS` (
    FeedProvidersLinkId VARCHAR(3000),
    FeedProvidersWorkId VARCHAR(3000),
    FeedProvidersRecordingId VARCHAR(3000),
    snapshotid INT,
    PRIMARY KEY (FeedProvidersLinkId)
);

CREATE TABLE `UNCLAIMED_WORKS` (
    FeedProvidersRightShareId VARCHAR(3000),
    FeedProvidersRecordingId VARCHAR(3000),
    FeedProvidersWorkId VARCHAR(3000),
    ISRC  VARCHAR(11),
    DspRecordingId  VARCHAR(3000),
    RecordingTitle MEDIUMTEXT,
    RecordingSubTitle MEDIUMTEXT,
    AlternativeRecordingTitle MEDIUMTEXT,
    DisplayArtistName MEDIUMTEXT,
    DisplayArtistISNI VARCHAR(15),
    Duration VARCHAR(100),
    UnclaimedPercentage FLOAT,
    PercentileForPrioritisation INTEGER,
    snapshotid INT
);
