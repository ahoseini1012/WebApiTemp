-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_verifyOTP]
	@OTP int null,
	@Phone nvarchar(50)=null,
	@Email nvarchar(50)=null,
	@isVerified bit = 0 output
AS
BEGIN
	SET NOCOUNT ON;
	declare @DisposeId int,
			@query nvarchar(max),
			@UserId int,
			@PictureName nvarchar(50)
		
	print @query
	-- احراز توکن ارسالی به موبایل
	if @Phone is not null
		begin
		set @DisposeId = (select id from ftMVC_DisposableTemp where trim(Phone) = Trim(@Phone) and @OTP=Code and Date_Create>DATEADD(week,-3,GETDATE()))
		delete from ftMVC_DisposableTemp where ID = @DisposeId
		select @UserId=Id from ftMVC_Users where Phone=@Phone and Active=1 
		end
	else
		begin
		set @DisposeId = (select id from ftMVC_DisposableTemp where trim(Email) = Trim(@Email) and @OTP=Code and Date_Create>DATEADD(week,-3,GETDATE()))
		delete from ftMVC_DisposableTemp where ID = @DisposeId
		select @UserId=Id from ftMVC_Users where Email=@Email and Active=1
		end

	if @DisposeId >0
		begin
		set @isVerified = 1
		exec sp_GetLoginByUserId @UserId --,@LastPostVisited,@CommentCount,@LikeCount,@DislikeCount,@PostCount,@SaveCount,@ShareCount
		end
	else
		set @isVerified=0

END

GO

