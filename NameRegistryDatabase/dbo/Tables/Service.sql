CREATE TABLE [dbo].[Service]
(
	[ID] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(100) NULL, 
    [Description] NVARCHAR(1000) NULL, 
    [Shortname] NVARCHAR(3) NULL
)
