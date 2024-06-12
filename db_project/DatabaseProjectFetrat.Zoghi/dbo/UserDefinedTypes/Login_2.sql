CREATE TYPE [dbo].[Login_2] AS TABLE (
    [UserID]             INT           NOT NULL,
    [Name]               NVARCHAR (50) NULL,
    [Family]             NVARCHAR (50) NULL,
    [ShowName]           NVARCHAR (50) NULL,
    [UserName]           NVARCHAR (50) NULL,
    [Password]           NVARCHAR (50) NULL,
    [Picture]            NVARCHAR (50) NULL,
    [Email]              NVARCHAR (50) NULL,
    [Phone]              NVARCHAR (50) NULL,
    [F_M]                NVARCHAR (50) NULL,
    [Website]            NVARCHAR (50) NULL,
    [ftMVC_EducationsID] INT           NULL,
    [InstagramID]        NVARCHAR (50) NULL,
    [State]              NVARCHAR (50) NULL,
    [City]               NVARCHAR (50) NULL,
    [Biography]          NVARCHAR (50) NULL,
    [googleAccount]      NVARCHAR (50) NULL,
    [Active]             BIT           NULL,
    [UUID]               NCHAR (50)    NULL,
    [Question]           NVARCHAR (50) NULL,
    [Answer]             NVARCHAR (50) NULL,
    [LastPostVisited]    INT           NULL,
    [CommentCount]       INT           NULL,
    [LikeCount]          INT           NULL,
    [DislikeCount]       INT           NULL,
    [PostCount]          INT           NULL,
    [SaveCount]          INT           NULL,
    [ShareCount]         INT           NULL);


GO

