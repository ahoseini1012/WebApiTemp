-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_getLogin]
	@UserName nvarchar(50)=null,
	@Phone nvarchar(50)=null,
	@Email nvarchar(50)=null,
	@UserId int=null,
	@GoogleAccount nvarchar(50)=null
AS
BEGIN
	SET NOCOUNT ON;
	if @UserId is null
		set @UserId = 0;

	if(@Username is not null)
		begin
		select @UserId=id from ftMVC_Users where TRIM(Upper(UserName)) like TRIM(Upper(@UserName)) and Active=1
		end
	else if(@Phone is not null)
		begin
		select @UserId=id from ftMVC_Users where TRIM(Upper(Phone)) like TRIM(Upper(@Phone)) and Active=1
		end
	else if(@Email is not null)
		begin
		select @UserId=id from ftMVC_Users where TRIM(Upper(Email)) like TRIM(Upper(@Email)) and Active=1
		end
	else if(@GoogleAccount is not null)
		begin
		select @UserId=id from ftMVC_Users where TRIM(Upper(GoogleAccount)) like TRIM(Upper(@GoogleAccount))
		end
	
	if(@UserId>0)
		begin
		exec sp_GetLoginByUserId @userId
		end

END

GO

