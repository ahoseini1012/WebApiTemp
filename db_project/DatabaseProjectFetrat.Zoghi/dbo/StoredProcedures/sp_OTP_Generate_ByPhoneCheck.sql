
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_OTP_Generate_ByPhoneCheck]
	@Phone nvarchar(50)=null,
	@Code int output,
	@ResponseMessage nvarchar(50) output
AS
BEGIN
	SET NOCOUNT ON;
	declare @tbl_temp table(Code int)

	select * from ftMVC_Users where Trim(Phone) like Trim(@Phone) and Active=1
	if @@ROWCOUNT >0
		begin
		exec sp_OTP_Generate @Phone,NUll,@Code = @Code output
		set @ResponseMessage = N'عملیات باموفقیت انجام شد'
		return
		end
	else 
		begin
		set @ResponseMessage = N'شماره موبایل نامعتبر است'
		set @Code = -1
		return
		end

END

GO

