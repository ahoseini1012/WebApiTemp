CREATE TABLE [dbo].[ftMVC_Educations] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (50) NULL,
    [Description] NTEXT         NULL,
    CONSTRAINT [PK_ftMVC_Educations] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

