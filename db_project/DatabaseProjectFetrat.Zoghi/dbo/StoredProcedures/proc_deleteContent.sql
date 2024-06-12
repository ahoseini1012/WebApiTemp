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

