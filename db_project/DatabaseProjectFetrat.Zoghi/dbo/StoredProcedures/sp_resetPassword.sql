-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_resetPassword]
	@mobile nvarchar(20),
	@responseMessage nvarchar(50) output,
	@usersName nvarchar(50) output,
	@randomCode int output
AS
BEGIN
	SET NOCOUNT ON;
	declare @userid int,
			@passSult nvarchar(36),
			@PasswordNew binary(64)
	select @userid=ID,@usersName=Name+' '+Family,@passSult=PasswordSult from ftMVC_Users where TRIM(Phone) like TRIM(@mobile)
	if @@ROWCOUNT>0
		begin
		set @randomCode= floor(rand()*(1000000-100000)+100000);
		set @PasswordNew  =  HASHBYTES('SHA2_512', cast(@randomCode as nvarchar(6)) + cast(@passSult as nvarchar(36)));
		update ftMVC_Users set Password=@randomCode,PasswordNew=@PasswordNew where ID=@userid
		set @responseMessage =N'عملیات بازنشانی کلمه عبور با موفقیت انجام شد.'
		end
	else
		begin
		set @responseMessage =N'شماره موبایل نامعتبر میباشد.'
		end

END

GO

