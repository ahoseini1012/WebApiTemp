
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_OTP_Burn]
	@Phone nvarchar(50)=null,
	@Email nvarchar(50)=null,
	@Code int,
	@IsValidOTP int output
AS
BEGIN
	SET NOCOUNT ON;
	--declare @tbl_temp table(Code int)

	delete from ftMVC_DisposableTemp where (Trim(Phone) like Trim(@Phone) and Date_Create>DATEADD(MINUTE,-3,GETDATE()) and @Code=Code) 
		or (Trim(Email) like Trim(@Email) and Date_Create>DATEADD(MINUTE,-3,GETDATE()) and @Code=Code)
	if @@ROWCOUNT>0
		begin
		set @IsValidOTP=1
		return
		end
	else
		begin
		set @IsValidOTP=0
		return
		end
END

GO

