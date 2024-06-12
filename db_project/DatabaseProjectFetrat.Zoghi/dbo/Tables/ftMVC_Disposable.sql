CREATE TABLE [dbo].[ftMVC_Disposable] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [ftMVC_UsersID] INT           NOT NULL,
    [Code]          CHAR (6)      NULL,
    [Date_Create]   DATETIME      NULL,
    [Type]          BIT           NULL,
    [Active]        BIT           NULL,
    [Used]          BIT           NULL,
    [Phone]         CHAR (11)     NULL,
    [IP]            CHAR (15)     NULL,
    [Browser]       NCHAR (20)    NULL,
    [OS]            NVARCHAR (30) NULL,
    [UUID]          CHAR (50)     NULL,
    CONSTRAINT [PK_ftMVC_Disposable] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftMVC_Disposable_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

