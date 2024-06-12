CREATE TABLE [dbo].[ftGRAM_ChannelsAccess] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (50) NULL,
    [Capability]  NVARCHAR (50) NULL,
    [Description] NTEXT         NULL,
    CONSTRAINT [PK_ftGRAM_ChannelsAccess] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

