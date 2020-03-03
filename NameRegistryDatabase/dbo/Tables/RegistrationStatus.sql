CREATE TABLE [dbo].[RegistrationStatus] (
    [ID]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_RegistrationStatus] PRIMARY KEY CLUSTERED ([ID] ASC)
);


