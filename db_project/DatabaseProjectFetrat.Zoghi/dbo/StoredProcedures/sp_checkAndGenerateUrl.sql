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

