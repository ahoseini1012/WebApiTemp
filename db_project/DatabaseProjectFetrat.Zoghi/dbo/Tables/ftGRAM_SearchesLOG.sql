CREATE TABLE [dbo].[ftGRAM_SearchesLOG] (
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [Text]           NVARCHAR (50) NULL,
    [ftMVC_UsersID]  INT           NULL,
    [Date]           DATETIME      NULL,
    [IP]             CHAR (15)     NULL,
    [Browser]        NCHAR (20)    NULL,
    [Filter_Section] INT           NULL,
    [Filter_File]    CHAR (10)     NULL,
    [Clear]          BIT           NULL,
    [OS]             NVARCHAR (30) NULL,
    [UUID]           CHAR (50)     NULL,
    CONSTRAINT [PK_ftGRAM_SearchesLOG] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

