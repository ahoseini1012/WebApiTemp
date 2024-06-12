CREATE TABLE [dbo].[ftGRAM_ChannelsContentsHashtags] (
    [ID]                        INT IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ChannelsContentsID] INT NULL,
    [ftGRAM_HashtagsID]         INT NULL,
    CONSTRAINT [PK_ftGRAM_ChannelsContentsHashtags] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsHashtags_ftGRAM_ChannelsContents] FOREIGN KEY ([ftGRAM_ChannelsContentsID]) REFERENCES [dbo].[ftGRAM_ChannelsContents] ([ID]),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsHashtags_ftGRAM_Hashtags] FOREIGN KEY ([ftGRAM_HashtagsID]) REFERENCES [dbo].[ftGRAM_Hashtags] ([ID])
);


GO

