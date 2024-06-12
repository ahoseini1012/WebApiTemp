CREATE TABLE [dbo].[ftMVC_CommentsLike] (
    [ID]               INT      IDENTITY (1, 1) NOT NULL,
    [ftMVC_CommentsID] INT      NULL,
    [ftMVC_UsersID]    INT      NULL,
    [Likes]            BIT      NULL,
    [Date_create]      DATETIME NULL,
    CONSTRAINT [PK_ftMVC_CommentsLike] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_CommentsLike_ftMVC_Comments] FOREIGN KEY ([ftMVC_CommentsID]) REFERENCES [dbo].[ftMVC_Comments] ([ID]),
    CONSTRAINT [FK_ftMVC_CommentsLike_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

