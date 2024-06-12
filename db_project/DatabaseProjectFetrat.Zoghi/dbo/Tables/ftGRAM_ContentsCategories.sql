CREATE TABLE [dbo].[ftGRAM_ContentsCategories] (
    [ID]                 INT IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ContentsID]  INT NULL,
    [ftMVC_CategoriesID] INT NULL,
    CONSTRAINT [PK_ftGRAM_ContentsCategories] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ContentsCategories_ftGRAM_Contents] FOREIGN KEY ([ftGRAM_ContentsID]) REFERENCES [dbo].[ftGRAM_Contents] ([ID]),
    CONSTRAINT [FK_ftGRAM_ContentsCategories_ftMVC_Categories] FOREIGN KEY ([ftMVC_CategoriesID]) REFERENCES [dbo].[ftMVC_Categories] ([ID])
);


GO

