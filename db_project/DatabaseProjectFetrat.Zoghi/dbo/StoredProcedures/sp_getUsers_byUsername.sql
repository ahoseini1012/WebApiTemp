-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_getUsers_byUsername]
	@Username nvarchar(50)=null,
    @getUsersResponseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	set @Username=trim(@Username)

	select * from ftMVC_Users where UPPER(Username) like UPPER(@Username)
END

GO

