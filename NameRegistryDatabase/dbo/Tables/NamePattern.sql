CREATE TABLE [dbo].[NamePattern]
(
	[ID] INT NOT NULL PRIMARY KEY, 
    [ServiceID] INT NULL, 
    [NamePattern] NVARCHAR(4000) NULL, 
    CONSTRAINT [FK_NamePattern_Service] FOREIGN KEY ([ServiceID]) REFERENCES [Service]([ID])
)
