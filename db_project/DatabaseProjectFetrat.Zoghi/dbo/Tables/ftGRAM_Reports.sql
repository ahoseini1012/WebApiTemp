CREATE TABLE [dbo].[ftGRAM_Reports] (
    [ID]          INT   IDENTITY (1, 1) NOT NULL,
    [Name]        NTEXT NULL,
    [Description] NTEXT NULL,
    [Active]      BIT   NULL,
    CONSTRAINT [PK_ftGRAM_Reports] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

