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
		

		exec sp_gram_chkURLAddress @url=@title,@newUrl=@title output
		set @modifiedTitle = @title

END

GO

