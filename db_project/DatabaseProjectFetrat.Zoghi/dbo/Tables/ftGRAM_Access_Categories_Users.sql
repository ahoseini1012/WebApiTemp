CREATE TABLE [dbo].[ftGRAM_Access_Categories_Users] (
    [ID]                 INT IDENTITY (1, 1) NOT NULL,
    [ftMVC_CategoriesID] INT NULL,
    [ftMVC_UsersID]      INT NULL,
    CONSTRAINT [PK_ftGRAM_Access_Categories_Users] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_Access_Categories_Users_ftMVC_Categories] FOREIGN KEY ([ftMVC_CategoriesID]) REFERENCES [dbo].[ftMVC_Categories] ([ID]),
    CONSTRAINT [FK_ftGRAM_Access_Categories_Users_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

