CREATE TABLE [dbo].[ftGRAM_CommentsLikes] (
    [ID]                INT IDENTITY (1, 1) NOT NULL,
    [ftGRAM_CommentsID] INT NULL,
    [ftMVC_UsersID]     INT NULL,
    [LiksType]          INT NULL,
    [User_Visit]        BIT NULL,
    [Admin_Visit]       BIT NULL,
    CONSTRAINT [PK_ftGRAM_CommentsLikes] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_CommentsLikes_ftGRAM_Comments] FOREIGN KEY ([ftGRAM_CommentsID]) REFERENCES [dbo].[ftGRAM_Comments] ([ID]),
    CONSTRAINT [FK_ftGRAM_CommentsLikes_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

