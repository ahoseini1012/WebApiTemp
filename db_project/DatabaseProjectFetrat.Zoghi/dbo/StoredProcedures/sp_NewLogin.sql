-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_NewLogin]
	@UserName nvarchar(50)=null,
	@Email nvarchar(50)=null,
	@Phone nvarchar(50)=null,

	@Message nvarchar(50) = null output,
	@Result int = null output,
	@OTP int = null output
AS
BEGIN
	SET NOCOUNT ON;
	-- تعریف تیبل تایپ برای رکورد یوزر
	declare @ftmvc_user as ftMVC_Users_type,
			@userid int = null

	------------------------------------------------------------- جستجو با یوزرنیم ------------------------------------------------------------
	if @Username is not null  
		begin
			insert into @ftmvc_user
			select ID,Name,Family,UserName,[Password],PasswordNew,PasswordSult,Phone,UUID,Active,ftMVC_EducationsID,Phone_OK,Email_OK,Picture,Email,F_M,googleAccount
				from ftMVC_Users where TRIM(UPPER(UserName)) like TRIM(UPPER(@UserName)) and Active=1
			if @@ROWCOUNT >0
				begin
				set @Message = N'ورود با نام کاربری';
				set @Result = N'1';
				return
				end
			else
				begin
				set @Message = N'ثبت نام با نام کاربری';
				set @Result = N'4';
				return
				end
		end

	------------------------------------------------------------- جستجو با شماره موبایل ------------------------------------------------------------
	if @Phone is not null  
		begin

			--پیدا کردن حساب فعال از طریق شماره موبایل 
			insert into @ftmvc_user
			select ID,Name,Family,UserName,[Password],PasswordNew,PasswordSult,Phone,UUID,Active,ftMVC_EducationsID,Phone_OK,Email_OK,Picture,Email,F_M,googleAccount
				from ftMVC_Users where TRIM(UPPER(Phone)) like TRIM(UPPER(@Phone)) and Active=1 
			if @@ROWCOUNT >0  -- اگر رکوردی یافت شد
			begin 
				--1) پیدا کردن موبایل فعال بدون کلمه عبور پس با کد یکبار مصرف
				set @userid = (select id from @ftmvc_user where Phone_OK =1 and [Password] is null)
				if @userid is not null  
					begin
					exec sp_OTP_Generate @Phone,null,@OTP output
					set @Message = N'ورود با کد یکبار مصرف موبایل';
					set @Result = N'7'
					return
					end
			
				--2)پیدا کردن موبایل فعال به هراه کلمه عبور پس با کلمه عبور
				set @userid = (select ID from @ftmvc_user where Phone_OK =1 and [Password] is not null)
				if @userid is not null  
					begin
					set @Message = N'ورود موبایل';
					set @Result = N'2'
					return
					end
			
				--3) پیدا کردن موبایل غیرفعال پس با کد یکبار مصرف
				set @userid = (select ID from @ftmvc_user where Phone_OK != 1) 
				if @userid is not null 
					begin
					exec sp_OTP_Generate @Phone,null,@OTP output
					set @Message = N'ورود با کد یکبار مصرف موبایل';
					set @Result = N'7'
					return
					end
			end
			-- عدم پیدا کردن حساب فعال از طریق شماره موبایل
			else 
				begin
				exec sp_OTP_Generate @Phone,null,@OTP output
				set @Message = N'ورود با کد یکبار مصرف موبایل';
				set @Result = N'5'
				return
				end
		end
	------------------------------------------------------------- جستجو باایمیل ------------------------------------------------------------
	if @Email is not null
		begin
			-- پیدا کردن حساب از بوسیله ایمیل ارسالی
			insert into @ftmvc_user
			select ID,Name,Family,UserName,[Password],PasswordNew,PasswordSult,Phone,UUID,Active,ftMVC_EducationsID,Phone_OK,Email_OK,Picture,Email,F_M,googleAccount
				from ftMVC_Users where TRIM(UPPER(Email)) like TRIM(UPPER(@Email)) and Active=1
			if @@ROWCOUNT >0  -- اگر رکوردی یافت شد
				begin 
					--1)   ایمیل این رکورد پیدا شده فعال هست بدون پسورد
					set @userid = (select ID from @ftmvc_user where Email_OK= 1 and [Password] is null)
					if @userid is not null
						begin
						exec sp_OTP_Generate null,@Email,@OTP output
						set @Message = N'ورود با کد یکبار مصرف ایمیل';
						set @Result = N'8'
						return
						end
					
					--2)   ایمیل این رکورد پیدا شده فعال هست به همراه پسورد
					set @userid = (select ID from @ftmvc_user where Email_OK= 1 and [Password] is not null)
					if @userid is not null
						begin
						exec sp_OTP_Generate null,@Email,@OTP output
						set @Message = N'ورود با ایمیل';
						set @Result = N'3'
						return
						end
					--3) ایمیل این رکورد پیدا شده اصلا فعال نیست
					set @userid = (select ID from @ftmvc_user where Email_OK!= 1)
					if @userid is not null
						begin
						exec sp_OTP_Generate null,@Email,@OTP output
						set @Message = N'ورود با کد یکبار مصرف ایمیل';
						set @Result = N'8'
						return
						end
				end
			else  -- عدم پیدا کردن حساب فعال از طریق ایمیل
				begin
				exec sp_OTP_Generate null,@Email,@OTP output
				set @Message = N'ثبت نام با ایمیل';
				set @Result = N'6'
				return
				end
		end
END

GO

