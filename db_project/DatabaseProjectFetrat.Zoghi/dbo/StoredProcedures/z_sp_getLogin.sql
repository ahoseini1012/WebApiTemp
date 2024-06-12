-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 1402/03/24
-- Description:	used for login by username and password
-- =============================================
CREATE PROCEDURE [dbo].[z_sp_getLogin]
	@Email nvarchar(50),
	@Password nvarchar(50),
	@responseMessage nvarchar(50) out,
	@responseBoolean bit = 0 out
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @userid int;
	declare @userTable userTable
	insert into @userTable
	SELECT top 1 * from Users where Email = @Email

	--check email is existed or not
	if not exists (select top 1 * from @userTable where Email = @Email) 
	begin
		set @responseMessage=N'Email not found';
		set @responseBoolean = 0
		return 
	end

	--check email is verified or not
	if not exists (select top 1 * from @userTable where Email = @Email and  IsVerifiedEmail=1) 
	begin
		set @responseMessage=N'Email is not verified';
		set @responseBoolean = 0
		return 
	end

	--check email and password is corrected or not
	if not exists (SELECT top 1 * from @userTable where Email = @Email AND Password=HASHBYTES('SHA2_512', @Password + CAST (guid as nvarchar(150))) and IsVerifiedEmail=1)
		begin
			set @responseMessage=N'Email or Password is incorrect';
			set @responseBoolean = 0
			return 
		end

	select @userid = id from @userTable
	declare @isFirstLogin bit;
	if exists(select top 1 * from UserTokens where UserId=@userid) set @isFirstLogin=0 else set @isFirstLogin=1

	if exists(SELECT top 1 * from @userTable)
		begin
			begin Tran
				SET @responseBoolean=1  -- User successfully logged in
				select id,Username,Guid,Email,FirstName,LastName,MobileNumber from @userTable
			commit Tran
		end
	else 
		SET @responseBoolean=0
END

GO

