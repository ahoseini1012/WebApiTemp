USE [Fetrat.Zoghi]
GO
/****** Object:  StoredProcedure [dbo].[z_sp_VerifyEmail]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[z_sp_VerifyEmail]
GO
/****** Object:  StoredProcedure [dbo].[z_sp_updateUser]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[z_sp_updateUser]
GO
/****** Object:  StoredProcedure [dbo].[z_sp_SendVerificationEmail]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[z_sp_SendVerificationEmail]
GO
/****** Object:  StoredProcedure [dbo].[z_sp_ResetPassword]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[z_sp_ResetPassword]
GO
/****** Object:  StoredProcedure [dbo].[z_SP_RegisterUsers]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[z_SP_RegisterUsers]
GO
/****** Object:  StoredProcedure [dbo].[z_sp_insertLoginHistoryAndUserTokens]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[z_sp_insertLoginHistoryAndUserTokens]
GO
/****** Object:  StoredProcedure [dbo].[z_sp_getUsers]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[z_sp_getUsers]
GO
/****** Object:  StoredProcedure [dbo].[z_sp_getNewRefreshToken]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[z_sp_getNewRefreshToken]
GO
/****** Object:  StoredProcedure [dbo].[z_sp_getLogout]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[z_sp_getLogout]
GO
/****** Object:  StoredProcedure [dbo].[z_sp_getLogin]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[z_sp_getLogin]
GO
/****** Object:  StoredProcedure [dbo].[z_sp_ChangePassword]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[z_sp_ChangePassword]
GO
/****** Object:  StoredProcedure [dbo].[sp_verifyOTP]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_verifyOTP]
GO
/****** Object:  StoredProcedure [dbo].[sp_SignUPguest]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_SignUPguest]
GO
/****** Object:  StoredProcedure [dbo].[sp_SignUP]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_SignUP]
GO
/****** Object:  StoredProcedure [dbo].[sp_resetPassword]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_resetPassword]
GO
/****** Object:  StoredProcedure [dbo].[sp_registerUsersGroups]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_registerUsersGroups]
GO
/****** Object:  StoredProcedure [dbo].[sp_RegisterUser]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_RegisterUser]
GO
/****** Object:  StoredProcedure [dbo].[sp_OTP_Generate_ByPhoneCheck2]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_OTP_Generate_ByPhoneCheck2]
GO
/****** Object:  StoredProcedure [dbo].[sp_OTP_Generate_ByPhoneCheck]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_OTP_Generate_ByPhoneCheck]
GO
/****** Object:  StoredProcedure [dbo].[sp_OTP_Generate]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_OTP_Generate]
GO
/****** Object:  StoredProcedure [dbo].[sp_OTP_Burn2]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_OTP_Burn2]
GO
/****** Object:  StoredProcedure [dbo].[sp_OTP_Burn]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_OTP_Burn]
GO
/****** Object:  StoredProcedure [dbo].[sp_NewLogin]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_NewLogin]
GO
/****** Object:  StoredProcedure [dbo].[sp_likePost]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_likePost]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertHashTags]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_insertHashTags]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertftGRAM_ContentsFiles]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_insertftGRAM_ContentsFiles]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertCategories]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_insertCategories]
GO
/****** Object:  StoredProcedure [dbo].[sp_info]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_info]
GO
/****** Object:  StoredProcedure [dbo].[sp_GRAM_chkURLAddress]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_GRAM_chkURLAddress]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetVersion]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_GetVersion]
GO
/****** Object:  StoredProcedure [dbo].[sp_getUsers_byUsername]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_getUsers_byUsername]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserInformationByID]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_GetUserInformationByID]
GO
/****** Object:  StoredProcedure [dbo].[sp_getUserId]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_getUserId]
GO
/****** Object:  StoredProcedure [dbo].[sp_getQuestionByUsername]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_getQuestionByUsername]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetLoginOrRegisterBygoogleAccount]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_GetLoginOrRegisterBygoogleAccount]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetLoginByUserId]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_GetLoginByUserId]
GO
/****** Object:  StoredProcedure [dbo].[sp_getLogin]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_getLogin]
GO
/****** Object:  StoredProcedure [dbo].[sp_getAccess]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_getAccess]
GO
/****** Object:  StoredProcedure [dbo].[sp_dislikePost]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_dislikePost]
GO
/****** Object:  StoredProcedure [dbo].[sp_createURLAddress]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_createURLAddress]
GO
/****** Object:  StoredProcedure [dbo].[sp_createPost]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_createPost]
GO
/****** Object:  StoredProcedure [dbo].[sp_contentCommentAdd]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_contentCommentAdd]
GO
/****** Object:  StoredProcedure [dbo].[sp_checkAnswer]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_checkAnswer]
GO
/****** Object:  StoredProcedure [dbo].[sp_checkAndGenerateUrl]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_checkAndGenerateUrl]
GO
/****** Object:  StoredProcedure [dbo].[sp_aaaaaaaaa]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[sp_aaaaaaaaa]
GO
/****** Object:  StoredProcedure [dbo].[proc_deleteContent]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[proc_deleteContent]
GO
/****** Object:  StoredProcedure [dbo].[ftsMVC_ListEventINTime]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP PROCEDURE [dbo].[ftsMVC_ListEventINTime]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_CheckUrl]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP FUNCTION [dbo].[fn_CheckUrl]
GO
/****** Object:  UserDefinedTableType [dbo].[userTable]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP TYPE [dbo].[userTable]
GO
/****** Object:  UserDefinedTableType [dbo].[UserInformation_ID]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP TYPE [dbo].[UserInformation_ID]
GO
/****** Object:  UserDefinedTableType [dbo].[Login_2]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP TYPE [dbo].[Login_2]
GO
/****** Object:  UserDefinedTableType [dbo].[ftMVC_Users_type2]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP TYPE [dbo].[ftMVC_Users_type2]
GO
/****** Object:  UserDefinedTableType [dbo].[ftMVC_Users_type]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP TYPE [dbo].[ftMVC_Users_type]
GO
/****** Object:  UserDefinedTableType [dbo].[capability]    Script Date: 10/16/2023 8:31:52 PM ******/
DROP TYPE [dbo].[capability]
GO
/****** Object:  UserDefinedTableType [dbo].[capability]    Script Date: 10/16/2023 8:31:52 PM ******/
CREATE TYPE [dbo].[capability] AS TABLE(
	[Capability] [nvarchar](max) NULL,
	[type] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ftMVC_Users_type]    Script Date: 10/16/2023 8:31:52 PM ******/
CREATE TYPE [dbo].[ftMVC_Users_type] AS TABLE(
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Family] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[PasswordNew] [binary](64) NULL,
	[PasswordSult] [nvarchar](36) NULL,
	[Phone] [nvarchar](50) NULL,
	[UUID] [nchar](50) NULL,
	[Active] [bit] NULL,
	[ftMVC_EducationsID] [int] NULL,
	[Phone_OK] [bit] NULL,
	[Email_OK] [bit] NULL,
	[Picture] [nvarchar](500) NULL,
	[Email] [nvarchar](50) NULL,
	[F_M] [bit] NULL,
	[googleAccount] [nvarchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ftMVC_Users_type2]    Script Date: 10/16/2023 8:31:52 PM ******/
