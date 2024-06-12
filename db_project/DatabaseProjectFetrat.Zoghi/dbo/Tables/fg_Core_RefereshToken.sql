CREATE TABLE [dbo].[fg_Core_RefereshToken] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [RefereshToken] NVARCHAR (MAX) NOT NULL,
    [AccessTokenId] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

