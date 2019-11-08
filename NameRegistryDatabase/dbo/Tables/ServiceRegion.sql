CREATE TABLE [dbo].[ServiceRegion]
(
	[ID] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(100) NULL, 
    [Description] NVARCHAR(4000) NULL, 
    [CountryCode] NVARCHAR(4) NULL, 
    CONSTRAINT [FK_ServiceRegion_Country] FOREIGN KEY ([CountryCode]) REFERENCES [Country]([CountryCode])
)
