CREATE TABLE [dbo].[ftGRAM_Messages] (
    [ID]             INT      IDENTITY (1, 1) NOT NULL,
    [ftMVC_UsersID]  INT      NULL,
    [ftMVC_GroupsID] INT      NULL,
    [Date_Create]    DATETIME NULL,
    [Message]        NTEXT    NULL,
    CONSTRAINT [PK_ftGRAM_Messages] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_Messages_ftMVC_Groups] FOREIGN KEY ([ftMVC_GroupsID]) REFERENCES [dbo].[ftMVC_Groups] ([ID]),
    CONSTRAINT [FK_ftGRAM_Messages_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

