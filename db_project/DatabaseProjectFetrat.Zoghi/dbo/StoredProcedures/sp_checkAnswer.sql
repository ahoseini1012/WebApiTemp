-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE sp_checkAnswer
@usersname nvarchar(50),
@answer nvarchar(250),
@newPassword int output,
@responseMessage nvarchar(50) output,
@randomCode int output
AS
BEGIN
	declare 
		@phone nvarchar(20)
		
	select @phone=Phone from ftMVC_Users where Answer = @answer
	if @@ROWCOUNT>0
		begin
		EXEC	[dbo].[sp_resetPassword]
		@mobile = @phone,
		@responseMessage = @responseMessage OUTPUT,
		@usersName = @usersName OUTPUT,
		@randomCode = @randomCode OUTPUT

		select @phone,@responseMessage,@usersname,@randomCode
		end
	else
		begin
		set @randomCode=-1
		end
END

GO

