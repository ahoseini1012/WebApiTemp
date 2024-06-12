CREATE TABLE [dbo].[ftGRAM_ContentsReportsReports] (
    [ID]                       INT IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ContentsReportsID] INT NULL,
    [ftGRAM_ReportsID]         INT NULL,
    CONSTRAINT [PK_ftGRAM_ContentsReportsReports] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ContentsReportsReports_ftGRAM_ContentsReports] FOREIGN KEY ([ftGRAM_ContentsReportsID]) REFERENCES [dbo].[ftGRAM_ContentsReports] ([ID])
);


GO

