CREATE TABLE [dbo].[ftGRAM_MessagesVisited] (
    [ID]                INT      IDENTITY (1, 1) NOT NULL,
    [ftGRAM_MessagesID] INT      NULL,
    [ftMVC_UsersID]     INT      NULL,
    [Date_Visited]      DATETIME NULL,
    CONSTRAINT [PK_ftGRAM_MessagesVisited] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_MessagesVisited_ftGRAM_Messages] FOREIGN KEY ([ftGRAM_MessagesID]) REFERENCES [dbo].[ftGRAM_Messages] ([ID]),
    CONSTRAINT [FK_ftGRAM_MessagesVisited_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

