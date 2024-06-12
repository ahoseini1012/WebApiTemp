CREATE TABLE [dbo].[ftMVC_Settings] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (50)   NULL,
    [Value]       NVARCHAR (200) NULL,
    [Active]      BIT            NULL,
    [Description] NTEXT          NULL,
    CONSTRAINT [PK_ftMVC_Settings] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

