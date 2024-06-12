CREATE TABLE [dbo].[ftGRAM_Settings] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [ftMVC_UsersID] INT            NULL,
    [Reserve01]     NVARCHAR (500) NULL,
    [Reserve02]     NVARCHAR (500) NULL,
    [Reserve03]     NVARCHAR (500) NULL,
    [Reserve04]     NVARCHAR (500) NULL,
    [Reserve05]     NVARCHAR (500) NULL,
    [Reserve06]     NVARCHAR (500) NULL,
    [Reserve07]     NVARCHAR (500) NULL,
    [Reserve08]     NVARCHAR (500) NULL,
    [Reserve09]     NVARCHAR (500) NULL,
    [Reserve10]     NVARCHAR (500) NULL,
    [Reserve11]     NVARCHAR (500) NULL,
    [Reserve12]     NVARCHAR (500) NULL,
    [Reserve13]     NVARCHAR (500) NULL,
    [Reserve14]     NVARCHAR (500) NULL,
    [Reserve15]     NVARCHAR (500) NULL,
    [Reserve16]     NVARCHAR (500) NULL,
    [Reserve17]     NVARCHAR (500) NULL,
    [Reserve18]     NVARCHAR (500) NULL,
    [Reserve19]     NVARCHAR (500) NULL,
    [Reserve20]     NVARCHAR (500) NULL,
    [Reserve21]     NVARCHAR (500) NULL,
    [Reserve22]     NVARCHAR (500) NULL,
    [Reserve23]     NVARCHAR (500) NULL,
    [Reserve24]     NVARCHAR (500) NULL,
    [Reserve25]     NVARCHAR (500) NULL,
    [Reserve26]     NVARCHAR (500) NULL,
    [Reserve27]     NVARCHAR (500) NULL,
    [Reserve28]     NVARCHAR (500) NULL,
    [Reserve29]     NVARCHAR (500) NULL,
    [Reserve30]     NVARCHAR (500) NULL,
    CONSTRAINT [PK_ftGRAM_Settings] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ftGRAM_Settings_ftMVC_Users] FOREIGN KEY ([ftMVC_UsersID]) REFERENCES [dbo].[ftMVC_Users] ([ID]),
    CONSTRAINT [IX_ftGRAM_Settings] UNIQUE NONCLUSTERED ([ftMVC_UsersID] ASC)
);


GO

