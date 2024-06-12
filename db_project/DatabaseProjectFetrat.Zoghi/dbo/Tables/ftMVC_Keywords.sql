CREATE TABLE [dbo].[ftMVC_Keywords] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [ftMVC_LanguagesID] INT            NULL,
    [Name]              NVARCHAR (100) NULL,
    [Description]       NTEXT          NULL,
    [URLAddress]        NVARCHAR (100) NULL,
    [Active]            BIT            NULL,
    CONSTRAINT [PK_ftMVC_Keywords] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_Keywords_ftMVC_Languages] FOREIGN KEY ([ftMVC_LanguagesID]) REFERENCES [dbo].[ftMVC_Languages] ([ID])
);


GO

