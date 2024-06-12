CREATE TABLE [dbo].[ftMVC_ContentsShow] (
    [ID]               INT      IDENTITY (1, 1) NOT NULL,
    [ftMVC_ContentsID] INT      NULL,
    [ftMVC_UsersID]    INT      NULL,
    [Date_Create]      DATETIME NULL,
    [Date_Start]       DATETIME NULL,
    [Date_End]         DATETIME NULL,
    CONSTRAINT [PK_ftMVC_ContentsShow] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_ContentsShow_ftMVC_Contents] FOREIGN KEY ([ftMVC_ContentsID]) REFERENCES [dbo].[ftMVC_Contents] ([ID]),
    CONSTRAINT [FK_ftMVC_ContentsShow_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

