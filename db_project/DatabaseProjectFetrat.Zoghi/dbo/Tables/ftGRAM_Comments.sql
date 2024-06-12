CREATE TABLE [dbo].[ftGRAM_Comments] (
    [ID]                   INT      IDENTITY (1, 1) NOT NULL,
    [ParentID]             INT      NULL,
    [ftGRAM_ContentsID]    INT      NULL,
    [ftMVC_UsersID]        INT      NULL,
    [Text]                 NTEXT    NULL,
    [Date_Create]          DATETIME NULL,
    [ftMVC_UsersID_Active] INT      NULL,
    [Date_Active]          DATETIME NULL,
    [Type_Active]          BIT      NULL,
    [Date_Changed]         DATETIME NULL,
    [User_Visit]           BIT      NULL,
    [Admin_Visit]          BIT      NULL,
    CONSTRAINT [PK_ftGRAM_Comments] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_Comments_ftGRAM_Contents] FOREIGN KEY ([ftGRAM_ContentsID]) REFERENCES [dbo].[ftGRAM_Contents] ([ID]),
    CONSTRAINT [FK_ftGRAM_Comments_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID]),
    CONSTRAINT [FK_ftGRAM_Comments_ftMVC_Users1] FOREIGN KEY ([ftMVC_UsersID_Active]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

