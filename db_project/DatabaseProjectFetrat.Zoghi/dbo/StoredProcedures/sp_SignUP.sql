-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 1402/03/22
-- Description:	insert user details
-- =============================================

CREATE PROCEDURE [dbo].[sp_SignUP]
	@registerType int,
	@username nvarchar(50) = NULL,
	@password nvarchar(50) = NULL,
	@question nvarchar(50) = NULL,
	@answer nvarchar(50) = NULL,
	@code nvarchar(50) = NULL,
	@UUID nvarchar(50) = NULL,
    @responseMessage NVARCHAR(250) output

AS
	declare @UserId int,
			@Active bit
	declare @getUsersResponseMessage nvarchar(max);

begin
SET NOCOUNT ON

	if (@registerType=4)  -- register by username
		begin
		select @UserId=ID from ftMVC_Users where UserName=@username 
		if @@ROWCOUNT>0
			begin
			exec sp_GetLoginByUserId @UserId
			set @responseMessage =N'old user'
			return
			end
		else
			begin
			begin Transaction
			declare @tempTable ftmvc_users_type2
			insert into @tempTable
			-- ثبت نام کاربر در جدول کاربران
			exec sp_RegisterUser null,null,@username,@password,N'https://fetratgram.com/img/user.png',null,null,null,null,1,null,null,null,null,null,1,@UUID,@question,@answer,0,0,null,null
			select @UserId=ID from @tempTable
			-- ثبت گروه کاربری ۶ و ۷ برای کاربر
			exec sp_registerUsersGroups 6,@UserId
			exec sp_registerUsersGroups 7,@UserId
			set @responseMessage=N'new user is registered'
			exec sp_GetLoginByUserId @UserId
			commit
			return
			end
		end
	
	
	-- =========================================================================================================================================
	
	else if (@registerType=5)  --register by phone
		begin
		-- تست کد ارسالی
		declare @isvalid int
		exec sp_otp_burn @username,NULL,@code,@isValidOTP =@isvalid
		if @isvalid=1
			begin
			select @UserId=ID,@Active=Active from ftMVC_Users where Trim(Phone)=Trim(@username)
			if (@@ROWCOUNT>0 and @Active=1)
				begin
				update ftMVC_Users set Phone_OK=1 where ID=@UserId
				exec sp_GetLoginByUserId @UserId
				set @responseMessage =N'old user'
				return
				end
			else if(@@ROWCOUNT>0 and @Active=0)
				begin
				set @responseMessage =N'این کاربر قبلا توسط ادمین غیر فعال شده است'
				return
				end
			else 
				begin
				begin Transaction
				insert into @tempTable
				-- ثبت نام کاربر در جدول کاربران
				exec sp_RegisterUser null,null,@username,@password,N'https://fetratgram.com/img/user.png',null,null,null,null,1,null,null,null,null,null,1,@UUID,@question,@answer,0,0,null,null
				select @UserId=ID from @tempTable
				-- ثبت گروه کاربری ۶ و ۷ برای کاربر
				exec sp_registerUsersGroups 6,@UserId
				exec sp_registerUsersGroups 7,@UserId
				set @responseMessage=N'new user is registered'
				exec sp_GetLoginByUserId @UserId
				commit
				return
				end
			end
		else
			begin
			set @responseMessage = N'OTP is not vaid.'
			return
			end
		end

	-- =========================================================================================================================================
		
	else if (@registerType=6)  --register by phone
		begin
		-- تست کد ارسالی
		exec sp_otp_burn NULL,@username,@code,@isValidOTP =@isvalid
		if @isvalid=1
			begin
			select @UserId=ID from ftMVC_Users where Trim(Email)=Trim(@username)
			if (@@ROWCOUNT>0 and @Active=1)
				begin
				update ftMVC_Users set Email_OK=1 where ID=@UserId
				exec sp_GetLoginByUserId @UserId
				set @responseMessage =N'old user'
				return
				end
			else if(@@ROWCOUNT>0 and @Active=0)
				begin
				set @responseMessage = N'این کاربر قبلا توسط ادمین غیر فعال شده است'
				return
				end
			else
				begin
				begin Transaction
				insert into @tempTable
				-- ثبت نام کاربر در جدول کاربران
				exec sp_RegisterUser null,null,@username,@password,N'https://fetratgram.com/img/user.png',null,null,null,null,1,null,null,null,null,null,1,@UUID,@question,@answer,0,0,null,null
				select @UserId=ID from @tempTable
				-- ثبت گروه کاربری ۶ و ۷ برای کاربر
				exec sp_registerUsersGroups 6,@UserId
				exec sp_registerUsersGroups 7,@UserId
				set @responseMessage=N'new user is registered'
				exec sp_GetLoginByUserId @UserId
				commit
				return
				end
			end
		else
			begin
			set @responseMessage = N'OTP is not vaid.'
			return
			end
		end

end

GO

