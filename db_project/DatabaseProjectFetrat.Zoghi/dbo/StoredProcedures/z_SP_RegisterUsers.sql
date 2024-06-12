-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 1402/03/22
-- Description:	insert user details
-- =============================================

CREATE PROCEDURE [dbo].[z_SP_RegisterUsers]
	@UserName nvarchar(50) = NULL,
    @Password nvarchar(200) = NULL, 
	@Phone NVARCHAR(50) = NULL,
	@Email NVARCHAR(50) = NULL,
    @responseMessage NVARCHAR(250) OUTPUT,
	@returnToken int = 0 out
AS
	declare @PasswordSult UNIQUEIDENTIFIER = newid();
	declare @IsVerifiedEmail bit =0;
	declare @IsMobileValidated bit =0;
	declare @IsActive bit =0;
	declare @PasswordNew binary(64) =  HASHBYTES('SHA2_512', @Password + cast(@PasswordSult as nvarchar(36)));
begin
print ('==== [SP_AddUsers] =========')
	SET NOCOUNT ON
    BEGIN TRY
		begin tran
		INSERT INTO [dbo].ftMVC_Users
           ([UserName],[Email],[Phone],[PasswordNew],PasswordSult,Active,Email_OK,Phone_OK)
     VALUES
           (@UserName,@Email,@Phone,@PasswordNew,@PasswordSult,@IsActive,@IsVerifiedEmail,@IsMobileValidated)
        set @responseMessage = 'ok' 
		set @returnToken = CAST(RAND()*1000000 as int);
		declare @sendVerificationResponseMessage bit;
		if(@Email is not null)
			exec sp_SendVerificationEmail @Email , @returnToken ,@sendVerificationResponseMessage out			
		commit tran
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
		set @returnToken =0

		print @responseMessage
		print @returnToken
		rollback tran
    END CATCH
end

GO

