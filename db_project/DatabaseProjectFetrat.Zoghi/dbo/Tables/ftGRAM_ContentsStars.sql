CREATE TABLE [dbo].[ftGRAM_ContentsStars] (
    [ID]                INT        IDENTITY (1, 1) NOT NULL,
    [Stars]             INT        NULL,
    [ftGRAM_ContentsID] INT        NULL,
    [ftMVC_UsersID]     INT        NULL,
    [Date]              DATETIME   NULL,
    [IP]                CHAR (15)  NULL,
    [Browser]           NCHAR (20) NULL,
    CONSTRAINT [PK_ftGRAM_ContentsStars] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ContentsStars_ftGRAM_Contents] FOREIGN KEY ([ftGRAM_ContentsID]) REFERENCES [dbo].[ftGRAM_Contents] ([ID]),
    CONSTRAINT [FK_ftGRAM_ContentsStars_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

