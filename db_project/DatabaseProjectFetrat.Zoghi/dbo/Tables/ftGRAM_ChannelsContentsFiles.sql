CREATE TABLE [dbo].[ftGRAM_ChannelsContentsFiles] (
    [ID]                        INT            IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ChannelsContentsID] INT            NULL,
    [FileName]                  NVARCHAR (500) NULL,
    [Type]                      INT            NULL,
    [Sort]                      INT            NULL,
    CONSTRAINT [PK_ftGRAM_ChannelsContentsFiles] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsFiles_ftGRAM_ChannelsContents] FOREIGN KEY ([ftGRAM_ChannelsContentsID]) REFERENCES [dbo].[ftGRAM_ChannelsContents] ([ID])
);


GO

