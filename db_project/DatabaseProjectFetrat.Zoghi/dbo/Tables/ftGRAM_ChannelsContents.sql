CREATE TABLE [dbo].[ftGRAM_ChannelsContents] (
    [ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [Text]                 NTEXT          NULL,
    [Date_Create]          DATETIME       NULL,
    [ftMVC_UsersID]        INT            NULL,
    [ftMVC_LanguagesID]    INT            NULL,
    [Title]                NVARCHAR (250) NULL,
    [Active]               BIT            NULL,
    [URL]                  NVARCHAR (500) NULL,
    [ViewContent]          INT            NULL,
    [Date_Active]          DATETIME       NULL,
    [ftMVC_UsersID_Active] INT            NULL,
    [Date_Changed]         DATETIME       NULL,
    [URLAddress]           NVARCHAR (500) NULL,
    [Saved]                BIT            NULL,
    [ftGRAM_ChannelsID]    INT            NOT NULL,
    CONSTRAINT [PK_ftGRAM_ChannelsContents] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ChannelsContents_ftGRAM_Channels] FOREIGN KEY ([ftGRAM_ChannelsID]) REFERENCES [dbo].[ftGRAM_Channels] ([ID]),
    CONSTRAINT [FK_ftGRAM_ChannelsContents_ftMVC_Languages] FOREIGN KEY ([ftMVC_LanguagesID]) REFERENCES [dbo].[ftMVC_Languages] ([ID]),
    CONSTRAINT [FK_ftGRAM_ChannelsContents_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID]),
    CONSTRAINT [FK_ftGRAM_ChannelsContents_ftMVC_Users1] FOREIGN KEY ([ftMVC_UsersID_Active]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

