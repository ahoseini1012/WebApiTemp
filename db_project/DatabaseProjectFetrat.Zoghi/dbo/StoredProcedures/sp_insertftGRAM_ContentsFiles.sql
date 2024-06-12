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

