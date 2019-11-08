CREATE TABLE [dbo].[ProviderAccount]
(
	[ID] INT NOT NULL PRIMARY KEY, 
    [ProviderID] INT NOT NULL, 
    [Account] NVARCHAR(100) NULL, 
    [Alias] NVARCHAR(100) NULL, 
    CONSTRAINT [FK_ProviderAccount_Provider] FOREIGN KEY ([ProviderID]) REFERENCES [Provider]([ID])
)
