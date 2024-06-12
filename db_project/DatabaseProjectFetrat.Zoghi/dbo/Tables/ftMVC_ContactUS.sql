CREATE TABLE [dbo].[ftMVC_ContactUS] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [ftMVC_UsersID]      INT            NULL,
    [Date_Create]        DATETIME       NULL,
    [Name]               NVARCHAR (100) NULL,
    [Email]              NVARCHAR (100) NULL,
    [Text]               NTEXT          NULL,
    [ftMVC_Users_Visit]  INT            NULL,
    [Date_Visit]         DATETIME       NULL,
    [ftMVC_Users_Answer] INT            NULL,
    [Date_Answer]        DATETIME       NULL,
    [Answer]             NTEXT          NULL,
    [Tell]               NVARCHAR (50)  NULL,
    CONSTRAINT [PK_ftMVC_ContactUS] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_ContactUS_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID]),
    CONSTRAINT [FK_ftMVC_ContactUS_ftMVC_Users1] FOREIGN KEY ([ftMVC_Users_Visit]) REFERENCES [dbo].[ftMVC_Users] ([ID]),
    CONSTRAINT [FK_ftMVC_ContactUS_ftMVC_Users2] FOREIGN KEY ([ftMVC_Users_Answer]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

