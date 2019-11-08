CREATE TABLE [dbo].[NameRegistry] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [Name]           NVARCHAR (100) NOT NULL,
    [EnvironmentID] INT            NOT NULL,
    [Suffix]         NVARCHAR(100)            NULL,
    [ProviderAccountID] INT NULL, 
    [ServiceID] INT NULL, 
    [ServiceRegionID] INT NULL, 
    [RegistrationStatusID] INT NULL, 
    [CreatedBy] NVARCHAR(100) NULL, 
    [ChangedBy] NVARCHAR(100) NULL, 
    [WhenCreated] DATETIME NOT NULL, 
    [WhenChanged] DATETIME NULL, 
    CONSTRAINT [name_pk] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_NameRegistry_Environment] FOREIGN KEY ([EnvironmentID]) REFERENCES [Environment]([ID]), 
    CONSTRAINT [FK_NameRegistry_ProviderAccount] FOREIGN KEY ([ProviderAccountID]) REFERENCES [ProviderAccount]([ID]), 
    CONSTRAINT [FK_NameRegistry_Service] FOREIGN KEY ([ServiceID]) REFERENCES [Service]([ID]), 
    CONSTRAINT [FK_NameRegistry_ServiceRegion] FOREIGN KEY ([ServiceRegionID]) REFERENCES [ServiceRegion]([ID]), 
    CONSTRAINT [FK_NameRegistry_RegistrationStatus] FOREIGN KEY ([RegistrationStatusID]) REFERENCES [RegistrationStatus]([ID])
);

