CREATE TABLE [dbo].[ftGRAM_ChannelsContentsCategories] (
    [ID]                        INT IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ChannelsContentsID] INT NULL,
    [ftMVC_CategoriesID]        INT NULL,
    CONSTRAINT [PK_ftGRAM_ChannelsContentsCategories] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsCategories_ftGRAM_ChannelsContents] FOREIGN KEY ([ftGRAM_ChannelsContentsID]) REFERENCES [dbo].[ftGRAM_ChannelsContents] ([ID]),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsCategories_ftMVC_Categories] FOREIGN KEY ([ftMVC_CategoriesID]) REFERENCES [dbo].[ftMVC_Categories] ([ID])
);


GO

