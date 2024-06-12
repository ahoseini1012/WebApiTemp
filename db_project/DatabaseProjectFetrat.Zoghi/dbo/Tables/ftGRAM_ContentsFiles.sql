CREATE TABLE [dbo].[ftGRAM_ContentsFiles] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ContentsID] INT            NULL,
    [FileName]          NVARCHAR (500) NULL,
    [Type]              INT            NULL,
    [Sort]              INT            NULL,
    CONSTRAINT [PK_ftGRAM_ContentsFiles] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ContentsFiles_ftGRAM_Contents] FOREIGN KEY ([ftGRAM_ContentsID]) REFERENCES [dbo].[ftGRAM_Contents] ([ID])
);


GO

