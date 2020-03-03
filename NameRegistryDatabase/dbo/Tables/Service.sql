CREATE TABLE [dbo].[Service] (
    [ID]                    INT             IDENTITY (1, 1) NOT NULL,
    [Name]                  NVARCHAR (100)  NOT NULL,
    [Description]           NVARCHAR (1000) NULL,
    [Shortname]             NVARCHAR (3)    NOT NULL,
    [ServiceSequenceTypeID] VARCHAR (5)     NULL,
    [SequenceLength]        TINYINT         CONSTRAINT [DF_Service_SequenceLength] DEFAULT ((5)) NOT NULL,
    CONSTRAINT [PK__Service__3214EC2756EFA012] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Service_ServiceSequenceType] FOREIGN KEY ([ServiceSequenceTypeID]) REFERENCES [dbo].[ServiceSequenceType] ([ID])
);


