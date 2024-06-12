CREATE TABLE [dbo].[ftMVC_Redirect] (
    [ID]      INT            IDENTITY (1, 1) NOT NULL,
    [URL_old] NVARCHAR (500) NULL,
    [URL_new] NVARCHAR (500) NULL,
    CONSTRAINT [PK_ftMVC_Redirect] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

