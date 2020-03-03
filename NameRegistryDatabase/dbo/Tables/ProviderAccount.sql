CREATE TABLE [dbo].[ProviderAccount] (
    [ID]         INT            IDENTITY (1, 1) NOT NULL,
    [ProviderID] INT            NOT NULL,
    [Account]    NVARCHAR (100) NOT NULL,
    [Alias]      NVARCHAR (100) NULL,
    CONSTRAINT [PK__Provider__3214EC279C69EAAE] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProviderAccount_Provider] FOREIGN KEY ([ProviderID]) REFERENCES [dbo].[Provider] ([ID])
);


