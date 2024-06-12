CREATE TABLE [dbo].[ftGRAM_Bookmarks] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [ftMVC_UsersID] INT            NULL,
    [Name]          NVARCHAR (100) NULL,
    CONSTRAINT [PK_ftGRAM_Bookmarks] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_Bookmarks_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

