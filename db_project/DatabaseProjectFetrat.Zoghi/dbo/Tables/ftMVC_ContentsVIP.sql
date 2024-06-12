CREATE TABLE [dbo].[ftMVC_ContentsVIP] (
    [ID]               INT             IDENTITY (1, 1) NOT NULL,
    [ftMVC_ContentsID] INT             NULL,
    [ftMVC_UsersID]    INT             NULL,
    [ftMVC_VIPID]      INT             NULL,
    [Date_Create]      DATETIME        NULL,
    [Date_Start]       DATETIME        NULL,
    [Date_End]         DATETIME        NULL,
    [Sort]             INT             NULL,
    [Active]           BIT             NULL,
    [Link]             NVARCHAR (500)  NULL,
    [URL]              NVARCHAR (500)  NULL,
    [Des]              NVARCHAR (1000) NULL,
    CONSTRAINT [PK_ftMVC_ContentsVIP] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_ContentsVIP_ftMVC_Contents] FOREIGN KEY ([ftMVC_ContentsID]) REFERENCES [dbo].[ftMVC_Contents] ([ID]),
    CONSTRAINT [FK_ftMVC_ContentsVIP_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID]),
    CONSTRAINT [FK_ftMVC_ContentsVIP_ftMVC_VIP] FOREIGN KEY ([ftMVC_VIPID]) REFERENCES [dbo].[ftMVC_VIP] ([ID])
);


GO

