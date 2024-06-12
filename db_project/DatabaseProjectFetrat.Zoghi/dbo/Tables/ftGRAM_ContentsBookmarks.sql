CREATE TABLE [dbo].[ftGRAM_ContentsBookmarks] (
    [ID]                 INT      IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ContentsID]  INT      NULL,
    [ftGRAM_BookmarksID] INT      NULL,
    [ftMVC_UsersID]      INT      NULL,
    [Date_Create]        DATETIME NULL,
    [Download]           BIT      NULL,
    CONSTRAINT [PK_ftGRAM_ContentsBookmarks] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ContentsBookmarks_ftGRAM_Bookmarks] FOREIGN KEY ([ftGRAM_BookmarksID]) REFERENCES [dbo].[ftGRAM_Bookmarks] ([ID]),
    CONSTRAINT [FK_ftGRAM_ContentsBookmarks_ftGRAM_Contents] FOREIGN KEY ([ftGRAM_ContentsID]) REFERENCES [dbo].[ftGRAM_Contents] ([ID]),
    CONSTRAINT [FK_ftGRAM_ContentsBookmarks_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