CREATE TYPE [dbo].[ftMVC_Users_type2] AS TABLE(
	[ID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Family] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[PasswordNew] [binary](64) NULL,
	[PasswordSult] [nvarchar](36) NULL,
	[Picture] [nvarchar](500) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [char](20) NULL,
	[F_M] [bit] NULL,
	[Website] [nvarchar](50) NULL,
	[ftMVC_EducationID] [int] NULL,
	[InstagramID] [nvarchar](20) NULL,
	[State] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Biography] [ntext] NULL,
	[googleAccount] [nchar](20) NULL,
	[Active] [bit] NULL,
	[UUID] [nchar](50) NULL,
	[Question] [nvarchar](250) NULL,
	[Answer] [nvarchar](250) NULL,
	[Phone_OK] [bit] NULL,
	[Email_OK] [bit] NULL,
	[Code] [char](8) NULL,
	[hasChannel] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[Login_2]    Script Date: 10/16/2023 8:31:52 PM ******/
CREATE TYPE [dbo].[Login_2] AS TABLE(
	[UserID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Family] [nvarchar](50) NULL,
	[ShowName] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Picture] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[F_M] [nvarchar](50) NULL,
	[Website] [nvarchar](50) NULL,
	[ftMVC_EducationsID] [int] NULL,
	[InstagramID] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Biography] [nvarchar](50) NULL,
	[googleAccount] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[UUID] [nchar](50) NULL,
	[Question] [nvarchar](50) NULL,
	[Answer] [nvarchar](50) NULL,
	[LastPostVisited] [int] NULL,
	[CommentCount] [int] NULL,
	[LikeCount] [int] NULL,
	[DislikeCount] [int] NULL,
	[PostCount] [int] NULL,
	[SaveCount] [int] NULL,
	[ShareCount] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UserInformation_ID]    Script Date: 10/16/2023 8:31:52 PM ******/
