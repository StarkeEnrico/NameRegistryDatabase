CREATE TABLE [dbo].[ServiceMap]
(
	[ID] INT NOT NULL PRIMARY KEY, 
    [ServiceID] INT NULL, 
    [ProviderID] INT NULL, 
    CONSTRAINT [FK_ServiceMap_Service] FOREIGN KEY ([ServiceID]) REFERENCES [Service]([ID]), 
    CONSTRAINT [FK_ServiceMap_Provider] FOREIGN KEY ([ProviderID]) REFERENCES [Provider]([ID])
)
