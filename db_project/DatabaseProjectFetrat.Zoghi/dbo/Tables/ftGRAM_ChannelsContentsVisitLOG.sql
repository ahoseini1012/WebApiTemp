CREATE TABLE [dbo].[ftGRAM_ChannelsContentsVisitLOG] (
    [ID]                        INT           IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ChannelsContentsID] INT           NULL,
    [ftMVC_UsersID]             INT           NULL,
    [Date]                      DATETIME      NULL,
    [IP]                        CHAR (15)     NULL,
    [Browser]                   NCHAR (500)   NULL,
    [OS]                        NVARCHAR (30) NULL,
    [UUID]                      CHAR (50)     NULL,
    CONSTRAINT [PK_ftGRAM_ChannelsContentsVisitLOG] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsVisitLOG_ftGRAM_ChannelsContents] FOREIGN KEY ([ftGRAM_ChannelsContentsID]) REFERENCES [dbo].[ftGRAM_ChannelsContents] ([ID]),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsVisitLOG_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

