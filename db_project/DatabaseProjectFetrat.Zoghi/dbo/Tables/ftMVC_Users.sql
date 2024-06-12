CREATE TABLE [dbo].[ftMVC_Users] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [Name]               NVARCHAR (50)  NULL,
    [Family]             NVARCHAR (50)  NULL,
    [UserName]           NVARCHAR (50)  NOT NULL,
    [Password]           NVARCHAR (50)  NULL,
    [PasswordNew]        BINARY (64)    NULL,
    [PasswordSult]       NVARCHAR (36)  NULL,
    [Picture]            NVARCHAR (500) NULL,
    [Email]              NVARCHAR (50)  NULL,
    [Phone]              CHAR (20)      NULL,
    [F_M]                BIT            NULL,
    [Website]            NCHAR (50)     NULL,
    [ftMVC_EducationsID] INT            NULL,
    [InstagramID]        NCHAR (20)     NULL,
    [State]              NVARCHAR (50)  NULL,
    [City]               NVARCHAR (50)  NULL,
    [Biography]          NTEXT          NULL,
    [googleAccount]      NCHAR (20)     NULL,
    [Active]             BIT            NULL,
    [UUID]               NCHAR (50)     NULL,
    [Question]           NVARCHAR (250) NULL,
    [Answer]             NVARCHAR (250) NULL,
    [Phone_OK]           BIT            NULL,
    [Email_OK]           BIT            NULL,
    [Code]               CHAR (8)       CONSTRAINT [DF_ftMVC_Users_Code] DEFAULT (substring(CONVERT([varchar](36),newid()),(0),(9))) NULL,
    [hasChannel]         BIT            CONSTRAINT [DF_ftMVC_Users_hasChannel] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_ftMVC_Users] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_Users_ftMVC_Educations] FOREIGN KEY ([ftMVC_EducationsID]) REFERENCES [dbo].[ftMVC_Educations] ([ID])
);


GO

