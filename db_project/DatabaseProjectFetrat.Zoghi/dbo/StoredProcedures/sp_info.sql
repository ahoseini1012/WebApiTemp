-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_info]
	@UserString nvarchar(50),
	@Password nvarchar(50),
	@type int,
    @getUsersResponseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	declare @userId int;
	print cast(@type as nvarchar)
	if @type=1
		begin
			set @userId=(select id from ftMVC_Users where UserName like @UserString and Password like @Password)
			print 'a'
		end
	if @type=2
		begin
			set @userId=(select id from ftMVC_Users where Email like @UserString and Password like @Password)
			print 'b'
		end
	if @type=3
		begin
			set @userId=(select id from ftMVC_Users where Phone like @UserString and Password like @Password)
			print 'c'
		end
		
		select @userId
	if (@userId is null)
		set @getUsersResponseMessage = 'not found any user' 
END

GO

