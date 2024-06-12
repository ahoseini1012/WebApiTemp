
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_OTP_Generate]
	@Phone nvarchar(50)=null,
	@Email nvarchar(50)=null,
	@Code int output
AS
BEGIN
	SET NOCOUNT ON;
	declare @tbl_temp table(Code int)

	select @Code=Code from ftMVC_DisposableTemp where Trim(Phone) like Trim(@Phone) and Date_Create>DATEADD(MINUTE,-3,GETDATE())
	if @Code is null
	begin
		declare @rand  as int;
		set @rand= rand()*(9999-999+1)+999;
		insert into ftMVC_DisposableTemp (date_create,Phone,Email,Code)
		output inserted.Code into @tbl_temp
		values (GETDATE(),@Phone,@Email,@rand)
		set @Code=(select code from @tbl_temp)
	end
END

GO

