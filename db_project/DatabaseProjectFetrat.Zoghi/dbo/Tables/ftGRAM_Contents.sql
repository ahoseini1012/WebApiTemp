CREATE TABLE [dbo].[ftGRAM_Contents] (
    [ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [Text]                 NTEXT          NULL,
    [Date_Create]          DATETIME       NULL,
    [ftMVC_UsersID]        INT            NULL,
    [ftMVC_LanguagesID]    INT            NULL,
    [Title]                NVARCHAR (250) NULL,
    [Active]               BIT            NULL,
    [URL]                  NVARCHAR (500) NULL,
    [ViewContent]          INT            NULL,
    [Date_Active]          DATETIME       NULL,
    [ftMVC_UsersID_Active] INT            NULL,
    [Date_Changed]         DATETIME       NULL,
    [URLAddress]           NVARCHAR (500) NULL,
    [Saved]                BIT            NULL,
    CONSTRAINT [PK_ftGRAM_Contents] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_Contents_ftMVC_Languages] FOREIGN KEY ([ftMVC_LanguagesID]) REFERENCES [dbo].[ftMVC_Languages] ([ID]),
    CONSTRAINT [FK_ftGRAM_Contents_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID]),
    CONSTRAINT [FK_ftGRAM_Contents_ftMVC_Users1] FOREIGN KEY ([ftMVC_UsersID_Active]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

