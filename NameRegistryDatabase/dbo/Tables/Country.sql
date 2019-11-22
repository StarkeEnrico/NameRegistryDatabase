CREATE TABLE [dbo].[Country]
(
	[CountryCode] CHAR(2) NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NULL, 
    [GeoRegion] NVARCHAR(20) NULL
)
