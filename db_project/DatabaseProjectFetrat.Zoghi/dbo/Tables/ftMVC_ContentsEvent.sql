CREATE TABLE [dbo].[ftMVC_ContentsEvent] (
    [ID]               INT IDENTITY (1, 1) NOT NULL,
    [ftMVC_ContentsID] INT NULL,
    [ftMVC_UsersID]    INT NULL,
    [Date_Month]       INT NULL,
    [Date_Day]         INT NULL,
    CONSTRAINT [PK_ftMVC_ContentsEvent] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_ContentsEvent_ftMVC_Contents] FOREIGN KEY ([ftMVC_ContentsID]) REFERENCES [dbo].[ftMVC_Contents] ([ID]),
    CONSTRAINT [FK_ftMVC_ContentsEvent_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

