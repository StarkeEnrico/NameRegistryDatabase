CREATE TABLE [dbo].[Environment] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (100) NOT NULL,
    CONSTRAINT [environment_pk] PRIMARY KEY CLUSTERED ([ID] ASC)
);

