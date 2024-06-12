CREATE TABLE [dbo].[EmailVerificationHistory] (
    [Id]             BIGINT   IDENTITY (1, 1) NOT NULL,
    [Userid]         BIGINT   NOT NULL,
    [Token]          INT      NOT NULL,
    [IsBurned]       BIT      NOT NULL,
    [Datetime]       DATETIME NOT NULL,
    [expireDateTime] DATETIME NOT NULL,
    CONSTRAINT [PK_EmailVerification] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

