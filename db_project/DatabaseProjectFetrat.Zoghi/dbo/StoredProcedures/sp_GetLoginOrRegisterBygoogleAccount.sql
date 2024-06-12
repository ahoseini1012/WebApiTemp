-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLoginOrRegisterBygoogleAccount]
	@googleAccount nvarchar(50)=null,
	@Name nvarchar(50)=null,
	@Family nvarchar(50)=null,
	@UserName nvarchar(50)=null,
	@Picture nvarchar(50)=null,
	@UUID nvarchar(50)=null,
	@Email nvarchar(50)=null,
	@Gender nvarchar(50)=null,
	 
    @getUsersResponseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	declare @UserId int=null;
	declare @ftMVC_Users_type ftMVC_Users_type;

	select @UserId =ID from ftMVC_Users where Trim(UPPER(googleAccount)) like Trim(UPPER(@googleAccount))
	if @UserId>0
		begin
		select @UserId=id from ftMVC_Users where Trim(UPPER(googleAccount)) like Trim(UPPER(@googleAccount))
		exec sp_getloginByUserId @UserId --,@LastPostVisited output,@CommentCount output,@LikeCount output,@DislikeCount output,@PostCount output,@SaveCount output,@ShareCount output
		set @getUsersResponseMessage=  'The user has been found'
		end
	else
		begin
		
		insert into dbo.ftMVC_Users (Name,Family,UserName,Password,PasswordNew,PasswordSult,Phone,Picture,UUID,Email,ftMVC_EducationsID,F_M,googleAccount)
		output inserted.ID, inserted.Name,inserted.Family,inserted.UserName,null,null,null,null,inserted.UUID,null,inserted.ftMVC_EducationsID,null,null,inserted.Picture,inserted.Email,inserted.F_M,inserted.googleAccount 
		into @ftMVC_Users_type
		values(@Name,@Family,ISNULL(@UserName,@googleAccount),null,null,null,null,@Picture,@UUID,@Email,1,@Gender,@googleAccount)
		set @getUsersResponseMessage= 'New user added'
		set @UserId=(select id from @ftMVC_Users_type)
		exec sp_getloginByUserId @UserId --,@LastPostVisited output,@CommentCount output,@LikeCount output,@DislikeCount output,@PostCount output,@SaveCount output,@ShareCount output
		end

		
END

GO

