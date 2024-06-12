CREATE TABLE [dbo].[ftGRAM_Pages] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [ftMVC_LanguagesID] INT            NULL,
    [PageName]          NVARCHAR (50)  NULL,
    [Title]             NVARCHAR (50)  NULL,
    [Text]              NTEXT          NULL,
    [URLAddress]        NVARCHAR (100) NULL,
    CONSTRAINT [PK_ftGRAM_Pages] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_Pages_ftMVC_Languages] FOREIGN KEY ([ftMVC_LanguagesID]) REFERENCES [dbo].[ftMVC_Languages] ([ID])
);


GO

