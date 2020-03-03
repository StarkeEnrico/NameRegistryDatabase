CREATE TABLE [dbo].[NamePattern] (
    [ID]          INT             IDENTITY (1, 1) NOT NULL,
    [ServiceID]   INT             NOT NULL,
    [NamePattern] NVARCHAR (4000) NOT NULL,
    CONSTRAINT [PK_NamePattern] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_NamePattern_Service] FOREIGN KEY ([ServiceID]) REFERENCES [dbo].[Service] ([ID])
);


