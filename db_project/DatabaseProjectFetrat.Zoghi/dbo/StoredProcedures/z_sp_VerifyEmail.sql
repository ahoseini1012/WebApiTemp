-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	insert verification record to EmailVerificationHistory
-- =============================================
CREATE PROCEDURE [dbo].[z_sp_VerifyEmail]
	@Email nvarchar(50)=null,
	@Token int,
    @responseMessage bit OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	declare @verificationId bigint
	select top 1 @verificationId=us.Id from Users us join EmailVerificationHistory ev on ev.Userid=us.Id 
		where us.Email like @Email and ev.Token=@Token and GETDATE()<ev.expireDateTime order by ev.Id desc
	if(@verificationId is not null) 
		begin
			begin tran
				update Users set IsVerifiedEmail=1 where Id = @verificationId
				update EmailVerificationHistory set IsBurned=1 where Userid=@verificationId
				set @responseMessage = 1;
			commit tran
		end
	else
		set @responseMessage = 0;
END

GO

