CREATE TABLE [dbo].[ftMVC_ContentsKeywords] (
    [ID]               INT IDENTITY (1, 1) NOT NULL,
    [ftMVC_ContentsID] INT NULL,
    [ftMVC_KeywordsID] INT NULL,
    CONSTRAINT [PK_ftMVC_ContentsKeywords] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_ContentsKeywords_ftMVC_Contents] FOREIGN KEY ([ftMVC_ContentsID]) REFERENCES [dbo].[ftMVC_Contents] ([ID]),
    CONSTRAINT [FK_ftMVC_ContentsKeywords_ftMVC_Keywords] FOREIGN KEY ([ftMVC_KeywordsID]) REFERENCES [dbo].[ftMVC_Keywords] ([ID])
);


GO

