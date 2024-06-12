CREATE TABLE [dbo].[ftGRAM_Access_Contents_Groups] (
    [ID]                INT IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ContentsID] INT NULL,
    [ftMVC_GroupsID]    INT NULL,
    CONSTRAINT [PK_ftGRAM_Access_Contents_Groups] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_Access_Contents_Groups_ftGRAM_Contents] FOREIGN KEY ([ftGRAM_ContentsID]) REFERENCES [dbo].[ftGRAM_Contents] ([ID]),
    CONSTRAINT [FK_ftGRAM_Access_Contents_Groups_ftMVC_Groups] FOREIGN KEY ([ftMVC_GroupsID]) REFERENCES [dbo].[ftMVC_Groups] ([ID])
);


GO

