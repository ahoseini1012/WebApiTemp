CREATE TABLE [dbo].[ft_ContentText32] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [Text]              NTEXT          NULL,
    [Date_Create]       DATETIME       NULL,
    [ft_UsersID_Create] INT            NULL,
    [ft_ContentID]      INT            NULL,
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
    [V5_Id]             INT            NOT NULL
);


GO

