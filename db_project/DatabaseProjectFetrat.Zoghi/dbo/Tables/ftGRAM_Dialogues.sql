CREATE TABLE [dbo].[ftGRAM_Dialogues] (
    [ID]                    INT            IDENTITY (1, 1) NOT NULL,
    [ftMVC_UsersID]         INT            NULL,
    [Date_Create]           DATETIME       NULL,
    [Dialog]                NTEXT          NULL,
    [File_Data]             NVARCHAR (100) NULL,
    [File_Sound]            NVARCHAR (100) NULL,
    [Type]                  INT            NULL,
    [Visited_Date]          DATETIME       NULL,
    [Visited_ftMVC_UsersID] INT            NULL,
    [Answer]                NTEXT          NULL,
    [Answer_Date]           DATETIME       NULL,
    [Answer_ftMVC_UsersID]  INT            NULL,
    CONSTRAINT [PK_ftGRAM_Dialogues] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_Dialogues_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID]),
    CONSTRAINT [FK_ftGRAM_Dialogues_ftMVC_Users1] FOREIGN KEY ([Visited_ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID]),
    CONSTRAINT [FK_ftGRAM_Dialogues_ftMVC_Users2] FOREIGN KEY ([Answer_ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

