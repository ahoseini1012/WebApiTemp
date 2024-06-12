CREATE TABLE [dbo].[ftGRAM_ChannelsUsersAccess] (
    [ID]                      INT IDENTITY (1, 1) NOT NULL,
    [ftGRAM_ChannelsUsersID]  INT NOT NULL,
    [ftGRAM_ChannelsAccessID] INT NOT NULL,
    CONSTRAINT [PK_ftGRAM_ChannelsUsersAccess] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_ChannelsUsersAccess_ftGRAM_ChannelsAccess] FOREIGN KEY ([ftGRAM_ChannelsAccessID]) REFERENCES [dbo].[ftGRAM_ChannelsAccess] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_ftGRAM_ChannelsUsersAccess_ftGRAM_ChannelsUsers] FOREIGN KEY ([ftGRAM_ChannelsUsersID]) REFERENCES [dbo].[ftGRAM_ChannelsUsers] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO

