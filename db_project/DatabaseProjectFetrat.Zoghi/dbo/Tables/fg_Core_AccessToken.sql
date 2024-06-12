CREATE TABLE [dbo].[fg_Core_AccessToken] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [AccessToken] NVARCHAR (MAX) NOT NULL,
    [UserId]      INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

