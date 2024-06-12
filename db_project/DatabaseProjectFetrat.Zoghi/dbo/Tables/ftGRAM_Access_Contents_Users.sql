CREATE TABLE [dbo].[ftGRAM_Access_Contents_Users] (
    [ID]                INT IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ContentsID] INT NULL,
    [ftMVC_UsersID]     INT NULL,
    CONSTRAINT [PK_ftGRAM_Access_Contents_Users] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_Access_Contents_Users_ftGRAM_Contents] FOREIGN KEY ([ftGRAM_ContentsID]) REFERENCES [dbo].[ftGRAM_Contents] ([ID]),
    CONSTRAINT [FK_ftGRAM_Access_Contents_Users_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

