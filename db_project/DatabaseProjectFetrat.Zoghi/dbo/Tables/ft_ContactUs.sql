CREATE TABLE [dbo].[ft_ContactUs] (
    [ID]                INT           IDENTITY (1, 1) NOT NULL,
    [ft_UsersID]        INT           NULL,
    [email]             NVARCHAR (50) NULL,
    [name]              NVARCHAR (50) NULL,
    [Tell]              NVARCHAR (50) NULL,
    [Text]              NTEXT         NULL,
    [CreateDate]        DATETIME      NULL,
    [ft_usersID_Manage] INT           NULL,
    [Date_Manage]       DATETIME      NULL,
    [AnswerText]        NTEXT         NULL,
    [chk]               INT           NULL
);


GO

