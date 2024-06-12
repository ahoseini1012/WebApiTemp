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

		-- split string by '#' 
		-- skip the first item splited.  I dont know why
		insert into @hashtagList 
		SELECT  tbl.vls from(SELECT ROW_NUMBER() OVER (ORDER BY	value) rownmbr , value AS vls FROM string_split(@text,'#')) tbl WHERE tbl.rownmbr>1

		-- split items which is gotten at preveus step ans split agian by space ' '
		declare _cursor cursor for select * from @hashtagList
		declare @hashtag nvarchar(max)
		open _cursor
		fetch next from _cursor into @hashtag
		while @@FETCH_STATUS=0
		begin
		select top 1 @arg0=value from string_split(@hashtag,' ')
			if @arg0<>'' and @arg0 is not null
			begin
				-- insert @arg0 as new hashtag item into ftGRAM_Hashtags
				if not exists (select * from ftGRAM_Hashtags where TRIM(@arg0) = TRIM(Text))
				begin
					insert into ftGRAM_Hashtags 
					output @ftGram_Contents_ID,inserted.ID into @hashtags 
					values (@arg0)
				end
				-- @arg0 is esxisted into ftGRAM_Hashtags so return hashtag's ID
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

