CREATE TYPE [dbo].[ftMVC_Users_type] AS TABLE (
    [ID]                 INT            NOT NULL,
    [Name]               NVARCHAR (50)  NULL,
    [Family]             NVARCHAR (50)  NULL,
    [UserName]           NVARCHAR (50)  NULL,
    [Password]           NVARCHAR (50)  NULL,
    [PasswordNew]        BINARY (64)    NULL,
    [PasswordSult]       NVARCHAR (36)  NULL,
    [Phone]              NVARCHAR (50)  NULL,
    [UUID]               NCHAR (50)     NULL,
    [Active]             BIT            NULL,
    [ftMVC_EducationsID] INT            NULL,
    [Phone_OK]           BIT            NULL,
    [Email_OK]           BIT            NULL,
    [Picture]            NVARCHAR (500) NULL,
    [Email]              NVARCHAR (50)  NULL,
    [F_M]                BIT            NULL,
    [googleAccount]      NVARCHAR (50)  NULL);


GO

