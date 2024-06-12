-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUserInformationByID]
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
	@ShareCount int ,
	@BookmarkCount int ,
	@MessageCount int

	-- find the last visited post from ftGRAM_ContentsVisitLOG table
			set @LastPostVisited = (select top 1 c.ID from dbo.ftGRAM_ContentsVisitLOG c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			where c.ID=@UserId
			order by c.ID desc)

	-- find the count of CommentCount from ftGRAM_Comments table
			set @CommentCount = (select count(*) from dbo.ftGRAM_Comments c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			join dbo.ftGRAM_Contents cnt on cnt.ftMVC_UsersID=u.ID
			where c.ID=@UserId and c.Type_Active=1 and cnt.Active=1)

	-- find the count of LikeCount from ftGRAM_ContentsLikes table
			set @LikeCount = (select count(*) from dbo.ftGRAM_ContentsLikes c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			join dbo.ftGRAM_Contents cnt on cnt.ftMVC_UsersID=u.ID
			where c.ID=@UserId and c.LiksType=1 and cnt.Active=1)
		
	-- find the count of DislikeCount from ftGRAM_ContentsLikes table
			set @DislikeCount = (select count(*) from dbo.ftGRAM_ContentsLikes c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			join dbo.ftGRAM_Contents cnt on cnt.ftMVC_UsersID=u.ID
			where c.ID=@UserId and c.LiksType=2 and cnt.Active=1)

	-- find the count of PostCount from ftGRAM_Contents table
			set @PostCount = (select count(*) from dbo.ftGRAM_Contents c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			where c.ID=@UserId and c.Active=1) 

	-- find the count of SaveCount from ftGRAM_Bookmarks table
			set @SaveCount = (select count(*) from dbo.ftGRAM_Bookmarks c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			where c.ID=@UserId) 

	-- find the count of ShareCount from ftGRAM_ContentsShareLOG table
			set @ShareCount = (select count(*) from dbo.ftGRAM_ContentsShareLOG c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			where c.ID=@UserId) 

	-- find the count of BookmarkCount from ftGRAM_ContentsBookmarks table
			set @BookmarkCount = (select count(*) from dbo.ftGRAM_ContentsBookmarks c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			join dbo.ftGRAM_Contents cnt on cnt.ftMVC_UsersID=u.ID
			where c.ID=@UserId and cnt.Active=1) 

	-- find the count of BookmarkCount from ftGRAM_ContentsBookmarks table
			set @MessageCount = (select count(*) from dbo.ftGRAM_MessagesVisited c
			join dbo.ftMVC_Users u on c.ftMVC_UsersID=u.ID
			where c.ID=@UserId and c.Date_Visited=null) 
			

		declare @UserInformation_ID dbo.UserInformation_ID
		insert into @UserInformation_ID (ID,name,family,username,password,passwordNew,passwordSult,Picture,email,phone,F_M,website,ftMVC_EducationsID,instagramid,state,city,biography,googleaccount,active,uuid,question,answer,Phone_OK,Email_OK,code,HasChannel,CommentCount,LikeCount,DislikeCount,Postcount,SaveCount,ShareCount,BookmarkCount,MessageCount,Result,Message)
		select id,name,family,UserName,Password,passwordNew,passwordSult,Picture,Email,Phone,F_M,Website,ftMVC_EducationsID,InstagramID,State,City,Biography,googleAccount,Active,UUID,Question,Answer,Phone_OK,Email_OK,Code,hasChannel,@CommentCount,@LikeCount,@DislikeCount,@PostCount,@SaveCount,@ShareCount,@BookmarkCount,@MessageCount,N'OK',N'عملیات با موفقیت انجام شد'
		from ftMVC_Users
		where ID=@UserId

		declare @pic nvarchar(50),
				@gglAcc nvarchar(50),
				@id int;
		select @id=ID, @pic=Picture , @gglAcc=googleAccount from @UserInformation_ID
		if @pic is null
			begin
			update @UserInformation_ID set Picture = N'https://fetratgram.com/img/user.png' where ID=@UserId
			end
		else if (@gglAcc is null)
			begin
			print SUBSTRING(@pic,1,4)
				if SUBSTRING(@pic,1,4)='http'
					begin
					update ftMVC_Users set Picture = TRIM(@pic) where ID=@id
					update @UserInformation_ID set Picture = TRIM(@pic) where ID=@UserId
					end
				else
					begin
					update @UserInformation_ID set Picture = N'https://fetratgram.com/Attach/Users/'+cast(@UserId as nvarchar)+TRIM(@pic) where ID=@UserId   
					end
			end
	
		select * from @UserInformation_ID where ID=@UserId
END

GO

