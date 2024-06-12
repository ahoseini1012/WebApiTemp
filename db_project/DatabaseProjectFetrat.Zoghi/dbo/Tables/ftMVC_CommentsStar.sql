CREATE TABLE [dbo].[ftMVC_CommentsStar] (
    [ID]               INT      IDENTITY (1, 1) NOT NULL,
    [ftMVC_CommentsID] INT      NULL,
    [ftMVC_UsersID]    INT      NULL,
    [Date_Create]      DATETIME NULL,
    [Stars]            INT      NULL,
    CONSTRAINT [PK_ftMVC_CommentsStar] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_CommentsStar_ftMVC_Comments] FOREIGN KEY ([ftMVC_CommentsID]) REFERENCES [dbo].[ftMVC_Comments] ([ID]),
    CONSTRAINT [FK_ftMVC_CommentsStar_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

