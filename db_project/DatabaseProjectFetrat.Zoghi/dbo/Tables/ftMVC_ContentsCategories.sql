CREATE TABLE [dbo].[ftMVC_ContentsCategories] (
    [ID]                 INT IDENTITY (1, 1) NOT NULL,
    [ftMVC_ContentsID]   INT NOT NULL,
    [ftMVC_CategoriesID] INT NOT NULL,
    CONSTRAINT [PK_ftMVC_ContentsCategories] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_ContentsCategories_ftMVC_Categories] FOREIGN KEY ([ftMVC_CategoriesID]) REFERENCES [dbo].[ftMVC_Categories] ([ID]),
    CONSTRAINT [FK_ftMVC_ContentsCategories_ftMVC_Contents] FOREIGN KEY ([ftMVC_ContentsID]) REFERENCES [dbo].[ftMVC_Contents] ([ID])
);


GO

