CREATE TABLE [dbo].[ftGRAM_ChannelsContentsLikes] (
    [ID]                        INT            IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ChannelsContentsID] INT            NULL,
    [ftMVC_UsersID]             INT            NULL,
    [LiksType]                  INT            NULL,
    [Date]                      DATETIME       NULL,
    [IP]                        CHAR (15)      NULL,
    [Browser]                   NVARCHAR (MAX) NULL,
    [User_Visit]                BIT            NULL,
    [Admin_Visit]               BIT            NULL,
    CONSTRAINT [PK_ftGRAM_ChannelsContentsLikes] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsLikes_ftGRAM_ChannelsContents] FOREIGN KEY ([ftGRAM_ChannelsContentsID]) REFERENCES [dbo].[ftGRAM_ChannelsContents] ([ID]),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsLikes_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

