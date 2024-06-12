CREATE TABLE [dbo].[ftGRAM_ContentsReports] (
    [ID]                    INT           IDENTITY (1, 1) NOT NULL,
    [ftMVC_UsersID]         INT           NULL,
    [ftGRAM_ContentsID]     INT           NULL,
    [Date_Create]           DATETIME      NULL,
    [IP]                    CHAR (15)     NULL,
    [Browser]               NCHAR (20)    NULL,
    [OS]                    NVARCHAR (30) NULL,
    [UUID]                  CHAR (50)     NULL,
    [Message]               NTEXT         NULL,
    [Visited_Date]          DATETIME      NULL,
    [Visited_ftMVC_UsersID] INT           NULL,
    CONSTRAINT [PK_34] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ContentsReports_ftGRAM_Contents] FOREIGN KEY ([ftGRAM_ContentsID]) REFERENCES [dbo].[ftGRAM_Contents] ([ID]),
    CONSTRAINT [FK_ftGRAM_ContentsReports_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

