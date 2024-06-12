CREATE TABLE [dbo].[ftMVC_Groups] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (50) NULL,
    [Description] NTEXT         NULL,
    [Sort]        INT           NULL,
    [Active]      BIT           NULL,
    CONSTRAINT [PK_ftMVC_Groups] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

