-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 2023/09/05
-- Description:	to insert ContentCommentAdd into ftGRAM_CommentsReports table
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetVersion]        
AS
BEGIN
	SET NOCOUNT ON;
	select top 1 * from ftGRAM_Version order by Date_Create desc
END

GO

