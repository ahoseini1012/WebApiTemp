
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_OTP_Generate_ByPhoneCheck2]
	@Phone nvarchar(50)=null,
	@IP nvarchar(20) = null,
	@Browser nvarchar(50) = null,
	@OS nvarchar(50) = null,
	@UUID nvarchar(50) = null,
	@PhoneOrEmail bit = null,
	@Code int output,
	@UserId int output,
	@ResponseMessage nvarchar(50) output
AS
BEGIN
	SET NOCOUNT ON;
	declare @tbl_temp table(Code int)

	set @UserId= (select ID from ftMVC_Users where Trim(Phone) like Trim(@Phone) and Active=1)
	if @UserId >0
		begin
		select @Code=Code from ftMVC_Disposable where ftMVC_UsersID = @UserId and Date_Create>DATEADD(MINUTE,-3,GETDATE()) and Active=1 and Used=0
		if @Code>0
			begin
			set @ResponseMessage = N'عملیات باموفقیت انجام شد'
			return
			end
		else
			begin
			set @Code= floor(rand()*(1000000-100000)+100000);
			insert into ftMVC_Disposable (ftMVC_UsersID,Code,date_create ,Type,Active,Used,Phone,IP,Browser,OS,UUID)
			values (@UserId,@Code,GETDATE(),@PhoneOrEmail,1,0,@Phone,@IP,@Browser,@OS,@UUID)
			set @ResponseMessage = N'عملیات باموفقیت انجام شد'
			return
			end
		end
	else 
		begin
		set @ResponseMessage = N'شماره موبایل نامعتبر است'
		set @Code = -1
		return
		end

END

GO

