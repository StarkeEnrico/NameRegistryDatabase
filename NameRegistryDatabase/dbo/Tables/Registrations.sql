CREATE TABLE [dbo].[NameRegistry] (
    [id]             INT            IDENTITY (1, 1) NOT NULL,
    [Name]           NVARCHAR (100) NOT NULL,
    [environment_id] INT            NOT NULL,
    [active]         INT            NULL,
    CONSTRAINT [name_pk] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [NameRegistry_Environment_id_FK] FOREIGN KEY ([environment_id]) REFERENCES [dbo].[Environment] ([id])
);

