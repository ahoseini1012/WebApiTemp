CREATE TABLE [dbo].[ftMVC_Headlines] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [Name]              NVARCHAR (100) NOT NULL,
    [Description]       NTEXT          NULL,
    [ftMVC_LanguagesID] INT            NOT NULL,
    [URLAddress]        NVARCHAR (100) NULL,
    [Active]            BIT            NULL,
    [Groups]            BIT            NULL,
    [FileTypes]         INT            NULL,
    CONSTRAINT [PK_ftMVC_Headlines] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'1=Picture / 2=Sound / 3=Film', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ftMVC_Headlines', @level2type = N'COLUMN', @level2name = N'FileTypes';


GO

