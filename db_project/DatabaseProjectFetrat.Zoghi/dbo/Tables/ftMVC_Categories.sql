CREATE TABLE [dbo].[ftMVC_Categories] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [ParentID]          INT            CONSTRAINT [DF_ftMVC_Categories_ParentID] DEFAULT ((0)) NOT NULL,
    [ftMVC_LanguagesID] INT            CONSTRAINT [DF_ftMVC_Categories_ftMVC_LanguagesID] DEFAULT ((1)) NOT NULL,
    [Name]              NVARCHAR (100) NOT NULL,
    [Description]       NTEXT          NULL,
    [URLAddress]        NVARCHAR (100) NULL,
    [Active]            BIT            NULL,
    [Sort]              INT            NULL,
    CONSTRAINT [PK_ftMVC_Categories] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_Categories_ftMVC_Languages] FOREIGN KEY ([ftMVC_LanguagesID]) REFERENCES [dbo].[ftMVC_Languages] ([ID])
);


GO

