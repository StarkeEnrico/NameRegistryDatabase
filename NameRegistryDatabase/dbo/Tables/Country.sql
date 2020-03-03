CREATE TABLE [dbo].[Country] (
    [CountryCode] CHAR (2)      NOT NULL,
    [Name]        NVARCHAR (50) NOT NULL,
    [GeoRegion]   NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED ([CountryCode] ASC)
);


