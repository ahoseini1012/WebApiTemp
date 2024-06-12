CREATE TABLE [dbo].[ftMVC_Languages] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        CHAR (2)      NOT NULL,
    [Description] NVARCHAR (50) NOT NULL,
    [DateType]    CHAR (10)     NULL,
    CONSTRAINT [PK_ftMVC_Languages] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

