CREATE TABLE [dbo].[ftGRAM_ContentsLikes] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ContentsID] INT            NULL,
    [ftMVC_UsersID]     INT            NULL,
    [LiksType]          INT            NULL,
    [Date]              DATETIME       NULL,
    [IP]                CHAR (15)      NULL,
    [Browser]           NVARCHAR (MAX) NULL,
    [User_Visit]        BIT            NULL,
    [Admin_Visit]       BIT            NULL,
    CONSTRAINT [PK_ftGRAM_ContentsLikes] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ContentsLikes_ftGRAM_Contents] FOREIGN KEY ([ftGRAM_ContentsID]) REFERENCES [dbo].[ftGRAM_Contents] ([ID]),
    CONSTRAINT [FK_ftGRAM_ContentsLikes_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

