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
	select @ftGram_Contents_ID, cast(value as int)from string_split(@categories,',')
END

GO

