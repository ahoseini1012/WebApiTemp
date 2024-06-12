CREATE TABLE [dbo].[ftGRAM_ChannelsContentsReports] (
    [ID]                        INT           IDENTITY (1, 1) NOT NULL,
    [ftMVC_UsersID]             INT           NULL,
    [ftGRAM_ChannelsContentsID] INT           NULL,
    [Date_Create]               DATETIME      NULL,
    [IP]                        CHAR (15)     NULL,
    [Browser]                   NCHAR (20)    NULL,
    [OS]                        NVARCHAR (30) NULL,
    [UUID]                      CHAR (50)     NULL,
    [Message]                   NTEXT         NULL,
    [Visited_Date]              DATETIME      NULL,
    [Visited_ftMVC_UsersID]     INT           NULL,
    CONSTRAINT [PK_ftGRAM_ChannelsContentsReports] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsReports_ftGRAM_ChannelsContents] FOREIGN KEY ([ftGRAM_ChannelsContentsID]) REFERENCES [dbo].[ftGRAM_ChannelsContents] ([ID]),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsReports_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID]),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsReports_ftMVC_Users1] FOREIGN KEY ([Visited_ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

