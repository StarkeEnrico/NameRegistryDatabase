CREATE TABLE [dbo].[Registrations] (
    [ID]             UNIQUEIDENTIFIER            NOT NULL,
    [Name]           NVARCHAR (50) NOT NULL,
    [EnvironmentID] CHAR(1)           NOT NULL,
    [Suffix]         NVARCHAR(50)            NULL,
    [ProviderAccountID] INT NULL, 
    [ServiceID] INT NULL, 
    [ServiceRegionID] INT NULL, 
    [RegistrationStatusID] INT NULL, 
    [CreatedBy] NVARCHAR(50) NOT NULL, 
    [ChangedBy] NVARCHAR(50) NULL, 
    [WhenCreated] DATETIME NOT NULL, 
    [WhenChanged] DATETIME NOT NULL, 
    CONSTRAINT [name_pk] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_NameRegistry_Environment] FOREIGN KEY ([EnvironmentID]) REFERENCES [Environment]([ID]), 
    CONSTRAINT [FK_NameRegistry_ProviderAccount] FOREIGN KEY ([ProviderAccountID]) REFERENCES [ProviderAccount]([ID]), 
    CONSTRAINT [FK_NameRegistry_Service] FOREIGN KEY ([ServiceID]) REFERENCES [Service]([ID]), 
    CONSTRAINT [FK_NameRegistry_ServiceRegion] FOREIGN KEY ([ServiceRegionID]) REFERENCES [ServiceRegion]([ID]), 
    CONSTRAINT [FK_NameRegistry_RegistrationStatus] FOREIGN KEY ([RegistrationStatusID]) REFERENCES [RegistrationStatus]([ID])
);

