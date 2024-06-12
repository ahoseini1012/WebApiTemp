CREATE TYPE [dbo].[ftMVC_Users_type2] AS TABLE (
    [ID]                INT            NULL,
    [Name]              NVARCHAR (50)  NULL,
    [Family]            NVARCHAR (50)  NULL,
    [UserName]          NVARCHAR (50)  NULL,
    [Password]          NVARCHAR (50)  NULL,
    [PasswordNew]       BINARY (64)    NULL,
    [PasswordSult]      NVARCHAR (36)  NULL,
    [Picture]           NVARCHAR (500) NULL,
    [Email]             NVARCHAR (50)  NULL,
    [Phone]             CHAR (20)      NULL,
    [F_M]               BIT            NULL,
    [Website]           NVARCHAR (50)  NULL,
    [ftMVC_EducationID] INT            NULL,
    [InstagramID]       NVARCHAR (20)  NULL,
    [State]             NVARCHAR (50)  NULL,
    [City]              NVARCHAR (50)  NULL,
    [Biography]         NTEXT          NULL,
    [googleAccount]     NCHAR (20)     NULL,
    [Active]            BIT            NULL,
    [UUID]              NCHAR (50)     NULL,
    [Question]          NVARCHAR (250) NULL,
    [Answer]            NVARCHAR (250) NULL,
    [Phone_OK]          BIT            NULL,
    [Email_OK]          BIT            NULL,
    [Code]              CHAR (8)       NULL,
    [hasChannel]        BIT            NULL);


GO

