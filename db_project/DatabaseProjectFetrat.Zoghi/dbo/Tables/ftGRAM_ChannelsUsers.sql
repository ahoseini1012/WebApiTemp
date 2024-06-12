CREATE TABLE [dbo].[ftGRAM_ChannelsUsers] (
    [ID]               INT IDENTITY (1, 1) NOT NULL,
    [ftMVC_UsersID]    INT NOT NULL,
    [ftGRAM_ChannelID] INT NULL,
    CONSTRAINT [PK_ftGRAM_ChannelsUsers] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ChannelsUsers_ftGRAM_Channels] FOREIGN KEY ([ftGRAM_ChannelID]) REFERENCES [dbo].[ftGRAM_Channels] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_ftGRAM_ChannelsUsers_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO

