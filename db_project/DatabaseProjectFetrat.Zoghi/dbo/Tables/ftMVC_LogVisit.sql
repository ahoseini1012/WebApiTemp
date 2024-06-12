CREATE TABLE [dbo].[ftMVC_LogVisit] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [ftMVC_UsersID] INT           NULL,
    [URLController] NVARCHAR (50) NULL,
    [URLAction]     NVARCHAR (50) NULL,
    [URLID]         NVARCHAR (50) NULL,
    [Browser]       NVARCHAR (50) NULL,
    [IPAddress]     NCHAR (20)    NULL,
    [Date]          DATETIME      NULL,
    [UUID]          NCHAR (50)    NULL,
    CONSTRAINT [PK_ftMVC_LogVisit] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_logVisit_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

