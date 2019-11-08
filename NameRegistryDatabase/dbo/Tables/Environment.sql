CREATE TABLE [dbo].[Environment] (
    [id]          INT            IDENTITY (1, 1) NOT NULL,
    [environment] NVARCHAR (100) NOT NULL,
    CONSTRAINT [environment_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

