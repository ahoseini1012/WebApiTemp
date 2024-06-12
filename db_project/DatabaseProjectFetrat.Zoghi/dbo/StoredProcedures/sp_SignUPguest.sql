-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 1402/03/22
-- Description:	insert user details
-- =============================================

CREATE PROCEDURE [dbo].[sp_SignUPguest]
	@UUID nvarchar(50) = NULL,
    @responseMessage NVARCHAR(250) output

AS
	declare @UserId int;
	declare @getUsersResponseMessage nvarchar(max);

begin
print ('==== [sp_SignUPguest] =========')
SET NOCOUNT ON
	exec dbo.sp_getUserId @UUID,@UserId output,@getUsersResponseMessage output

	if (@UserId is null)
		begin
		-- register new user as guest
			declare @ID table (ID int)
			insert into dbo.ftMVC_Users (Name,Family,UserName,UUID,Active,ftMVC_EducationsID,Phone_OK,Email_OK,Picture)
			output inserted.id
			into @ID 
			values	(N'کاربر',N'مهمان',N'guest-' + UPPER(@UUID),UPPER(@UUID),1,1,0,0,N'https://fetratgram.com/img/user.png')
			set @UserId = (select id from @ID)
			--select @newGuestAddedId= ID from @ID
			set @responseMessage='new guest has been added successfully.'
		end
	else
		begin
			set @responseMessage= 'user has been existed'
		end

		exec sp_getloginByUserId @UserId --,@LastPostVisited output,@CommentCount output,@LikeCount output,@DislikeCount output,@PostCount output,@SaveCount output,@ShareCount output

end

GO

