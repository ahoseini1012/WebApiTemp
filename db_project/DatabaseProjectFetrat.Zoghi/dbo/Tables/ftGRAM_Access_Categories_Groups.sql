CREATE TABLE [dbo].[ftGRAM_Access_Categories_Groups] (
    [ID]                 INT IDENTITY (1, 1) NOT NULL,
    [ftMVC_CategoriesID] INT NULL,
    [ftMVC_GroupsID]     INT NULL,
    CONSTRAINT [PK_ftGRAM_Access_Categories_Groups] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_Access_Categories_Groups_ftMVC_Categories] FOREIGN KEY ([ftMVC_CategoriesID]) REFERENCES [dbo].[ftMVC_Categories] ([ID]),
    CONSTRAINT [FK_ftGRAM_Access_Categories_Groups_ftMVC_Groups] FOREIGN KEY ([ftMVC_GroupsID]) REFERENCES [dbo].[ftMVC_Groups] ([ID])
);


GO

