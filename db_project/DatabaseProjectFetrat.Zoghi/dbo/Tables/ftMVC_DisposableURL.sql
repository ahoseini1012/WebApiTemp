CREATE TABLE [dbo].[ftMVC_DisposableURL] (
    [ID]            INT         IDENTITY (1, 1) NOT NULL,
    [ftMVC_UsersID] INT         NULL,
    [Date_Create]   DATETIME    NULL,
    [URL]           NCHAR (100) NULL,
    CONSTRAINT [PK_DisposableURL] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_DisposableURL_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

