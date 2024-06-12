CREATE TABLE [dbo].[fg_Core_UserTokens] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserId]       BIGINT         NOT NULL,
    [RefreshToken] NVARCHAR (100) NOT NULL,
    [CreatedAt]    DATETIME       NOT NULL,
    [IsValid]      BIT            NOT NULL,
    CONSTRAINT [PK_UsersTokens1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserTokens_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[fg_Core_Users_old] ([Id])
);


GO

