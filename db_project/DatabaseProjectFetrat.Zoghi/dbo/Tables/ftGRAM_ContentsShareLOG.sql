CREATE TABLE [dbo].[ftGRAM_ContentsShareLOG] (
    [ID]                INT           IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ContentsID] INT           NULL,
    [ftMVC_UsersID]     INT           NULL,
    [ShareTO]           NVARCHAR (50) NULL,
    [WithName]          BIT           NULL,
    [Date]              DATETIME      NULL,
    [IP]                CHAR (15)     NULL,
    [Browser]           NCHAR (500)   NULL,
    [OS]                NVARCHAR (30) NULL,
    [UUID]              CHAR (50)     NULL,
    CONSTRAINT [PK_ftGRAM_ContentsShareLOG] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ContentsShareLOG_ftGRAM_Contents] FOREIGN KEY ([ftGRAM_ContentsID]) REFERENCES [dbo].[ftGRAM_Contents] ([ID]),
    CONSTRAINT [FK_ftGRAM_ContentsShareLOG_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

