CREATE TABLE [dbo].[ftMVC_Contents] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [Text]              NTEXT          NULL,
    [Date_Create]       DATETIME       NULL,
    [ftMVC_UsersID]     INT            NULL,
    [ftMVC_HeadlinesID] INT            NULL,
    [Pic]               NVARCHAR (500) NULL,
    [URL]               NVARCHAR (500) NULL,
    [ShowOrNoShow]      BIT            NULL,
    [Archive]           BIT            NULL,
    [Sort]              NUMERIC (18)   NULL,
    [Old_Id]            INT            NOT NULL,
    [Point]             INT            NULL,
    [titleMin]          NVARCHAR (50)  NULL,
    [titleMax]          NVARCHAR (150) NULL,
    [Des]               NVARCHAR (150) NULL,
    [URLAddress]        NVARCHAR (100) NULL,
    [visit]             INT            NULL,
    [GroupsName]        NVARCHAR (50)  NULL,
    [URLGroupsName]     NVARCHAR (100) NULL,
    [Older_ID]          INT            NULL,
    CONSTRAINT [PK_ftMVC_ContentText] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_Contents_ftMVC_Headlines] FOREIGN KEY ([ftMVC_HeadlinesID]) REFERENCES [dbo].[ftMVC_Headlines] ([ID]),
    CONSTRAINT [FK_ftMVC_Contents_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