CREATE TYPE [dbo].[UserInformation_ID] AS TABLE(
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Family] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](200) NULL,
	[PasswordNew] [nvarchar](200) NULL,
	[PasswordSult] [nvarchar](200) NULL,
	[Picture] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[F_M] [nvarchar](50) NULL,
	[Website] [nvarchar](50) NULL,
	[ftMVC_EducationsID] [int] NULL,
	[InstagramID] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Biography] [nvarchar](50) NULL,
	[googleAccount] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[UUID] [nchar](50) NULL,
	[Question] [nvarchar](50) NULL,
	[Answer] [nvarchar](50) NULL,
	[Phone_OK] [bit] NULL,
	[Email_OK] [bit] NULL,
	[Code] [nvarchar](50) NULL,
	[HasChannel] [bit] NULL,
	[CommentCount] [int] NULL,
	[LikeCount] [int] NULL,
	[DislikeCount] [int] NULL,
	[PostCount] [int] NULL,
	[SaveCount] [int] NULL,
	[ShareCount] [int] NULL,
	[BookmarkCount] [int] NULL,
	[MessageCount] [int] NULL,
	[Result] [nvarchar](50) NULL,
	[Message] [nvarchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[userTable]    Script Date: 10/16/2023 8:31:52 PM ******/
CREATE TYPE [dbo].[userTable] AS TABLE(
	[Id] [bigint] NULL,
	[Guid] [nvarchar](36) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[fn_CheckUrl]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_CheckUrl]
(
    @url nvarchar(max)
)
RETURNS nvarchar(max)
as
begin
    return @url+'_1'
end

--select dbo.fn_CheckUrl('ab',1)


GO
/****** Object:  StoredProcedure [dbo].[ftsMVC_ListEventINTime]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ftsMVC_ListEventINTime]
	
AS
BEGIN
	SET NOCOUNT ON;

	
    -- Insert statements for procedure here
	 --SELECT        *
	 --FROM            ftMVC_ContentsEvent
	 --where convert(nvarchar(10), DATEADD(day,CONVERT(INT , (SELECT Value as AddDay from ftMVC_Settings 
	 --				where name = 'Month' + CONVERT(varchar(2), MONTH(GETDATE()) , 2) )), getdate()) , 131) =
	 --				right('00' + CONVERT(varchar(2), Date_Day) ,2) + '/' + right('00' + CONVERT(varchar(2),Date_Month)  , 2) + '/' + right(convert(nvarchar(10), getdate(), 131),4)
	 

		SELECT        ftMVC_Contents.ID, ftMVC_Contents.titleMin, ftMVC_Contents.titleMax, ftMVC_Contents.URLAddress, ftMVC_Headlines.URLAddress AS HeadlinesURLAddress, 2 AS [order]
		FROM            ftMVC_Contents INNER JOIN
									 (SELECT        ID, ftMVC_ContentsID, ftMVC_UsersID, Date_Month, Date_Day
										FROM            ftMVC_ContentsEvent
										WHERE        (CONVERT(nvarchar(10), DATEADD(day, CONVERT(INT,
																	 (SELECT        Value AS AddDay
																		FROM            ftMVC_Settings
																		WHERE        (Name = 'Month' + CONVERT(varchar(2), MONTH(GETDATE()), 2)))), GETDATE()), 131) = RIGHT('00' + CONVERT(varchar(2), Date_Day), 2) + '/' + RIGHT('00' + CONVERT(varchar(2), Date_Month), 2) 
																 + '/' + RIGHT(CONVERT(nvarchar(10), GETDATE(), 131), 4))) AS Q11 ON ftMVC_Contents.ID = Q11.ftMVC_ContentsID INNER JOIN
								 ftMVC_Headlines ON ftMVC_Contents.ftMVC_HeadlinesID = ftMVC_Headlines.ID
		WHERE        (ftMVC_Contents.ShowOrNoShow = 1) AND (ftMVC_Contents.Archive = 0)



END

GO
/****** Object:  StoredProcedure [dbo].[proc_deleteContent]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_deleteContent]
  @ftGRAM_ContentsID int
AS
BEGIN

	DELETE FROM   ftGRAM_ContentsBookmarks where ftGRAM_ContentsID = @ftGRAM_ContentsID
	
	DELETE FROM   ftGRAM_ContentsCategories where ftGRAM_ContentsID = @ftGRAM_ContentsID

	DELETE FROM   ftGRAM_ContentsFiles where ftGRAM_ContentsID = @ftGRAM_ContentsID

	DELETE FROM   ftGRAM_ContentsHashtags where ftGRAM_ContentsID = @ftGRAM_ContentsID

	DELETE FROM   ftGRAM_ContentsLikes where ftGRAM_ContentsID = @ftGRAM_ContentsID

	DELETE FROM   ftGRAM_ContentsShareLOG where ftGRAM_ContentsID = @ftGRAM_ContentsID

	DELETE FROM   ftGRAM_ContentsStars where ftGRAM_ContentsID = @ftGRAM_ContentsID

	DELETE FROM   ftGRAM_ContentsVisitLOG where ftGRAM_ContentsID = @ftGRAM_ContentsID

	DELETE FROM   ftGRAM_Contents where id = @ftGRAM_ContentsID

END
GO
/****** Object:  StoredProcedure [dbo].[sp_aaaaaaaaa]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_aaaaaaaaa]
@searchValue nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;

SELECT DISTINCT
       o.name AS Object_Name,
       o.type_desc
  FROM sys.sql_modules m
       INNER JOIN
       sys.objects o
         ON m.object_id = o.object_id
 WHERE m.definition Like '%'+@searchValue+'%';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_checkAndGenerateUrl]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_checkAndGenerateUrl]
	@url nvarchar(max),
	@id int = null,
	@newUrl nvarchar(max) output
AS
BEGIN
	SET NOCOUNT ON;

	-- check and generate new UrlAddress wich is needed in ftgram_content table
	declare @pUrl nvarchar(50),@pid int
	if @id is null
	declare cursor_url cursor for select id,url from ftGRAM_Contents where url like @url+'%'
	else
	declare cursor_url cursor for select id,url from ftGRAM_Contents where url like @url+'%' and Id!=@id

	open cursor_url
	fetch next from cursor_url into @pid,@pUrl
	while @@FETCH_STATUS=0
	begin
		set @url= @pUrl+'_1'
		fetch next from cursor_url into @pid,@pUrl
	end
	close cursor_url
	deallocate cursor_url

	-- generate new url
	set @newUrl=@url

	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_checkAnswer]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_checkAnswer]
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
/****** Object:  StoredProcedure [dbo].[sp_contentCommentAdd]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 2023/09/05
-- Description:	to insert ContentCommentAdd into ftGRAM_CommentsReports table
-- =============================================
CREATE PROCEDURE [dbo].[sp_contentCommentAdd]
	@UserID int, 
	@CommentsID int,
	@IP nvarchar(15),
	@Browser nvarchar(max),
	@OS nvarchar(max),
	@UUID nvarchar(max),
	@Message nvarchar(max),
	@IsSucceed bit=0 output
        
AS
BEGIN
	SET NOCOUNT ON;
	insert into ftGRAM_CommentsReports 
	(ftMVC_UsersID,ftGRAM_CommentsID,Date_Create,IP,Browser,OS,UUID,Message)
	values
	(@UserID,@CommentsID,GETDATE(),@IP,@Browser,@OS,@UUID,@Message)
	
	if @@ROWCOUNT = 1 set @IsSucceed = 1

END
GO
/****** Object:  StoredProcedure [dbo].[sp_createPost]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_createPost]
@title nvarchar(max),
@text nvarchar(max),
@userid int,
@url nvarchar(max),
@saved bit = null,
@fileName nvarchar(100),
@fileType  nvarchar(100),

@openGraphUrlAsFileName nvarchar(max)=null,
@openGraphTitle nvarchar(max)=null,
@id int null,
@categories  nvarchar(100),
@result nvarchar(max) out
AS
BEGIN
	SET NOCOUNT ON;
	
	-- check and generate new UrlAddress wich is needed in ftgram_content table
	declare 
		@newurl nvarchar(50),
		@ftGram_Contents_ID int,
		@urlAddress nvarchar(500)
	-- 3821 :
	 exec sp_createURLAddress @title=@title,@modifiedTitle=@urlAddress output

	if @saved is null
		set @saved=1

	--data insert into table
	insert into ftGRAM_Contents 
	(Text,Date_Create,ftMVC_UsersID,ftMVC_LanguagesID,Title,Active,URL,URLAddress,Saved)
	values (@text,GETDATE(),@userid,1,@title,0,@url,@newUrl,@saved)
	select @ftGram_Contents_ID=@@IDENTITY
	
	-- insert new hashtags into ftGRAM_Hashtags or read existed hashtags
	if len(@text)>1
		exec sp_InsertHashTags @text,@ftGram_Contents_ID

	-- insert new titles into ftGRAM_Hashtags or read existed titles
	if len(@title)>1
		exec sp_InsertHashTags @title,@ftGram_Contents_ID
	
	-- insert categories list wich is generated from spliting @categories by ','
	exec sp_insertCategories @ftGram_Contents_ID,@categories

	-- 3948 :
	if @url is not null or len(@url)>0
		begin
			-- insert generated filename by OpenGraph in ftGRAM_ContentsFiles table
			if @openGraphUrlAsFileName is not null
				exec sp_insertftGRAM_ContentsFiles @openGraphUrlAsFileName,1

			if @title is null or LEN(@title)=0
			begin
				if @openGraphTitle is null or LEN(@openGraphTitle)=0
					set @title =''
				else
					set @title = @openGraphTitle
				exec sp_createURLAddress @title =@title , @modifiedTitle=@urlAddress output
			end
		end
	-- 3980:

		

END


GO
/****** Object:  StoredProcedure [dbo].[sp_createURLAddress]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_createURLAddress]
@title nvarchar(max),
@modifiedTitle nvarchar(max) output
AS
BEGIN
	SET NOCOUNT ON;

		set @title = Replace(@title,'!', ' ')
		set @title = Replace(@title,'.', ' ')
		set @title = Replace(@title,',', ' ')
		set @title = Replace(@title,':', ' ')
		set @title = Replace(@title,'?', ' ')
		set @title = Replace(@title,'؟', ' ')
		set @title = Replace(@title,'،', ' ')
		set @title = Replace(@title,'؛', ' ')
		set @title = Replace(@title,'+', ' ')
		set @title = Replace(@title,'–', ' ')
		set @title = Replace(@title,'«', ' ')
		set @title = Replace(@title,'»', ' ')
		set @title = Replace(@title,'(', ' ')
		set @title = Replace(@title,')', ' ')
		set @title = Replace(@title,'/', ' ')
		set @title = Replace(@title,N' ع ',  ' ')
		set @title = Replace(@title,N' ص ',  ' ')
		set @title = Replace(@title,N' س ',  ' ')
		set @title = Replace(@title,N' ره ', ' ')
		set @title = Replace(@title,N' عج ', ' ')
		set @title = Replace(@title,N'\\', '')
		set @title = Replace(@title,N'\"', '')
		set @title = Replace(@title,'"', ' ')
		set @title = Replace(@title,'_', ' ')
		set @title = Replace(@title,'-', ' ')
		set @title = Replace(@title,'  ', ' ')
		set @title = Replace(@title,'''', ' ')
		set @title = Replace(@title,'#', ' ')
		set @title = Trim(@title)
		set @title = Replace(@title,' ', '-')
		set @title = Replace(@title,'--', '-')
		

		exec sp_checkAndGenerateUrl @url=@title,@newUrl=@title output
		set @modifiedTitle = @title

END
GO
/****** Object:  StoredProcedure [dbo].[sp_dislikePost]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_dislikePost]
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
/****** Object:  StoredProcedure [dbo].[sp_getAccess]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 2023/09/05
-- Description:	to insert ContentCommentAdd into ftGRAM_CommentsReports table
-- =============================================
CREATE PROCEDURE [dbo].[sp_getAccess]   
	@UserId int

AS
BEGIN
	SET NOCOUNT ON;

		select x.Capability,
		case 
			when y.Capability is null then 0
			else 1
		end
		from
		(select Capability,0 as type from dbo.ftMVC_Access where ParentID>0) x
		left join
		(select c.Capability Capability , 1 as type
			from dbo.ftMVC_UserAccess cu
			join dbo.ftMVC_Access c on c.ID = cu.ftMVC_AccessID 
			where  cu.ftMVC_UsersID = @UserId
			union
			select c.Capability Capability , 1 as type
			from dbo.ftMVC_GroupsAccess cg
			join dbo.ftMVC_Groups wg on wg.ID=cg.ftMVC_GroupsID
			join dbo.ftMVC_UsersGroups ug on wg.ID=ug.ftMVC_GroupsID
			join dbo.ftMVC_Access c on cg.ftMVC_AccessID=c.ID
			where  ug.ftMVC_UsersID = @UserId) y on x.Capability=y.Capability



END







GO
/****** Object:  StoredProcedure [dbo].[sp_getLogin]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_getLogin]
	@UserName nvarchar(50)=null,
	@Phone nvarchar(50)=null,
	@Email nvarchar(50)=null,
	@UserId int=null,
	@GoogleAccount nvarchar(50)=null
AS
BEGIN
	SET NOCOUNT ON;
	if @UserId is null
		set @UserId = 0;

	if(@Username is not null)
		begin
		select @UserId=id from ftMVC_Users where TRIM(Upper(UserName)) like TRIM(Upper(@UserName)) and Active=1
		end
	else if(@Phone is not null)
		begin
		select @UserId=id from ftMVC_Users where TRIM(Upper(Phone)) like TRIM(Upper(@Phone)) and Active=1
		end
	else if(@Email is not null)
		begin
		select @UserId=id from ftMVC_Users where TRIM(Upper(Email)) like TRIM(Upper(@Email)) and Active=1
		end
	else if(@GoogleAccount is not null)
		begin
		select @UserId=id from ftMVC_Users where TRIM(Upper(GoogleAccount)) like TRIM(Upper(@GoogleAccount))
		end
	
	if(@UserId>0)
		begin
		exec sp_GetLoginByUserId @userId
		end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetLoginByUserId]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  StoredProcedure [dbo].[sp_GetLoginOrRegisterBygoogleAccount]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  StoredProcedure [dbo].[sp_getQuestionByUsername]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getQuestionByUsername]
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
/****** Object:  StoredProcedure [dbo].[sp_getUserId]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
create PROCEDURE [dbo].[sp_getUserId]
	@UUID nvarchar(50)=null,
	@UserId int output,
    @getUsersResponseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	set @UUID=trim(@UUID)
	select * from ftMVC_Users where UUID like '%'+@UUID+'%'
	select @UserId=id from ftMVC_Users where UUID like '%'+@UUID+'%'
	--select @UserId
	if (@UserId is null)
		set @getUsersResponseMessage = 'not found any user' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserInformationByID]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  StoredProcedure [dbo].[sp_getUsers_byUsername]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_getUsers_byUsername]
	@Username nvarchar(50)=null,
    @getUsersResponseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	set @Username=trim(@Username)

	select * from ftMVC_Users where UPPER(Username) like UPPER(@Username)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetVersion]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 2023/09/05
-- Description:	to insert ContentCommentAdd into ftGRAM_CommentsReports table
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetVersion]        
AS
BEGIN
	SET NOCOUNT ON;
	select top 1 * from ftGRAM_Version order by Date_Create desc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GRAM_chkURLAddress]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GRAM_chkURLAddress]
	@url nvarchar(max),
	@id int,
	@response nvarchar(max) out
AS
BEGIN
	SET NOCOUNT ON;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_info]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_info]
	@UserString nvarchar(50),
	@Password nvarchar(50),
	@type int,
    @getUsersResponseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	declare @userId int;
	print cast(@type as nvarchar)
	if @type=1
		begin
			set @userId=(select id from ftMVC_Users where UserName like @UserString and Password like @Password)
			print 'a'
		end
	if @type=2
		begin
			set @userId=(select id from ftMVC_Users where Email like @UserString and Password like @Password)
			print 'b'
		end
	if @type=3
		begin
			set @userId=(select id from ftMVC_Users where Phone like @UserString and Password like @Password)
			print 'c'
		end
		
		select @userId
	if (@userId is null)
		set @getUsersResponseMessage = 'not found any user' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertCategories]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insertCategories]
	@ftGram_Contents_ID int,
	@categories as nvarchar(200)
AS
BEGIN
	SET NOCOUNT ON;

	insert into ftGRAM_ContentsCategories (ftGRAM_ContentsID,ftMVC_CategoriesID)
	select @ftGram_Contents_ID,value from  string_split(@categories,',')
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertftGRAM_ContentsFiles]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insertftGRAM_ContentsFiles]
	@filename nvarchar(50),
	@type int,
	@ftGram_Contents_ID int
AS
BEGIN
	SET NOCOUNT ON;

	insert into ftGRAM_ContentsFiles (ftGRAM_ContentsID,FileName,Type) 
	values (@ftGram_Contents_ID,@filename,@type)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertHashTags]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insertHashTags]
	@text nvarchar(max),
	@ftGram_Contents_ID int
AS
BEGIN
	SET NOCOUNT ON;
		declare @hashtags as table (ftGRAM_ContentsID int,ftGRAM_HashtagsID int)
		declare @hashtagList as table([hash] nvarchar(max))
		declare @arg0 nvarchar(50)

		insert into @hashtagList 
		SELECT  tbl.vls from(SELECT ROW_NUMBER() OVER (ORDER BY	value) rownmbr , value AS vls FROM string_split(@text,'#')) tbl WHERE tbl.rownmbr>1

		declare _cursor cursor for select * from @hashtagList
		declare @hashtag nvarchar(max)
		open _cursor
		fetch next from _cursor into @hashtag
		while @@FETCH_STATUS=0
		begin
		select top 1 @arg0=value from string_split(@hashtag,' ')
			if len(@arg0)>1 and @arg0 is not null
			begin
				if not exists (select * from ftGRAM_Hashtags where TRIM(@arg0) = TRIM(Text))
				begin
					insert into ftGRAM_Hashtags 
					output @ftGram_Contents_ID,inserted.ID into @hashtags 
					values (@arg0)
				end
				ELSE
				BEGIN
					insert into @hashtags
					select @ftGram_Contents_ID,id from ftGRAM_Hashtags where TRIM(@arg0) = TRIM(Text)
				END
			end

			fetch next from _cursor into @hashtag
		end
		close _cursor
		deallocate _cursor
		insert into ftGRAM_ContentsHashtags select * from @hashtags
END
GO
/****** Object:  StoredProcedure [dbo].[sp_likePost]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  StoredProcedure [dbo].[sp_NewLogin]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_NewLogin]
	@UserName nvarchar(50)=null,
	@Email nvarchar(50)=null,
	@Phone nvarchar(50)=null,

	@Message nvarchar(50) = null output,
	@Result int = null output,
	@OTP int = null output
AS
BEGIN
	SET NOCOUNT ON;
	-- تعریف تیبل تایپ برای رکورد یوزر
	declare @ftmvc_user as ftMVC_Users_type,
			@userid int = null

	------------------------------------------------------------- جستجو با یوزرنیم ------------------------------------------------------------
	if @Username is not null  
		begin
			insert into @ftmvc_user
			select ID,Name,Family,UserName,[Password],PasswordNew,PasswordSult,Phone,UUID,Active,ftMVC_EducationsID,Phone_OK,Email_OK,Picture,Email,F_M,googleAccount
				from ftMVC_Users where TRIM(UPPER(UserName)) like TRIM(UPPER(@UserName)) and Active=1
			if @@ROWCOUNT >0
				begin
				set @Message = N'ورود با نام کاربری';
				set @Result = N'1';
				return
				end
			else
				begin
				set @Message = N'ثبت نام با نام کاربری';
				set @Result = N'4';
				return
				end
		end

	------------------------------------------------------------- جستجو با شماره موبایل ------------------------------------------------------------
	if @Phone is not null  
		begin

			--پیدا کردن حساب فعال از طریق شماره موبایل 
			insert into @ftmvc_user
			select ID,Name,Family,UserName,[Password],PasswordNew,PasswordSult,Phone,UUID,Active,ftMVC_EducationsID,Phone_OK,Email_OK,Picture,Email,F_M,googleAccount
				from ftMVC_Users where TRIM(UPPER(Phone)) like TRIM(UPPER(@Phone)) and Active=1 
			if @@ROWCOUNT >0  -- اگر رکوردی یافت شد
			begin 
				--1) پیدا کردن موبایل فعال بدون کلمه عبور پس با کد یکبار مصرف
				set @userid = (select id from @ftmvc_user where Phone_OK =1 and [Password] is null)
				if @userid is not null  
					begin
					exec sp_OTP_Generate @Phone,null,@OTP output
					set @Message = N'ورود با کد یکبار مصرف موبایل';
					set @Result = N'7'
					return
					end
			
				--2)پیدا کردن موبایل فعال به هراه کلمه عبور پس با کلمه عبور
				set @userid = (select ID from @ftmvc_user where Phone_OK =1 and [Password] is not null)
				if @userid is not null  
					begin
					set @Message = N'ورود موبایل';
					set @Result = N'2'
					return
					end
			
				--3) پیدا کردن موبایل غیرفعال پس با کد یکبار مصرف
				set @userid = (select ID from @ftmvc_user where Phone_OK != 1) 
				if @userid is not null 
					begin
					exec sp_OTP_Generate @Phone,null,@OTP output
					set @Message = N'ورود با کد یکبار مصرف موبایل';
					set @Result = N'7'
					return
					end
			end
			-- عدم پیدا کردن حساب فعال از طریق شماره موبایل
			else 
				begin
				exec sp_OTP_Generate @Phone,null,@OTP output
				set @Message = N'ورود با کد یکبار مصرف موبایل';
				set @Result = N'5'
				return
				end
		end
	------------------------------------------------------------- جستجو باایمیل ------------------------------------------------------------
	if @Email is not null
		begin
			-- پیدا کردن حساب از بوسیله ایمیل ارسالی
			insert into @ftmvc_user
			select ID,Name,Family,UserName,[Password],PasswordNew,PasswordSult,Phone,UUID,Active,ftMVC_EducationsID,Phone_OK,Email_OK,Picture,Email,F_M,googleAccount
				from ftMVC_Users where TRIM(UPPER(Email)) like TRIM(UPPER(@Email)) and Active=1
			if @@ROWCOUNT >0  -- اگر رکوردی یافت شد
				begin 
					--1)   ایمیل این رکورد پیدا شده فعال هست بدون پسورد
					set @userid = (select ID from @ftmvc_user where Email_OK= 1 and [Password] is null)
					if @userid is not null
						begin
						exec sp_OTP_Generate null,@Email,@OTP output
						set @Message = N'ورود با کد یکبار مصرف ایمیل';
						set @Result = N'8'
						return
						end
					
					--2)   ایمیل این رکورد پیدا شده فعال هست به همراه پسورد
					set @userid = (select ID from @ftmvc_user where Email_OK= 1 and [Password] is not null)
					if @userid is not null
						begin
						exec sp_OTP_Generate null,@Email,@OTP output
						set @Message = N'ورود با ایمیل';
						set @Result = N'3'
						return
						end
					--3) ایمیل این رکورد پیدا شده اصلا فعال نیست
					set @userid = (select ID from @ftmvc_user where Email_OK!= 1)
					if @userid is not null
						begin
						exec sp_OTP_Generate null,@Email,@OTP output
						set @Message = N'ورود با کد یکبار مصرف ایمیل';
						set @Result = N'8'
						return
						end
				end
			else  -- عدم پیدا کردن حساب فعال از طریق ایمیل
				begin
				exec sp_OTP_Generate null,@Email,@OTP output
				set @Message = N'ثبت نام با ایمیل';
				set @Result = N'6'
				return
				end
		end
END




GO
/****** Object:  StoredProcedure [dbo].[sp_OTP_Burn]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_OTP_Burn]
	@Phone nvarchar(50)=null,
	@Email nvarchar(50)=null,
	@Code int,
	@IsValidOTP int output
AS
BEGIN
	SET NOCOUNT ON;
	--declare @tbl_temp table(Code int)

	delete from ftMVC_DisposableTemp where (Trim(Phone) like Trim(@Phone) and Date_Create>DATEADD(MINUTE,-3,GETDATE()) and @Code=Code) 
		or (Trim(Email) like Trim(@Email) and Date_Create>DATEADD(MINUTE,-3,GETDATE()) and @Code=Code)
	if @@ROWCOUNT>0
		begin
		set @IsValidOTP=1
		return
		end
	else
		begin
		set @IsValidOTP=0
		return
		end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_OTP_Burn2]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_OTP_Burn2]
	@Phone nvarchar(50)=null,
	@Email nvarchar(50)=null,
	@Code int,
	@IsValidOTP int output,
	@ResponseMessage nvarchar(200) output
AS
BEGIN
	SET NOCOUNT ON;
	declare @OtpId int,
			@UserId int
	declare @UserInformation_ID as dbo.UserInformation_ID


	select @OtpId=ID ,@UserId=ftMVC_UsersID from ftMVC_Disposable where (Trim(Phone) like Trim(@Phone) 
											and Date_Create>DATEADD(DAY,-3,GETDATE()) 
											and @Code=Code 
											and Used=0
											and Active=1) 
	if @OtpId>0
		begin
		update ftMVC_Disposable set Active=0,Used=1 where ID=@OtpId
		set @IsValidOTP=1
		set @ResponseMessage = N'عملیات با موفقیت انجام شد';
		insert into @UserInformation_ID
		exec sp_GetUserInformationByID @userId
		select * from @UserInformation_ID
		return
		end
	else
		begin
		set @IsValidOTP=0
		set @ResponseMessage =N'مقادیر وارد شده معتبر نمی باشد';
		return
		end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_OTP_Generate]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
/****** Object:  StoredProcedure [dbo].[sp_OTP_Generate_ByPhoneCheck]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_OTP_Generate_ByPhoneCheck]
	@Phone nvarchar(50)=null,
	@Code int output,
	@ResponseMessage nvarchar(50) output
AS
BEGIN
	SET NOCOUNT ON;
	declare @tbl_temp table(Code int)

	select * from ftMVC_Users where Trim(Phone) like Trim(@Phone) and Active=1
	if @@ROWCOUNT >0
		begin
		exec sp_OTP_Generate @Phone,NUll,@Code = @Code output
		set @ResponseMessage = N'عملیات باموفقیت انجام شد'
		return
		end
	else 
		begin
		set @ResponseMessage = N'شماره موبایل نامعتبر است'
		set @Code = -1
		return
		end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_OTP_Generate_ByPhoneCheck2]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
CREATE PROCEDURE [dbo].[sp_OTP_Generate_ByPhoneCheck2]
	@Phone nvarchar(50)=null,
	@IP nvarchar(20) = null,
	@Browser nvarchar(50) = null,
	@OS nvarchar(50) = null,
	@UUID nvarchar(50) = null,
	@PhoneOrEmail bit = null,
	@Code int output,
	@UserId int output,
	@ResponseMessage nvarchar(50) output
AS
BEGIN
	SET NOCOUNT ON;
	declare @tbl_temp table(Code int)

	set @UserId= (select ID from ftMVC_Users where Trim(Phone) like Trim(@Phone) and Active=1)
	if @UserId >0
		begin
		select @Code=Code from ftMVC_Disposable where ftMVC_UsersID = @UserId and Date_Create>DATEADD(MINUTE,-3,GETDATE()) and Active=1 and Used=0
		if @Code>0
			begin
			set @ResponseMessage = N'عملیات باموفقیت انجام شد'
			return
			end
		else
			begin
			set @Code= floor(rand()*(1000000-100000)+100000);
			insert into ftMVC_Disposable (ftMVC_UsersID,Code,date_create ,Type,Active,Used,Phone,IP,Browser,OS,UUID)
			values (@UserId,@Code,GETDATE(),@PhoneOrEmail,1,0,@Phone,@IP,@Browser,@OS,@UUID)
			set @ResponseMessage = N'عملیات باموفقیت انجام شد'
			return
			end
		end
	else 
		begin
		set @ResponseMessage = N'شماره موبایل نامعتبر است'
		set @Code = -1
		return
		end

END



GO
/****** Object:  StoredProcedure [dbo].[sp_RegisterUser]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RegisterUser] 
	@Name nvarchar(50) null,
	@Family nvarchar(50) null,
	@UserName nvarchar(50) null,
	@Password nvarchar(50) null,
	@Picture nvarchar(500) null,
	@Email nvarchar(50) null,
	@Phone char(20) null,
	@F_M bit null,
	@Website nvarchar(50) null,
	@ftMVC_EducationID int null,
	@InstagramID nvarchar(20) null,
	@State nvarchar(50) null,
	@City nvarchar(50) null,
	@Biography ntext null,
	@googleAccount nchar(20) null,
	@Active bit null,
	@UUID nchar(50) null,
	@Question nvarchar(250) null,
	@Answer nvarchar(250) null,
	@Phone_OK bit null,
	@Email_OK bit null,
	@Code char(8) null,
	@hasChannel bit null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @_PasswordSult UNIQUEIDENTIFIER = newid();
	declare @_PasswordNew binary(64) =  HASHBYTES('SHA2_512', @Password + cast(@_PasswordSult as nvarchar(36)));
	declare @isInserted bit = 0

    -- Insert statements for procedure here
	insert into dbo.ftMVC_Users 
	output inserted.*
	values
	(@Name,@Family,@UserName,@Password,@_PasswordNew,@_PasswordSult,@Picture,@Email,@Phone,@F_M,@Website,@ftMVC_EducationID,@InstagramID,@State,
	@City,@Biography,@googleAccount,@Active,@UUID,@Question,@Answer,@Phone_OK,@Email_OK,@Code,@hasChannel)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_registerUsersGroups]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_registerUsersGroups]
@ftMVC_GroupsID int,
@ftMVC_UsersID int
AS
BEGIN
	SET NOCOUNT ON;
	insert into ftMVC_UsersGroups (ftMVC_GroupsID,ftMVC_UsersID) values(@ftMVC_GroupsID,@ftMVC_UsersID)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_resetPassword]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_resetPassword]
	@mobile nvarchar(20),
	@responseMessage nvarchar(50) output,
	@usersName nvarchar(50) output,
	@randomCode int output
AS
BEGIN
	SET NOCOUNT ON;
	declare @userid int,
			@passSult nvarchar(36),
			@PasswordNew binary(64)
	select @userid=ID,@usersName=Name+' '+Family,@passSult=PasswordSult from ftMVC_Users where TRIM(Phone) like TRIM(@mobile)
	if @@ROWCOUNT>0
		begin
		set @randomCode= floor(rand()*(1000000-100000)+100000);
		set @PasswordNew  =  HASHBYTES('SHA2_512', cast(@randomCode as nvarchar(6)) + cast(@passSult as nvarchar(36)));
		update ftMVC_Users set Password=@randomCode,PasswordNew=@PasswordNew where ID=@userid
		set @responseMessage =N'عملیات بازنشانی کلمه عبور با موفقیت انجام شد.'
		end
	else
		begin
		set @responseMessage =N'شماره موبایل نامعتبر میباشد.'
		end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_SignUP]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 1402/03/22
-- Description:	insert user details
-- =============================================

CREATE PROCEDURE [dbo].[sp_SignUP]
	@registerType int,
	@username nvarchar(50) = NULL,
	@password nvarchar(50) = NULL,
	@question nvarchar(50) = NULL,
	@answer nvarchar(50) = NULL,
	@code nvarchar(50) = NULL,
	@UUID nvarchar(50) = NULL,
    @responseMessage NVARCHAR(250) output

AS
	declare @UserId int,
			@Active bit
	declare @getUsersResponseMessage nvarchar(max);

begin
SET NOCOUNT ON

	if (@registerType=4)  -- register by username
		begin
		select @UserId=ID from ftMVC_Users where UserName=@username 
		if @@ROWCOUNT>0
			begin
			exec sp_GetLoginByUserId @UserId
			set @responseMessage =N'old user'
			return
			end
		else
			begin
			begin Transaction
			declare @tempTable ftmvc_users_type2
			insert into @tempTable
			-- ثبت نام کاربر در جدول کاربران
			exec sp_RegisterUser null,null,@username,@password,N'https://fetratgram.com/img/user.png',null,null,null,null,1,null,null,null,null,null,1,@UUID,@question,@answer,0,0,null,null
			select @UserId=ID from @tempTable
			-- ثبت گروه کاربری ۶ و ۷ برای کاربر
			exec sp_registerUsersGroups 6,@UserId
			exec sp_registerUsersGroups 7,@UserId
			set @responseMessage=N'new user is registered'
			exec sp_GetLoginByUserId @UserId
			commit
			return
			end
		end
	
	
	-- =========================================================================================================================================
	
	else if (@registerType=5)  --register by phone
		begin
		-- تست کد ارسالی
		declare @isvalid int
		exec sp_otp_burn @username,NULL,@code,@isValidOTP =@isvalid
		if @isvalid=1
			begin
			select @UserId=ID,@Active=Active from ftMVC_Users where Trim(Phone)=Trim(@username)
			if (@@ROWCOUNT>0 and @Active=1)
				begin
				update ftMVC_Users set Phone_OK=1 where ID=@UserId
				exec sp_GetLoginByUserId @UserId
				set @responseMessage =N'old user'
				return
				end
			else if(@@ROWCOUNT>0 and @Active=0)
				begin
				set @responseMessage =N'این کاربر قبلا توسط ادمین غیر فعال شده است'
				return
				end
			else 
				begin
				begin Transaction
				insert into @tempTable
				-- ثبت نام کاربر در جدول کاربران
				exec sp_RegisterUser null,null,@username,@password,N'https://fetratgram.com/img/user.png',null,null,null,null,1,null,null,null,null,null,1,@UUID,@question,@answer,0,0,null,null
				select @UserId=ID from @tempTable
				-- ثبت گروه کاربری ۶ و ۷ برای کاربر
				exec sp_registerUsersGroups 6,@UserId
				exec sp_registerUsersGroups 7,@UserId
				set @responseMessage=N'new user is registered'
				exec sp_GetLoginByUserId @UserId
				commit
				return
				end
			end
		else
			begin
			set @responseMessage = N'OTP is not vaid.'
			return
			end
		end

	-- =========================================================================================================================================
		
	else if (@registerType=6)  --register by phone
		begin
		-- تست کد ارسالی
		exec sp_otp_burn NULL,@username,@code,@isValidOTP =@isvalid
		if @isvalid=1
			begin
			select @UserId=ID from ftMVC_Users where Trim(Email)=Trim(@username)
			if (@@ROWCOUNT>0 and @Active=1)
				begin
				update ftMVC_Users set Email_OK=1 where ID=@UserId
				exec sp_GetLoginByUserId @UserId
				set @responseMessage =N'old user'
				return
				end
			else if(@@ROWCOUNT>0 and @Active=0)
				begin
				set @responseMessage = N'این کاربر قبلا توسط ادمین غیر فعال شده است'
				return
				end
			else
				begin
				begin Transaction
				insert into @tempTable
				-- ثبت نام کاربر در جدول کاربران
				exec sp_RegisterUser null,null,@username,@password,N'https://fetratgram.com/img/user.png',null,null,null,null,1,null,null,null,null,null,1,@UUID,@question,@answer,0,0,null,null
				select @UserId=ID from @tempTable
				-- ثبت گروه کاربری ۶ و ۷ برای کاربر
				exec sp_registerUsersGroups 6,@UserId
				exec sp_registerUsersGroups 7,@UserId
				set @responseMessage=N'new user is registered'
				exec sp_GetLoginByUserId @UserId
				commit
				return
				end
			end
		else
			begin
			set @responseMessage = N'OTP is not vaid.'
			return
			end
		end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_SignUPguest]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  StoredProcedure [dbo].[sp_verifyOTP]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  StoredProcedure [dbo].[z_sp_ChangePassword]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 14020331
-- Description:	update user
-- =============================================
create     PROCEDURE [dbo].[z_sp_ChangePassword] 
	@userId int,
	@oldPassword varchar(200),
	@newPassword varchar(200),
	@responseMessage nvarchar(max) output,
	@retVal int output

AS
BEGIN
	-- check oldpass is correct or not
	declare @hashpass nvarchar(250)
	declare @salt NVARCHAR(36)
	select @salt = Guid from Users where Id = @userId

	select @hashpass = password from Users where Id = @userId and Password=HASHBYTES('SHA2_512', @oldPassword+CAST(@salt AS NVARCHAR(36)))
	if @hashpass = HASHBYTES('SHA2_512', @oldPassword+CAST(@salt AS NVARCHAR(36)))
		begin
			-- update password
			update dbo.Users set Password = HASHBYTES('SHA2_512', @newPassword + cast(@salt as nvarchar(36))) where id=@userId
			set @responseMessage= 'Password has been changed successfully!'
			set @retVal=1
		end
	else
		begin 
			set @responseMessage= 'Unfortunately password has not been changed!'
			set @retVal=-1
		end
END
GO
/****** Object:  StoredProcedure [dbo].[z_sp_getLogin]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 1402/03/24
-- Description:	used for login by username and password
-- =============================================
CREATE PROCEDURE [dbo].[z_sp_getLogin]
	@Email nvarchar(50),
	@Password nvarchar(50),
	@responseMessage nvarchar(50) out,
	@responseBoolean bit = 0 out
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @userid int;
	declare @userTable userTable
	insert into @userTable
	SELECT top 1 * from Users where Email = @Email

	--check email is existed or not
	if not exists (select top 1 * from @userTable where Email = @Email) 
	begin
		set @responseMessage=N'Email not found';
		set @responseBoolean = 0
		return 
	end

	--check email is verified or not
	if not exists (select top 1 * from @userTable where Email = @Email and  IsVerifiedEmail=1) 
	begin
		set @responseMessage=N'Email is not verified';
		set @responseBoolean = 0
		return 
	end

	--check email and password is corrected or not
	if not exists (SELECT top 1 * from @userTable where Email = @Email AND Password=HASHBYTES('SHA2_512', @Password + CAST (guid as nvarchar(150))) and IsVerifiedEmail=1)
		begin
			set @responseMessage=N'Email or Password is incorrect';
			set @responseBoolean = 0
			return 
		end

	select @userid = id from @userTable
	declare @isFirstLogin bit;
	if exists(select top 1 * from UserTokens where UserId=@userid) set @isFirstLogin=0 else set @isFirstLogin=1

	if exists(SELECT top 1 * from @userTable)
		begin
			begin Tran
				SET @responseBoolean=1  -- User successfully logged in
				select id,Username,Guid,Email,FirstName,LastName,MobileNumber from @userTable
			commit Tran
		end
	else 
		SET @responseBoolean=0
END
GO
/****** Object:  StoredProcedure [dbo].[z_sp_getLogout]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 1402/04/10
-- Description:	log out by refreshtoken
-- =============================================
CREATE PROCEDURE [dbo].[z_sp_getLogout]
	@RefreshToken nvarchar(50),
	@UserId	bigint,
	@responseMessage bit=0 out
AS
BEGIN
	SET NOCOUNT ON;	
	update UserTokens set IsValid=0  where UserId = @UserId AND RefreshToken=@RefreshToken
	if(@@ROWCOUNT>0) 
		SET @responseMessage= 1
	else
		SET @responseMessage= 0
END
GO
/****** Object:  StoredProcedure [dbo].[z_sp_getNewRefreshToken]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 1402/04/10
-- Description:	get new refreshtoken by userid and old refreshtoken
-- =============================================
CREATE PROCEDURE [dbo].[z_sp_getNewRefreshToken]
	@userId bigint,
	@RefreshTokenTimeout int,
	@OldRefreshToken nvarchar(50),
	@NewRefreshToken nvarchar(50),
	@responseMessage bit = 0 out,
	@returnedCreatedAt datetime out

AS
BEGIN
	SET NOCOUNT ON;

	declare @createdat datetime 
	select @createdat=createdat from UserTokens 
	set @createdat = DATEADD(mi, @RefreshTokenTimeout,@createdat )
	declare @expireTime datetime = getdate()																		
	declare @isNotExpired bit = 0																		
	set @isNotExpired= case when @createdat>@expireTime  then  1 else 0 end		
	if exists (select * from UserTokens where UserId = @userId and IsValid=1 and RefreshToken like @OldRefreshToken and @isNotExpired=1)
		begin
			begin tran
				set @returnedCreatedAt = GETDATE()
				print @NewRefreshToken
				update UserTokens set RefreshToken=@NewRefreshToken , IsValid=1 , CreatedAt=@returnedCreatedAt where UserId=@userId
				insert into LoginHistory (userId,logInDateTime) values(@userid,GETDATE())
				set @responseMessage=1

			commit tran
		end
	else
			set @responseMessage=0
END
GO
/****** Object:  StoredProcedure [dbo].[z_sp_getUsers]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	get user
-- =============================================
create PROCEDURE [dbo].[z_sp_getUsers]
	@Email nvarchar(50)=null,
	@Mobile nvarchar(50)=null,
	@Username nvarchar(50)=null,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	select top 1 * from ft_Users where Email = @Email or Mobile = @Mobile or UserName = @Username
	if @@ROWCOUNT =0 set @responseMessage = 'not found any user'

END
GO
/****** Object:  StoredProcedure [dbo].[z_sp_insertLoginHistoryAndUserTokens]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 1402/04/09
-- Description:	used for store refreshtoken and LoginHistory into database
-- =============================================
CREATE PROCEDURE [dbo].[z_sp_insertLoginHistoryAndUserTokens]
	@Accesstoken nvarchar(50),
	@RefreshToken nvarchar(50),
	@UserId bigint,
	@responseMessage nvarchar(50) out,
	@responseBoolean bit = 0 out
AS
BEGIN
	SET NOCOUNT ON;

	declare @isFirstLogin bit;
	if exists(select top 1 * from UserTokens where UserId=@UserId) set @isFirstLogin=0 else set @isFirstLogin=1
		begin
			begin Tran
				SET @responseMessage='operation completed'
				set @responseBoolean = 1
				if(@isFirstLogin=1)
					insert into UserTokens (UserId,RefreshToken,CreatedAt,IsValid) values(@userid,@RefreshToken,GETDATE(),1)
				else
					update UserTokens set RefreshToken=@RefreshToken , CreatedAt = GetDate(),IsValid=1 where UserId=@userid
				insert into LoginHistory (userId,logInDateTime) values(@userid,GETDATE())
			commit Tran
			return
		end
			SET @responseMessage='unfortunately operation faild'
			set @responseBoolean=0
END
GO
/****** Object:  StoredProcedure [dbo].[z_SP_RegisterUsers]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 1402/03/22
-- Description:	insert user details
-- =============================================

CREATE PROCEDURE [dbo].[z_SP_RegisterUsers]
	@UserName nvarchar(50) = NULL,
    @Password nvarchar(200) = NULL, 
	@Phone NVARCHAR(50) = NULL,
	@Email NVARCHAR(50) = NULL,
    @responseMessage NVARCHAR(250) OUTPUT,
	@returnToken int = 0 out
AS
	declare @PasswordSult UNIQUEIDENTIFIER = newid();
	declare @IsVerifiedEmail bit =0;
	declare @IsMobileValidated bit =0;
	declare @IsActive bit =0;
	declare @PasswordNew binary(64) =  HASHBYTES('SHA2_512', @Password + cast(@PasswordSult as nvarchar(36)));
begin
print ('==== [SP_AddUsers] =========')
	SET NOCOUNT ON
    BEGIN TRY
		begin tran
		INSERT INTO [dbo].ftMVC_Users
           ([UserName],[Email],[Phone],[PasswordNew],PasswordSult,Active,Email_OK,Phone_OK)
     VALUES
           (@UserName,@Email,@Phone,@PasswordNew,@PasswordSult,@IsActive,@IsVerifiedEmail,@IsMobileValidated)
        set @responseMessage = 'ok' 
		set @returnToken = CAST(RAND()*1000000 as int);
		declare @sendVerificationResponseMessage bit;
		if(@Email is not null)
			exec sp_SendVerificationEmail @Email , @returnToken ,@sendVerificationResponseMessage out			
		commit tran
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
		set @returnToken =0

		print @responseMessage
		print @returnToken
		rollback tran
    END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[z_sp_ResetPassword]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 14020408
-- Description:	to reset user's password
-- =============================================
CREATE PROCEDURE [dbo].[z_sp_ResetPassword] 
	@email nvarchar(100),
	@newPassword varchar(200),
	@token nvarchar (6),
	@responseMessage bit=0 output

AS
BEGIN
	declare @userId bigint = 0
	--check token
	select top 1 @userId = us.Id from Users us join EmailVerificationHistory ev on ev.Userid=us.Id 
	where us.Email=@Email and ev.Token=@Token and GETDATE()<ev.expireDateTime  and ev.IsBurned=0
	order by ev.Id desc 

	--update password
	declare @salt NVARCHAR(36)
	select @salt = Guid from Users where Email = @email
		begin
			-- update password
			begin tran
				update dbo.Users set Password = HASHBYTES('SHA2_512', @newPassword + cast(@salt as nvarchar(36))) where Email = @email and Id=@userId
				update EmailVerificationHistory set IsBurned=1 where Userid=@userId
				set @responseMessage= 1
			commit tran
		end
END
GO
/****** Object:  StoredProcedure [dbo].[z_sp_SendVerificationEmail]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: <Create Date,,>
-- Description:	insert verification record to EmailVerificationHistory
-- =============================================
CREATE PROCEDURE [dbo].[z_sp_SendVerificationEmail]
	@Email nvarchar(50)=null,
	@Token int,
    @responseMessage bit OUTPUT
AS
BEGIN
print '==== [sp_SendVerificationEmail] ======'
	SET NOCOUNT ON;
	declare @userTable userTable
	insert into @userTable
	select Id,Guid from ft_Users where Email like @Email
	if exists(select * from @userTable) 
		begin
			declare @userid bigint;
			select @userid = id from @userTable;
			select * from @userTable
			insert 
				into EmailVerificationHistory (Userid,token,isburned,datetime,expireDatetime) 
				values(@userid,@Token,0,GETDATE(),DATEADD( MINUTE,5,GETDATE()));
			set @responseMessage = 1;
		end
	else
		set @responseMessage = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[z_sp_updateUser]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 14020331
-- Description:	update user
-- =============================================
CREATE   PROCEDURE [dbo].[z_sp_updateUser] 
	@Email varchar(50),
	@MobileNumber varchar(50)=null,
	@FirstName nvarchar(50)=null,
	@LastName nvarchar(50)=null,
	@responseMessage nvarchar(max) output

AS
BEGIN
	declare @sqlCmd nvarchar(max)='update dbo.Users set '
	if @MobileNumber is not null begin set @sqlCmd = @sqlCmd+' MobileNumber = N'''+ @MobileNumber +''' , ' end
	if @FirstName is not null begin set @sqlCmd = @sqlCmd+ ' FirstName = N'''+ @FirstName +''' , ' end
	if @LastName is not null  begin set @sqlCmd =  @sqlCmd+' LastName = N'''+ @LastName +''' , ' end
	set @sqlCmd = Trim( ', ' from @sqlCmd);

	declare @userid bigint ;
	declare @userTable userTable;
	insert into @userTable
		SELECT top 1 id,Guid,Username,Email,FirstName,LastName,MobileNumber,IsActive,IsVerifiedEmail
		from Users 
		where Email = @Email

	 select top 1 @userid = Id  from @userTable
	 set @SqlCmd = @SqlCmd + ' output inserted.id where id='+cast( @userid as nvarchar)

	 if @userid >0 
	 begin
		exec SP_ExecuteSQL @SqlCmd
		set @responseMessage ='updated succesfully.'
		SELECT top 1 * from Users us where id = @userid
	 end
	 else  set @responseMessage = 'no record updated!'
END
GO
/****** Object:  StoredProcedure [dbo].[z_sp_VerifyEmail]    Script Date: 10/16/2023 8:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
