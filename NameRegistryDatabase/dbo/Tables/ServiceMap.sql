CREATE TABLE [dbo].[ServiceMap] (
    [ID]         INT IDENTITY (1, 1) NOT NULL,
    [ServiceID]  INT NOT NULL,
    [ProviderID] INT NOT NULL,
    CONSTRAINT [PK__ServiceM__3214EC279C6781F3] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ServiceMap_Provider] FOREIGN KEY ([ProviderID]) REFERENCES [dbo].[Provider] ([ID]),
    CONSTRAINT [FK_ServiceMap_Service] FOREIGN KEY ([ServiceID]) REFERENCES [dbo].[Service] ([ID])
);


