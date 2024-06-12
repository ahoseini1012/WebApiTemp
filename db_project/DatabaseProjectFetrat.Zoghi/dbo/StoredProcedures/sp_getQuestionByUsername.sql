-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE sp_getQuestionByUsername
	@username nvarchar(max),
	@question nvarchar(max) out,
	@result int = 0 out
AS
BEGIN
	SET NOCOUNT ON;
	select @question = Question from ftmvc_users
	where Trim(UPPER(UserName)) = TRIM(Upper(@username))
	if @question is not null or len(@question)=0
		begin
		set @result = 1;
		end
	else
		begin
		set @result = -1;
		end
END

GO

