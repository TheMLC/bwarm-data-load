DROP TABLE IF EXISTS [dbo].[SNAPSHOTS];
DROP TABLE IF EXISTS [dbo].[PUBLIC_DB_STATS];
DROP TABLE IF EXISTS [dbo].[WORKS];
DROP TABLE IF EXISTS [dbo].[ALTERNATIVE_WORK_TITLES];
DROP TABLE IF EXISTS [dbo].[WORK_IDENTIFIERS];
DROP TABLE IF EXISTS [dbo].[PARTIES];
DROP TABLE IF EXISTS [dbo].[WORK_RIGHT_SHARES];
DROP TABLE IF EXISTS [dbo].[RECORDINGS];
DROP TABLE IF EXISTS [dbo].[ALTERNATIVE_RECORDING_TITLES];
DROP TABLE IF EXISTS [dbo].[RECORDING_IDENTIFIERS];
DROP TABLE IF EXISTS [dbo].[RELEASES];
DROP TABLE IF EXISTS [dbo].[RELEASE_IDENTIFIERS];
DROP TABLE IF EXISTS [dbo].[WORK_RECORDINGS];
DROP TABLE IF EXISTS [dbo].[UNCLAIMED_WORKS];

CREATE TABLE [dbo].[SNAPSHOTS] (
    [snapshotid] [int] IDENTITY(1,1) NOT NULL,
    [created_date] [datetime],
    CONSTRAINT [PK_snapshotid] PRIMARY KEY CLUSTERED 
        (
	        [snapshotid] ASC
        )
);

CREATE TABLE [dbo].[WORKS] (
    [FeedProvidersWorkId] [varchar](900),
    [ISWC] [varchar](11),
    [WorkTitle] [varchar](max),
    [OpusNumber] [varchar](900),
    [ComposerCatalogNumber] [varchar](900),
    [NominalDuration] [varchar](900),
    [HasRightsInDispute] [varchar](6),
    [TerritoryOfPublicDomain] [varchar](max),
    [IsArrangementOfTraditionalWork] [varchar](6),
    [AlternativeWorkForUsStatutoryReversion] [varchar](900),
    [UsStatutoryReversionDate] [varchar](100),
    [snapshotid] [int],
    CONSTRAINT [PK_FeedProvidersWorkId] PRIMARY KEY CLUSTERED 
        (
	        [FeedProvidersWorkId] ASC
        )
);

CREATE TABLE [dbo].[ALTERNATIVE_WORK_TITLES] (
    [FeedProvidersWorkAlternativeTitleId] [varchar](900),
    [FeedProvidersWorkId] [varchar](900),
    [AlternativeTitle] [varchar](max),
    [LanguageAndScriptCode] [varchar](900),
    [TitleType] [varchar](900),
    [snapshotid] [int],
    CONSTRAINT [PK_FeedProvidersWorkAlternativeTitleId] PRIMARY KEY CLUSTERED 
        (
	        [FeedProvidersWorkAlternativeTitleId] ASC
        )
);

CREATE TABLE [dbo].[WORK_IDENTIFIERS] (
    [FeedProvidersWorkProprietaryIdentifierId] [varchar](900),
    [FeedProvidersWorkId] [varchar](900),
    [Identifier] [varchar](900),
    [FeedProvidersAllocatingPartyId] [varchar](900),
    [snapshotid] [int],
    CONSTRAINT [PK_FeedProvidersWorkProprietaryIdentifierId] PRIMARY KEY CLUSTERED 
        (
	        [FeedProvidersWorkProprietaryIdentifierId] ASC
        )
);

CREATE TABLE [dbo].[PARTIES] (
    [FeedProvidersPartyId] [varchar](900),
    [ISNI] [varchar](15),
    [IpiNameNumber] [bigint],
    [CisacSocietyId] [varchar](3),
    [DPID] [varchar](100),
    [FullName] [varchar](max),
    [NamesBeforeKeyName] [varchar](max),
    [KeyName] [varchar](max),
    [NamesAfterKeyName] [varchar](max),
    [snapshotid] [int]
    CONSTRAINT [PK_FeedProvidersPartyId] PRIMARY KEY CLUSTERED 
        (
	        [FeedProvidersPartyId] ASC
        )
);

CREATE TABLE [dbo].[WORK_RIGHT_SHARES] (
    [FeedProvidersWorkRightShareId] [VARCHAR](900),
    [FeedProvidersWorkId] [VARCHAR](900),
    [FeedProvidersPartyId] [VARCHAR](900),
    [PartyRole] [VARCHAR](100),
    [RightSharePercentage] [FLOAT], 
    [RightShareType] [VARCHAR](100),
    [RightsType] [VARCHAR](100),
    [ValidityStartDate] [VARCHAR](10),
    [ValidityEndDate] [VARCHAR](10),
    [FeedProvidersParentWorkRightShareId] [VARCHAR](900),
    [TerritoryCode] [VARCHAR](900),
    [UseType] [VARCHAR](900),
    [snapshotid] [INT],
    CONSTRAINT [PK_FeedProvidersWorkRightShareId] PRIMARY KEY CLUSTERED 
        (
	        [FeedProvidersWorkRightShareId] ASC
        )
);

