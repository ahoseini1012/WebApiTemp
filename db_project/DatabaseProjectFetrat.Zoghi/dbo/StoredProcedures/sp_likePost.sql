-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_likePost]
@channelId int,
@postid int,
@likeType int,
@userid int,
@ip nvarchar(20),
@browser nvarchar(20),
@type bit,
@result bit out
AS
BEGIN
	SET NOCOUNT ON;
	declare
		@_Id int =0,
		@_likeType int

	if @channelId =0
		begin
		select @_Id = ID , @_likeType=LiksType  from ftGRAM_ContentsLikes where ftGRAM_ContentsID =@postid and ftMVC_UsersID=@userid
		if (@_Id>0 and @_likeType=2 and @type=0)
			begin
			delete from ftGRAM_ContentsLikes where ID=@_Id
			set @result = 0;
			return;
			end
		
		if (@_Id>0 and @_likeType!=2 and @type=1)
			begin
			update ftGRAM_ContentsLikes set LiksType=2,IP=@ip,Browser=@browser where ID=@_Id
			set @result =1
			return
			end
			
		if @_Id=0
			begin
			insert into ftGRAM_ContentsLikes (ftGRAM_ContentsID,ftMVC_UsersID,LiksType,IP,Browser) values (@postid,@userid,2,@ip,@browser)
			set @result=1
			return
			end
		end
	else
		begin
		select @_Id = ID , @_likeType=LiksType  from ftGRAM_ChannelsContentsLikes where ftGRAM_ChannelsContentsID =@postid and ftMVC_UsersID=@userid
		if (@_Id>0 and @_likeType=2 and @type=0)
			begin
			delete from ftGRAM_ChannelsContentsLikes where ID=@_Id
			set @result = 0;
			return;
			end
		
		if (@_Id>0 and @_likeType!=2 and @type=1)
			begin
			update ftGRAM_ChannelsContentsLikes set LiksType=2,IP=@ip,Browser=@browser where ID=@_Id
			set @result =1
			return
			end
			
		if @_Id=0
			begin
			insert into ftGRAM_ChannelsContentsLikes (ftGRAM_ChannelsContentsID,ftMVC_UsersID,LiksType,IP,Browser) values (@postid,@userid,2,@ip,@browser)
			set @result=1
			return
			end
		end
END

GO

