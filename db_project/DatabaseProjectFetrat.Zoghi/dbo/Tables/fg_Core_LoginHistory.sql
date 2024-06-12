CREATE TABLE [dbo].[fg_Core_LoginHistory] (
    [Id]            BIGINT   IDENTITY (1, 1) NOT NULL,
    [userId]        BIGINT   NOT NULL,
    [logInDateTime] DATETIME NOT NULL,
    CONSTRAINT [PK_LoginHistory] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

