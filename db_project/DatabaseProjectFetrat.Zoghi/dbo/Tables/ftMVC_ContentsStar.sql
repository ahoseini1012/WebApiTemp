CREATE TABLE [dbo].[ftMVC_ContentsStar] (
    [ID]               INT      IDENTITY (1, 1) NOT NULL,
    [ftMVC_ContentsID] INT      NULL,
    [ftMVC_UsersID]    INT      NULL,
    [Date_Create]      DATETIME NULL,
    [Stars]            INT      NULL,
    CONSTRAINT [PK_ftMVC_ContentsStars] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_ContentsStar_ftMVC_Contents] FOREIGN KEY ([ftMVC_ContentsID]) REFERENCES [dbo].[ftMVC_Contents] ([ID]),
    CONSTRAINT [FK_ftMVC_ContentsStar_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

