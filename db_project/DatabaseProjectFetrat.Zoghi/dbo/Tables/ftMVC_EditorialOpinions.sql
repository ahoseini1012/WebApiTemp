CREATE TABLE [dbo].[ftMVC_EditorialOpinions] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [ParentID]          INT            NULL,
    [ftMVC_UsersID]     INT            NULL,
    [ftMVC_EditorialID] INT            NULL,
    [Date_Create]       DATETIME       NULL,
    [Opinion]           NVARCHAR (500) NULL,
    CONSTRAINT [PK_ftMVC_EditorialOpinions] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_EditorialOpinions_ftMVC_Editorial] FOREIGN KEY ([ftMVC_EditorialID]) REFERENCES [dbo].[ftMVC_Editorial] ([ID]),
    CONSTRAINT [FK_ftMVC_EditorialOpinions_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

