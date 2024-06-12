CREATE TABLE [dbo].[ftl_Comment] (
    [ft_ContentID]     INT             NULL,
    [ft_ContentTextID] INT             NOT NULL,
    [ft_UsersID]       INT             NOT NULL,
    [CreateDate]       DATETIME        NULL,
    [Name]             NVARCHAR (1000) NULL,
    [Email]            NVARCHAR (100)  NULL,
    [Text]             NTEXT           NULL,
    [ManageDate]       DATETIME        NULL,
    [manageID]         INT             NULL,
    [chk]              BIT             NOT NULL,
    [ParentID]         INT             NULL,
    [ID]               INT             IDENTITY (1, 1) NOT NULL
);


GO

