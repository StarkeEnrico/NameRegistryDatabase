CREATE TABLE [dbo].[ServiceRegion] (
    [ID]          INT             IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (100)  NOT NULL,
    [Description] NVARCHAR (1000) NULL,
    [CountryCode] CHAR (2)        NOT NULL,
    [ProviderID]  INT             NOT NULL,
    CONSTRAINT [PK_ServiceRegion] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ServiceRegion_Country] FOREIGN KEY ([CountryCode]) REFERENCES [dbo].[Country] ([CountryCode]),
    CONSTRAINT [FK_ServiceRegion_Provider] FOREIGN KEY ([ProviderID]) REFERENCES [dbo].[Provider] ([ID])
);


