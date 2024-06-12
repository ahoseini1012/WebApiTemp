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

