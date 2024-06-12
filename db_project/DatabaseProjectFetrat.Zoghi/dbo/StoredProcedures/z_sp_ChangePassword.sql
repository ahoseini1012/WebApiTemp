-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 14020331
-- Description:	update user
-- =============================================
create     PROCEDURE [dbo].[z_sp_ChangePassword] 
	@userId int,
	@oldPassword varchar(200),
	@newPassword varchar(200),
	@responseMessage nvarchar(max) output,
	@retVal int output

AS
BEGIN
	-- check oldpass is correct or not
	declare @hashpass nvarchar(250)
	declare @salt NVARCHAR(36)
	select @salt = Guid from Users where Id = @userId

	select @hashpass = password from Users where Id = @userId and Password=HASHBYTES('SHA2_512', @oldPassword+CAST(@salt AS NVARCHAR(36)))
	if @hashpass = HASHBYTES('SHA2_512', @oldPassword+CAST(@salt AS NVARCHAR(36)))
		begin
			-- update password
			update dbo.Users set Password = HASHBYTES('SHA2_512', @newPassword + cast(@salt as nvarchar(36))) where id=@userId
			set @responseMessage= 'Password has been changed successfully!'
			set @retVal=1
		end
	else
		begin 
			set @responseMessage= 'Unfortunately password has not been changed!'
			set @retVal=-1
		end
END

GO

