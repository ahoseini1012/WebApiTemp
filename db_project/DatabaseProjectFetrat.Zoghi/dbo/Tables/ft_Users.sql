CREATE TABLE [dbo].[ft_Users] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [UserName]          NVARCHAR (50)  NULL,
    [Password]          NVARCHAR (200) NULL,
    [Pic]               NVARCHAR (100) NULL,
    [Des]               NTEXT          NULL,
    [Name]              NVARCHAR (50)  NULL,
    [Family]            NVARCHAR (50)  NULL,
    [Email]             NVARCHAR (50)  NULL,
    [Phone]             NVARCHAR (50)  NULL,
    [Mobile]            NVARCHAR (50)  NULL,
    [Address]           NVARCHAR (MAX) NULL,
    [Job]               NVARCHAR (50)  NULL,
    [Sex]               BIT            NULL,
    [Education]         NVARCHAR (50)  NULL,
    [BirthDate]         DATE           NULL,
    [PasswrodNew]       BINARY (64)    NULL,
    [Guid]              NVARCHAR (36)  NULL,
    [IsActive]          BIT            CONSTRAINT [DF_ft_Users_IsActive] DEFAULT ((0)) NULL,
    [IsEmailValidated]  BIT            CONSTRAINT [DF_ft_Users_IsEmailValidated] DEFAULT ((0)) NULL,
    [IsMobileValidated] BIT            CONSTRAINT [DF_ft_Users_IsMobileValidated] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_ft_Users] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

