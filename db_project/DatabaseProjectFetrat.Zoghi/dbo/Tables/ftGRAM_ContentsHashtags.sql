CREATE TABLE [dbo].[ftGRAM_ContentsHashtags] (
    [ID]                INT IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ContentsID] INT NULL,
    [ftGRAM_HashtagsID] INT NULL,
    CONSTRAINT [PK_ftGRAM_ContentsHashtags] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ContentsHashtags_ftGRAM_Contents] FOREIGN KEY ([ftGRAM_ContentsID]) REFERENCES [dbo].[ftGRAM_Contents] ([ID]),
    CONSTRAINT [FK_ftGRAM_ContentsHashtags_ftGRAM_Hashtags] FOREIGN KEY ([ftGRAM_HashtagsID]) REFERENCES [dbo].[ftGRAM_Hashtags] ([ID])
);


GO

