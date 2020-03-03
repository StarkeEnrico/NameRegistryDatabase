CREATE TABLE [dbo].[Tags] (
    [RegistrationID] UNIQUEIDENTIFIER NOT NULL,
    [TagKey]         NVARCHAR (100)   NOT NULL,
    [TagValue]       NVARCHAR (100)   NOT NULL,
    CONSTRAINT [FK_Registrations_Tags] FOREIGN KEY ([RegistrationID]) REFERENCES [dbo].[Registrations] ([ID])
);

