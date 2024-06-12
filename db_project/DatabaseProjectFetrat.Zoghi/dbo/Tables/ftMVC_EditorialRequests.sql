CREATE TABLE [dbo].[ftMVC_EditorialRequests] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Request]     NVARCHAR (200) NULL,
    [Description] NVARCHAR (500) NULL,
    CONSTRAINT [PK_ftMVC_EditorialRequests] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

