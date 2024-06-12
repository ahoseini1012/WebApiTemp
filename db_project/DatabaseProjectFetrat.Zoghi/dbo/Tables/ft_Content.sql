CREATE TABLE [dbo].[ft_Content] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [Name]               NVARCHAR (100) NULL,
    [Des]                NTEXT          NULL,
    [Pic]                NVARCHAR (200) NULL,
    [ft_LanguageID]      INT            NULL,
    [Search]             BIT            NULL,
    [MostView]           BIT            NULL,
    [ContentList]        BIT            NULL,
    [PicBig]             NVARCHAR (200) NULL,
    [ListType]           INT            NULL,
    [ListMy_Fetrat]      INT            NULL,
    [RSS]                INT            NULL,
    [Squabble]           INT            NULL,
    [TypePreference_Def] INT            NULL,
    [Ranking]            BIT            NULL
);


GO

