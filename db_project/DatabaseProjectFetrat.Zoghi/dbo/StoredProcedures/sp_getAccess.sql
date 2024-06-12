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

