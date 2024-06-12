CREATE TABLE [dbo].[ftGRAM_ContentsVisitLOG] (
    [ID]                INT           IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ContentsID] INT           NULL,
    [ftMVC_UsersID]     INT           NULL,
    [Date]              DATETIME      NULL,
    [IP]                CHAR (15)     NULL,
    [Browser]           NCHAR (500)   NULL,
    [OS]                NVARCHAR (30) NULL,
    [UUID]              CHAR (50)     NULL,
    CONSTRAINT [PK_ftGRAM_ContentsVisitLOG] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ContentsVisitLOG_ftGRAM_Contents] FOREIGN KEY ([ftGRAM_ContentsID]) REFERENCES [dbo].[ftGRAM_Contents] ([ID]),
    CONSTRAINT [FK_ftGRAM_ContentsVisitLOG_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

