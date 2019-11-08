CREATE TABLE [dbo].[NamePattern]
(
	[ID] INT NOT NULL PRIMARY KEY, 
    CONSTRAINT [FK_NamePattern_Service] FOREIGN KEY ([ServiceID]) REFERENCES [Service]([ID])
)
