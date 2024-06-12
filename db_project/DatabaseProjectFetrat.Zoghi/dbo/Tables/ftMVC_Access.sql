CREATE TABLE [dbo].[ftMVC_Access] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [ParentID]    INT           NOT NULL,
    [Name]        NVARCHAR (50) NULL,
    [Capability]  VARCHAR (50)  NULL,
    [Description] NTEXT         NULL,
    [Sort]        INT           NULL,
    [SoftType]    INT           NULL,
    CONSTRAINT [PK_ftMVC_Access] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

