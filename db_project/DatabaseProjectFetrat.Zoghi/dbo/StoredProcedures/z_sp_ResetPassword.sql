-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 14020408
-- Description:	to reset user's password
-- =============================================
CREATE PROCEDURE [dbo].[z_sp_ResetPassword] 
	@email nvarchar(100),
	@newPassword varchar(200),
	@token nvarchar (6),
	@responseMessage bit=0 output

AS
BEGIN
	declare @userId bigint = 0
	--check token
	select top 1 @userId = us.Id from Users us join EmailVerificationHistory ev on ev.Userid=us.Id 
	where us.Email=@Email and ev.Token=@Token and GETDATE()<ev.expireDateTime  and ev.IsBurned=0
	order by ev.Id desc 

	--update password
	declare @salt NVARCHAR(36)
	select @salt = Guid from Users where Email = @email
		begin
			-- update password
			begin tran
				update dbo.Users set Password = HASHBYTES('SHA2_512', @newPassword + cast(@salt as nvarchar(36))) where Email = @email and Id=@userId
				update EmailVerificationHistory set IsBurned=1 where Userid=@userId
				set @responseMessage= 1
			commit tran
		end
END

GO

