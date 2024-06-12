CREATE TABLE [dbo].[ftMVC_Editorial] (
    [ID]                        INT            IDENTITY (1, 1) NOT NULL,
    [Text]                      NTEXT          NULL,
    [Date_Create]               DATETIME       NULL,
    [ftMVC_UsersID]             INT            NULL,
    [ftMVC_EditorialRequestsID] INT            NULL,
    [Pic]                       NVARCHAR (500) NULL,
    [URL]                       NVARCHAR (500) NULL,
    [ShowOrNoShow]              BIT            NULL,
    [titleMin]                  NVARCHAR (50)  NULL,
    [titleMax]                  NVARCHAR (150) NULL,
    [Des]                       NVARCHAR (150) NULL,
    [Clean]                     BIT            NULL,
    CONSTRAINT [PK_ftMVC_Editorial] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_Editorial_ftMVC_EditorialRequests] FOREIGN KEY ([ftMVC_EditorialRequestsID]) REFERENCES [dbo].[ftMVC_EditorialRequests] ([ID]),
    CONSTRAINT [FK_ftMVC_Editorial_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

