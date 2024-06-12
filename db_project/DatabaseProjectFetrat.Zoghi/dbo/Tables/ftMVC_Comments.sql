CREATE TABLE [dbo].[ftMVC_Comments] (
    [ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [ParentID]             INT            NULL,
    [ftMVC_UsersID]        INT            NULL,
    [ftMVC_ContentsID]     INT            NULL,
    [Date_Create]          DATETIME       NULL,
    [Name]                 NVARCHAR (100) NULL,
    [Email]                NVARCHAR (100) NULL,
    [Text]                 NTEXT          NULL,
    [ftMVC_UsersID_Active] INT            NULL,
    [Date_Active]          DATETIME       NULL,
    [ftMVC_UsersID_Visit]  INT            NULL,
    [Date_Visit]           DATETIME       NULL,
    CONSTRAINT [PK_ftMVC_Comments] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_Comments_ftMVC_Contents] FOREIGN KEY ([ftMVC_ContentsID]) REFERENCES [dbo].[ftMVC_Contents] ([ID]),
    CONSTRAINT [FK_ftMVC_Comments_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID]),
    CONSTRAINT [FK_ftMVC_Comments_ftMVC_Users1] FOREIGN KEY ([ftMVC_UsersID_Active]) REFERENCES [dbo].[ftMVC_Users] ([ID]),
    CONSTRAINT [FK_ftMVC_Comments_ftMVC_Users2] FOREIGN KEY ([ftMVC_UsersID_Visit]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

