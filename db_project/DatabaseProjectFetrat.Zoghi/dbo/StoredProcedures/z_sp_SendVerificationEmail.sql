-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	insert verification record to EmailVerificationHistory
-- =============================================
CREATE PROCEDURE [dbo].[z_sp_SendVerificationEmail]
	@Email nvarchar(50)=null,
	@Token int,
    @responseMessage bit OUTPUT
AS
BEGIN
print '==== [sp_SendVerificationEmail] ======'
	SET NOCOUNT ON;
	declare @userTable userTable
	insert into @userTable
	select Id,Guid from ft_Users where Email like @Email
	if exists(select * from @userTable) 
		begin
			declare @userid bigint;
			select @userid = id from @userTable;
			select * from @userTable
			insert 
				into EmailVerificationHistory (Userid,token,isburned,datetime,expireDatetime) 
				values(@userid,@Token,0,GETDATE(),DATEADD( MINUTE,5,GETDATE()));
			set @responseMessage = 1;
		end
	else
		set @responseMessage = 0;
END

GO