CREATE TABLE [dbo].[RECORDINGS] (
    [FeedProvidersRecordingId] [VARCHAR](900),
    [ISRC] [VARCHAR](12),
    [RecordingTitle] [varchar](max), 
    [RecordingSubTitle] [varchar](max), 
    [DisplayArtistName] [varchar](max), 
    [DisplayArtistISNI] [VARCHAR](16),
    [PLine] [VARCHAR](900),
    [Duration]  [VARCHAR](100),
    [FeedProvidersReleaseId] [VARCHAR](900),
    [StudioProducerName] [varchar](max), 
    [StudioProducerId] [VARCHAR](900),
    [OriginalDataProviderName] [VARCHAR](900),
    [OriginalDataProviderDPID] [VARCHAR](900),
    [IsDataProvidedAsReceived] [VARCHAR](6),
    [snapshotid] [INT],
    CONSTRAINT [PK_FeedProvidersRecordingId] PRIMARY KEY CLUSTERED 
        (
	        [FeedProvidersRecordingId] ASC
        )
);

CREATE TABLE [dbo].[ALTERNATIVE_RECORDING_TITLES] (
    [FeedProvidersRecordingAlternativeTitleId] [VARCHAR](900),
    [FeedProvidersRecordingId] [VARCHAR](900),
    [AlternativeTitle] [varchar](max),
    [LanguageAndScriptCode] [VARCHAR](900),
    [TitleType] [VARCHAR](900),
    [snapshotid] [INT],
    CONSTRAINT [PK_FeedProvidersRecordingAlternativeTitleId] PRIMARY KEY CLUSTERED 
        (
	        [FeedProvidersRecordingAlternativeTitleId] ASC
        )
);

CREATE TABLE [dbo].[RECORDING_IDENTIFIERS] (
    [FeedProvidersRecordingProprietaryIdentifierId] [VARCHAR](900),
    [FeedProvidersRecordingId] [VARCHAR](900),
    [Identifier] [VARCHAR](900),
    [FeedProvidersAllocatingPartyId] [VARCHAR](900),
    [snapshotid] [INT],
    CONSTRAINT [PK_FeedProvidersRecordingProprietaryIdentifierId] PRIMARY KEY CLUSTERED 
        (
	        [FeedProvidersRecordingProprietaryIdentifierId] ASC
        )
);

CREATE TABLE [dbo].[RELEASES] (
    [FeedProvidersReleaseId] [VARCHAR](900),
    [ICPN] [VARCHAR](15),
    [ReleaseTitle] [VARCHAR](MAX),
    [ReleaseSubTitle] [VARCHAR](MAX),
    [DisplayArtistName] [VARCHAR](MAX),
    [DisplayArtistISNI] [VARCHAR](16),
    [LabelName] [VARCHAR](900),
    [ReleaseDate] [VARCHAR](10),
    [OriginalDataProviderName] [VARCHAR](900),
    [OriginalDataProviderDPID] [VARCHAR](900),
    [IsDataProvidedAsReceived] [VARCHAR](6),
    [snapshotid] [INT],
    CONSTRAINT [PK_FeedProvidersReleaseId] PRIMARY KEY CLUSTERED 
        (
	        [FeedProvidersReleaseId] ASC
        )
);

CREATE TABLE [dbo].[RELEASE_IDENTIFIERS] (
    [FeedProvidersReleaseProprietaryIdentifierId] [VARCHAR](900),
    [FeedProvidersReleaseId] [VARCHAR](900),
    [Identifier] [VARCHAR](900),
    [FeedProvidersAllocatingPartyId] [VARCHAR](900),
    [snapshotid] [INT],
    CONSTRAINT [PK_FeedProvidersReleaseProprietaryIdentifierId] PRIMARY KEY CLUSTERED 
        (
	        [FeedProvidersReleaseProprietaryIdentifierId] ASC
        )
);

CREATE TABLE [dbo].[WORK_RECORDINGS] (
    [FeedProvidersLinkId] [VARCHAR](900),
    [FeedProvidersWorkId] [VARCHAR](900),
    [FeedProvidersRecordingId] [VARCHAR](900),
    [snapshotid] [INT],
    CONSTRAINT [PK_FeedProvidersLinkId] PRIMARY KEY CLUSTERED 
        (
	        [FeedProvidersLinkId] ASC
        )
);

CREATE TABLE [dbo].[UNCLAIMED_WORKS] (
    [FeedProvidersRightShareId] [VARCHAR](900),
    [FeedProvidersRecordingId] [VARCHAR](900),
    [FeedProvidersWorkId] [VARCHAR](900),
    [ISRC]  [VARCHAR](12),
    [DspRecordingId]  [VARCHAR](900),
    [RecordingTitle] [VARCHAR](MAX),
    [RecordingSubTitle] [VARCHAR](MAX),
    [AlternativeRecordingTitle] [VARCHAR](MAX),
    [DisplayArtistName] [VARCHAR](MAX),
    [DisplayArtistISNI] [VARCHAR](16),
    [Duration] [VARCHAR](100),
    [UnclaimedPercentage] [FLOAT],
    [PercentileForPrioritisation] [FLOAT],
    [snapshotid] [INT],
    CONSTRAINT [PK_FeedProvidersRightShareId] PRIMARY KEY CLUSTERED 
        (
	        [FeedProvidersRightShareId] ASC
        )
);
