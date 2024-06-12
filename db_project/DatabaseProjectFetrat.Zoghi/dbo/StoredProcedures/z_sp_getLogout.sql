-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 1402/04/10
-- Description:	log out by refreshtoken
-- =============================================
CREATE PROCEDURE [dbo].[z_sp_getLogout]
	@RefreshToken nvarchar(50),
	@UserId	bigint,
	@responseMessage bit=0 out
AS
BEGIN
	SET NOCOUNT ON;	
	update UserTokens set IsValid=0  where UserId = @UserId AND RefreshToken=@RefreshToken
	if(@@ROWCOUNT>0) 
		SET @responseMessage= 1
	else
		SET @responseMessage= 0
END

GO

