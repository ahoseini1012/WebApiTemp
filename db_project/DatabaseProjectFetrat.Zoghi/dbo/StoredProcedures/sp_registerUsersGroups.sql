-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE sp_registerUsersGroups
@ftMVC_GroupsID int,
@ftMVC_UsersID int
AS
BEGIN
	SET NOCOUNT ON;
	insert into ftMVC_UsersGroups (ftMVC_GroupsID,ftMVC_UsersID) values(@ftMVC_GroupsID,@ftMVC_UsersID)
END

GO

