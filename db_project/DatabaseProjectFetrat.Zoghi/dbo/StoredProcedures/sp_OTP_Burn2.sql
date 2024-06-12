
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_OTP_Burn2]
	@Phone nvarchar(50)=null,
	@Email nvarchar(50)=null,
	@Code int,
	@IsValidOTP int output,
	@ResponseMessage nvarchar(200) output
AS
BEGIN
	SET NOCOUNT ON;
	declare @OtpId int,
			@UserId int
	declare @UserInformation_ID as dbo.UserInformation_ID


	select @OtpId=ID ,@UserId=ftMVC_UsersID from ftMVC_Disposable where (Trim(Phone) like Trim(@Phone) 
											and Date_Create>DATEADD(DAY,-3,GETDATE()) 
											and @Code=Code 
											and Used=0
											and Active=1) 
	if @OtpId>0
		begin
		update ftMVC_Disposable set Active=0,Used=1 where ID=@OtpId
		set @IsValidOTP=1
		set @ResponseMessage = N'عملیات با موفقیت انجام شد';
		insert into @UserInformation_ID
		exec sp_GetUserInformationByID @userId
		select * from @UserInformation_ID
		return
		end
	else
		begin
		set @IsValidOTP=0
		set @ResponseMessage =N'مقادیر وارد شده معتبر نمی باشد';
		return
		end
END

GO

