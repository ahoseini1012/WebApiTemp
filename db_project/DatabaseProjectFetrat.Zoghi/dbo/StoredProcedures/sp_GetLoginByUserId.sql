-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 2023/09/05
-- Description:	to insert ContentCommentAdd into ftGRAM_CommentsReports table
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLoginByUserId]      
	@UserId int 
AS
BEGIN
	SET NOCOUNT ON;

	declare
	@LastPostVisited int ,
	@CommentCount int ,
	@LikeCount int ,
	@DislikeCount int ,
	@PostCount int ,
	@SaveCount int ,
	@ShareCount int 

	-- find the last visited post from ftGRAM_ContentsVisitLOG table
			set @LastPostVisited = (select top 1 c.ID from dbo.ftGRAM_ContentsVisitLOG c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			where c.ID=@UserId
			order by c.ID desc)

	-- find the count of CommentCount from ftGRAM_Comments table
			set @CommentCount = (select count(*) from dbo.ftGRAM_Comments c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			where c.ID=@UserId)

	-- find the count of LikeCount from ftGRAM_ContentsLikes table
			set @LikeCount = (select count(*) from dbo.ftGRAM_ContentsLikes c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			where c.ID=@UserId and c.LiksType=1) 
		
	-- find the count of DislikeCount from ftGRAM_ContentsLikes table
			set @DislikeCount = (select count(*) from dbo.ftGRAM_ContentsLikes c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			where c.ID=@UserId and c.LiksType=0) 

	-- find the count of PostCount from ftGRAM_Contents table
			set @PostCount = (select count(*) from dbo.ftGRAM_ContentsLikes c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			where c.ID=@UserId) 

	-- find the count of SaveCount from ftGRAM_Bookmarks table
			set @SaveCount = (select count(*) from dbo.ftGRAM_ContentsLikes c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			where c.ID=@UserId) 

	-- find the count of ShareCount from ftGRAM_ContentsShareLOG table
			set @ShareCount = (select count(*) from dbo.ftGRAM_ContentsLikes c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			where c.ID=@UserId) 


		declare @login dbo.login_2
		insert into @Login (UserId,name,family,showname,username,password,Picture,email,phone,F_M,website,ftMVC_EducationsID,instagramid,state,city,biography,googleaccount,active,uuid,question,answer)
		select id,name,family,name+' '+family,UserName,Password,Picture,Email,Phone,F_M,Website,ftMVC_EducationsID,InstagramID,State,City,Biography,googleAccount,Active,UUID,Question,Answer
		from ftMVC_Users
		where ID=@UserId

		declare @pic nvarchar(50),
				@gglAcc nvarchar(50),
				@id int;
		select @id=UserID, @pic=Picture , @gglAcc=googleAccount from @login
		if @pic is null
			begin
			update @login set Picture = N'https://fetratgram.com/img/user.png' where UserID=@UserId
			end
		else if (@gglAcc is null)
			begin
			print SUBSTRING(@pic,1,4)
				if SUBSTRING(@pic,1,4)='http'
					begin
					update ftMVC_Users set Picture = TRIM(@pic) where ID=@id
					update @login set Picture = TRIM(@pic) where UserID=@UserId
					end
				else
					begin
					update @login set Picture = N'https://fetratgram.com/Attach/Users/'+cast(@UserId as nvarchar)+TRIM(@pic) where UserID=@UserId   
					end
			end


		update @login
		set lastpostvisited=@LastPostVisited,CommentCount=@CommentCount,likecount=@LikeCount,dislikecount=@DislikeCount,postcount=@PostCount,savecount=@SaveCount,sharecount=@ShareCount
		where UserID=@UserId
	
		select * from @login where UserID=@UserId
END

GO

