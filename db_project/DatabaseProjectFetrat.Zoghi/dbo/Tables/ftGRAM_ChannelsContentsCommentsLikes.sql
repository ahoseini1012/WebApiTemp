CREATE TABLE [dbo].[ftGRAM_ChannelsContentsCommentsLikes] (
    [ID]                                INT IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ChannelsContentsCommentsID] INT NULL,
    [ftMVC_UsersID]                     INT NULL,
    [LiksType]                          INT NULL,
    [User_Visit]                        BIT NULL,
    [Admin_Visit]                       BIT NULL,
    CONSTRAINT [PK_ftGRAM_ChannelsContentsCommentsLikes] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsCommentsLikes_ftGRAM_ChannelsContentsComments] FOREIGN KEY ([ftGRAM_ChannelsContentsCommentsID]) REFERENCES [dbo].[ftGRAM_ChannelsContentsComments] ([ID]),
    CONSTRAINT [FK_ftGRAM_ChannelsContentsCommentsLikes_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID])
);


GO

