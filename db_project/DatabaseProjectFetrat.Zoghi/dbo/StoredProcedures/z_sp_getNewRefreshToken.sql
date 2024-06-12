-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 1402/04/10
-- Description:	get new refreshtoken by userid and old refreshtoken
-- =============================================
CREATE PROCEDURE [dbo].[z_sp_getNewRefreshToken]
	@userId bigint,
	@RefreshTokenTimeout int,
	@OldRefreshToken nvarchar(50),
	@NewRefreshToken nvarchar(50),
	@responseMessage bit = 0 out,
	@returnedCreatedAt datetime out

AS
BEGIN
	SET NOCOUNT ON;

	declare @createdat datetime 
	select @createdat=createdat from UserTokens 
	set @createdat = DATEADD(mi, @RefreshTokenTimeout,@createdat )
	declare @expireTime datetime = getdate()																		
	declare @isNotExpired bit = 0																		
	set @isNotExpired= case when @createdat>@expireTime  then  1 else 0 end		
	if exists (select * from UserTokens where UserId = @userId and IsValid=1 and RefreshToken like @OldRefreshToken and @isNotExpired=1)
		begin
			begin tran
				set @returnedCreatedAt = GETDATE()
				print @NewRefreshToken
				update UserTokens set RefreshToken=@NewRefreshToken , IsValid=1 , CreatedAt=@returnedCreatedAt where UserId=@userId
				insert into LoginHistory (userId,logInDateTime) values(@userid,GETDATE())
				set @responseMessage=1

			commit tran
		end
	else
			set @responseMessage=0
END

GO

