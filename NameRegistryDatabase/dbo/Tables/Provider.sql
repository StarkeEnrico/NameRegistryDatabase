CREATE TABLE [dbo].[Provider] (
    [ID]          INT             IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (100)  NOT NULL,
    [Description] NVARCHAR (4000) NULL,
    CONSTRAINT [PK__Provider__3214EC271DCAD017] PRIMARY KEY CLUSTERED ([ID] ASC)
);


