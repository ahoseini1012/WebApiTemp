CREATE TABLE [dbo].[ftMVC_EditorialCategories] (
    [ID]                 INT IDENTITY (1, 1) NOT NULL,
    [ftMVC_EditorialID]  INT NULL,
    [ftMVC_CategoriesID] INT NULL,
    CONSTRAINT [PK_ftMVC_EditorialCategories] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_EditorialCategories_ftMVC_Categories] FOREIGN KEY ([ftMVC_CategoriesID]) REFERENCES [dbo].[ftMVC_Categories] ([ID]),
    CONSTRAINT [FK_ftMVC_EditorialCategories_ftMVC_Editorial] FOREIGN KEY ([ftMVC_EditorialID]) REFERENCES [dbo].[ftMVC_Editorial] ([ID])
);


GO

