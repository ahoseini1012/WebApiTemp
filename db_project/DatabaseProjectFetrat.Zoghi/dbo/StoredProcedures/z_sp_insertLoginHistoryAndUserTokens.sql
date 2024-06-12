-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 1402/04/09
-- Description:	used for store refreshtoken and LoginHistory into database
-- =============================================
CREATE PROCEDURE [dbo].[z_sp_insertLoginHistoryAndUserTokens]
	@Accesstoken nvarchar(50),
	@RefreshToken nvarchar(50),
	@UserId bigint,
	@responseMessage nvarchar(50) out,
	@responseBoolean bit = 0 out
AS
BEGIN
	SET NOCOUNT ON;

	declare @isFirstLogin bit;
	if exists(select top 1 * from UserTokens where UserId=@UserId) set @isFirstLogin=0 else set @isFirstLogin=1
		begin
			begin Tran
				SET @responseMessage='operation completed'
				set @responseBoolean = 1
				if(@isFirstLogin=1)
					insert into UserTokens (UserId,RefreshToken,CreatedAt,IsValid) values(@userid,@RefreshToken,GETDATE(),1)
				else
					update UserTokens set RefreshToken=@RefreshToken , CreatedAt = GetDate(),IsValid=1 where UserId=@userid
				insert into LoginHistory (userId,logInDateTime) values(@userid,GETDATE())
			commit Tran
			return
		end
			SET @responseMessage='unfortunately operation faild'
			set @responseBoolean=0
END

GO

