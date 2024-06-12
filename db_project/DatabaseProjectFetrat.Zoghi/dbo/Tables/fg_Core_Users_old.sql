CREATE TABLE [dbo].[fg_Core_Users_old] (
    [Id]              BIGINT        IDENTITY (1, 1) NOT NULL,
    [Username]        NVARCHAR (50) NOT NULL,
    [Password]        BINARY (64)   NOT NULL,
    [Guid]            NVARCHAR (36) NULL,
    [Email]           NVARCHAR (50) NULL,
    [IsVerifiedEmail] BIT           NULL,
    [FirstName]       NVARCHAR (50) NULL,
    [LastName]        NVARCHAR (50) NULL,
    [MobileNumber]    NVARCHAR (20) NULL,
    [IsActive]        BIT           NOT NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [unique_email]
    ON [dbo].[fg_Core_Users_old]([Email] ASC);


GO

