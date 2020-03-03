CREATE TABLE [dbo].[Registrations] (
    [ID]                   UNIQUEIDENTIFIER CONSTRAINT [DF_Registrations_ID] DEFAULT (newid()) NOT NULL,
    [Name]                 NVARCHAR (50)    NOT NULL,
    [EnvironmentID]        CHAR (1)         NOT NULL,
    [Suffix]               NVARCHAR (50)    NULL,
    [ProviderAccountID]    INT              NOT NULL,
    [ServiceID]            INT              NOT NULL,
    [ServiceRegionID]      INT              NOT NULL,
    [RegistrationStatusID] INT              NOT NULL,
    [CreatedBy]            NVARCHAR (50)    NOT NULL,
    [ChangedBy]            NVARCHAR (50)    NULL,
    [WhenCreated]          DATETIME         CONSTRAINT [DF_Registrations_WhenCreated] DEFAULT (getdate()) NOT NULL,
    [WhenChanged]          DATETIME         NULL,
    [ReferenceObject]      NVARCHAR (512)   NULL,
    CONSTRAINT [PK_Registrations] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Registrations_Environment] FOREIGN KEY ([EnvironmentID]) REFERENCES [dbo].[Environment] ([ID]),
    CONSTRAINT [FK_Registrations_ProviderAccount] FOREIGN KEY ([ProviderAccountID]) REFERENCES [dbo].[ProviderAccount] ([ID]),
    CONSTRAINT [FK_Registrations_RegistrationStatus] FOREIGN KEY ([RegistrationStatusID]) REFERENCES [dbo].[RegistrationStatus] ([ID]),
    CONSTRAINT [FK_Registrations_Service] FOREIGN KEY ([ServiceID]) REFERENCES [dbo].[Service] ([ID])
);



