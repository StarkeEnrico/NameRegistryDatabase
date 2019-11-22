CREATE TABLE [dbo].[Environment] (
    [ID]          CHAR            NOT NULL,
    [Name] NVARCHAR (20) NOT NULL,
    CONSTRAINT [environment_pk] PRIMARY KEY CLUSTERED ([ID] ASC)
);

