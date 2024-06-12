CREATE TABLE [dbo].[ftGRAM_ChannelsContentsComments] (
    [ID]                        INT      IDENTITY (1, 1) NOT NULL,
    [ParentID]                  INT      NULL,
    [ftGRAM_ChannelsContentsID] INT      NULL,
    [ftMVC_UsersID]             INT      NULL,
    [Text]                      NTEXT    NULL,
    [Date_Create]               DATETIME NULL,
    [ftMVC_UsersID_Active]      INT      NULL,
    [Date_Active]               DATETIME NULL,
    [Type_Active]               BIT      NULL,
    [Date_Changed]              DATETIME NULL,
    [User_Visit]                BIT      NULL,
    [Admin_Visit]               BIT      NULL,
    CONSTRAINT [PK_ftGRAM_ChannelsContentsComments] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsComments_ftGRAM_ChannelsContents] FOREIGN KEY ([ftGRAM_ChannelsContentsID]) REFERENCES [dbo].[ftGRAM_ChannelsContents] ([ID]),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsComments_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID]),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsComments_ftMVC_Users1] FOREIGN KEY ([ftMVC_UsersID_Active]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

