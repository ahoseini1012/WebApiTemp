CREATE TABLE [dbo].[ftMVC_EditorialKeywords] (
    [ID]                INT IDENTITY (1, 1) NOT NULL,
    [ftMVC_EditorialID] INT NULL,
    [ftMVC_KeywordsID]  INT NULL,
    CONSTRAINT [PK_ftMVC_EditorialKeywords] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_EditorialKeywords_ftMVC_Editorial1] FOREIGN KEY ([ftMVC_EditorialID]) REFERENCES [dbo].[ftMVC_Editorial] ([ID]),
    CONSTRAINT [FK_ftMVC_EditorialKeywords_ftMVC_Keywords] FOREIGN KEY ([ftMVC_KeywordsID]) REFERENCES [dbo].[ftMVC_Keywords] ([ID])
);


GO

