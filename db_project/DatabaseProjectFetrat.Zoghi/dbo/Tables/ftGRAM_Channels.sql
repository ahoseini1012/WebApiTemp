CREATE TABLE [dbo].[ftGRAM_Channels] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [ftMVC_UsersID] INT            NOT NULL,
    [Name]          NVARCHAR (500) NOT NULL,
    [Description]   NTEXT          NULL,
    [DateCreate]    DATETIME       CONSTRAINT [DF_ftGRAM_Channel_DateCreate] DEFAULT (getdate()) NOT NULL,
    [Picture]       NVARCHAR (500) NULL,
    CONSTRAINT [PK_ftGRAM_Channel] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_Channels_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

