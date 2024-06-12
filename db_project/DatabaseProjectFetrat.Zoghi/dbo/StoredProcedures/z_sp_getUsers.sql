-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
create PROCEDURE [dbo].[z_sp_getUsers]
	@Email nvarchar(50)=null,
	@Mobile nvarchar(50)=null,
	@Username nvarchar(50)=null,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	select top 1 * from ft_Users where Email = @Email or Mobile = @Mobile or UserName = @Username
	if @@ROWCOUNT =0 set @responseMessage = 'not found any user'

END

GO

