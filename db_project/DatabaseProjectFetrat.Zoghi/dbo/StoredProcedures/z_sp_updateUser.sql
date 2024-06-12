-- =============================================
-- Author:		a.hoseini1012@gmail.com
-- Create date: 14020331
-- Description:	update user
-- =============================================
CREATE   PROCEDURE [dbo].[z_sp_updateUser] 
	@Email varchar(50),
	@MobileNumber varchar(50)=null,
	@FirstName nvarchar(50)=null,
	@LastName nvarchar(50)=null,
	@responseMessage nvarchar(max) output

AS
BEGIN
	declare @sqlCmd nvarchar(max)='update dbo.Users set '
	if @MobileNumber is not null begin set @sqlCmd = @sqlCmd+' MobileNumber = N'''+ @MobileNumber +''' , ' end
	if @FirstName is not null begin set @sqlCmd = @sqlCmd+ ' FirstName = N'''+ @FirstName +''' , ' end
	if @LastName is not null  begin set @sqlCmd =  @sqlCmd+' LastName = N'''+ @LastName +''' , ' end
	set @sqlCmd = Trim( ', ' from @sqlCmd);

	declare @userid bigint ;
	declare @userTable userTable;
	insert into @userTable
		SELECT top 1 id,Guid,Username,Email,FirstName,LastName,MobileNumber,IsActive,IsVerifiedEmail
		from Users 
		where Email = @Email

	 select top 1 @userid = Id  from @userTable
	 set @SqlCmd = @SqlCmd + ' output inserted.id where id='+cast( @userid as nvarchar)

	 if @userid >0 
	 begin
		exec SP_ExecuteSQL @SqlCmd
		set @responseMessage ='updated succesfully.'
		SELECT top 1 * from Users us where id = @userid
	 end
	 else  set @responseMessage = 'no record updated!'
END

GO

