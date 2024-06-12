CREATE TABLE [dbo].[ftMVC_DisposableTemp] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Date_Create] DATETIME      NULL,
    [Phone]       CHAR (11)     NULL,
    [Email]       NVARCHAR (50) NULL,
    [Code]        INT           NULL,
    CONSTRAINT [PK_ftMVC_DisposableTemp] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

