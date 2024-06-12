-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_createPost_file]
@text nvarchar(max),
@ftMVC_userid int,
@ftMVC_LanguagesID int,
@title nvarchar(max),
@active bit,
@url nvarchar(max),
@saved bit = null,
@fileName nvarchar(100),
@fileType  nvarchar(100),

@openGraphUrlAsFileName nvarchar(max)=null,
@openGraphTitle nvarchar(max)=null,
@categories  nvarchar(100),
@message nvarchar(100) out,
@result nvarchar(100) out
AS
BEGIN
	SET NOCOUNT ON;
	begin try
	begin transaction
		-- check and generate new UrlAddress wich is needed in ftgram_content table
		declare 
			@ftGram_Contents_ID int,
			@urlAddress nvarchar(500)

		if @saved is null
			set @saved=1

		-- 3948 (1):
		--  modify @title  if @title "is"  null or empty    and   url "is not" null or empty then change the ftgram_conetent title
		if (@url is not null and @url<>'') and (@title='' or @title is null)
		begin
			if @openGraphTitle is not null and @openGraphTitle<>''
				set @title = @openGraphTitle
			else
				set @title =''
		end

		-- 3821 :
		 exec sp_createURLAddress @title=@title,@modifiedTitle=@urlAddress output


		--data insert into ftGRAM_Contents table
		insert into ftGRAM_Contents 
		(Text,Date_Create,ftMVC_UsersID,ftMVC_LanguagesID,Title,Active,URL,URLAddress,Saved)
		values (@text,GETDATE(),@ftMVC_userid,@ftMVC_LanguagesID,@title,@active,@url,@urlAddress,@saved)
		select @ftGram_Contents_ID=@@IDENTITY
	
		-- insert new hashtags into ftGRAM_Hashtags or read existed hashtags
		if @text is not null and @text<>''
			exec sp_InsertHashTags @text,@ftGram_Contents_ID

		-- insert new titles into ftGRAM_Hashtags or read existed titles
		if @title is not null and @title<>''
			exec sp_InsertHashTags @title,@ftGram_Contents_ID
	
		-- insert categories list wich is generated from spliting @categories by ','
		if @categories is not null and @categories<>''
			exec sp_insertCategories @ftGram_Contents_ID,@categories

		-- 3948 (2):
		if @url is not null and @url<>''
			begin
				-- insert generated filename from url parsed by OpenGraph in ftGRAM_ContentsFiles table
				if @openGraphUrlAsFileName is not null and @openGraphUrlAsFileName <>''
					exec sp_insertftGRAM_ContentsFiles @filename=@openGraphUrlAsFileName ,@type=@fileType ,@ftGram_Contents_ID=@ftGram_Contents_ID
			end

		-- 3980:
		if @fileName is not null and @fileName <>''
		begin
		--درست کردن لیست از @FileType
			declare @fileType_Items as table(id int identity,filetype int)
			declare @fileType_Item nvarchar(50)
			insert into @fileType_Items
			select cast(value as int) from string_split(@fileType,',')

		-- درست کردن لیست از @FileName
			declare @fileName_Items as table(fileName nvarchar(50))
			declare @fileName_Item nvarchar(100)
			insert into @fileName_Items
			select value from string_split(@fileName,',')

		-- ایجاد کرزر جهت چک کردن همه موارد جدول
			declare filenameCursor Cursor for select  fileName from @fileName_Items
			open filenameCursor
			fetch next from filenameCursor into @fileName_Item
			declare @counter int = 1  -- ایجاد شمارنده جدول
			while @@FETCH_STATUS=0
			begin
				if @fileName_Item is not null and @fileName_Item <>''
				begin
					select @fileType_Item=filetype from @fileType_Items where id=@counter
					insert into ftGRAM_ContentsFiles (ftGRAM_ContentsID,FileName,Type) values (@ftGram_Contents_ID,@fileName_Item,@fileType_Item)
				end
				fetch next from filenameCursor
				set @counter = @counter+1
			end
		end
		set @result = cast(@ftGram_Contents_ID as nvarchar(20))
		set @message = N'عملیات با موفقیت انجام شد'
	commit
	end try
	begin catch
		set @result =N'0'
		set @message = N'خطا در انجام عملیات'
	end catch

END

GO

