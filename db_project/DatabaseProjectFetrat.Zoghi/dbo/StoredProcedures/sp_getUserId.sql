-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
create PROCEDURE [dbo].[sp_getUserId]
	@UUID nvarchar(50)=null,
	@UserId int output,
    @getUsersResponseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	set @UUID=trim(@UUID)
	select * from ftMVC_Users where UUID like '%'+@UUID+'%'
	select @UserId=id from ftMVC_Users where UUID like '%'+@UUID+'%'
	--select @UserId
	if (@UserId is null)
		set @getUsersResponseMessage = 'not found any user' 
END

GO

