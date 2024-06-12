CREATE TABLE [dbo].[ftMVC_VIP] (
    [ID]       INT            IDENTITY (1, 1) NOT NULL,
    [Title]    NVARCHAR (150) NULL,
    [TitleURL] NVARCHAR (500) NULL,
    [VIPType]  INT            NULL,
    [VIPID]    INT            NULL,
    [Pic]      NVARCHAR (500) NULL,
    [PicAlt]   NVARCHAR (150) NULL,
    [PicTitle] NVARCHAR (150) NULL,
    CONSTRAINT [PK_ftMVC_VIP] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

