-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 2023/09/05
-- Description:	to insert ContentCommentAdd into ftGRAM_CommentsReports table
-- =============================================
CREATE PROCEDURE [sp_contentCommentAdd]
	@UserID int, 
	@CommentsID int,
	@IP nvarchar(15),
	@Browser nvarchar(max),
	@OS nvarchar(max),
	@UUID nvarchar(max),
	@Message nvarchar(max),
	@IsSucceed bit=0 output
        
AS
BEGIN
	SET NOCOUNT ON;
	insert into ftGRAM_CommentsReports 
	(ftMVC_UsersID,ftGRAM_CommentsID,Date_Create,IP,Browser,OS,UUID,Message)
	values
	(@UserID,@CommentsID,GETDATE(),@IP,@Browser,@OS,@UUID,@Message)
	
	if @@ROWCOUNT = 1 set @IsSucceed = 1

END

GO

