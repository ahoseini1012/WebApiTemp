-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RegisterUser] 
	@Name nvarchar(50) null,
	@Family nvarchar(50) null,
	@UserName nvarchar(50) null,
	@Password nvarchar(50) null,
	@Picture nvarchar(500) null,
	@Email nvarchar(50) null,
	@Phone char(20) null,
	@F_M bit null,
	@Website nvarchar(50) null,
	@ftMVC_EducationID int null,
	@InstagramID nvarchar(20) null,
	@State nvarchar(50) null,
	@City nvarchar(50) null,
	@Biography ntext null,
	@googleAccount nchar(20) null,
	@Active bit null,
	@UUID nchar(50) null,
	@Question nvarchar(250) null,
	@Answer nvarchar(250) null,
	@Phone_OK bit null,
	@Email_OK bit null,
	@Code char(8) null,
	@hasChannel bit null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @_PasswordSult UNIQUEIDENTIFIER = newid();
	declare @_PasswordNew binary(64) =  HASHBYTES('SHA2_512', @Password + cast(@_PasswordSult as nvarchar(36)));
	declare @isInserted bit = 0

    -- Insert statements for procedure here
	insert into dbo.ftMVC_Users 
	output inserted.*
	values
	(@Name,@Family,@UserName,@Password,@_PasswordNew,@_PasswordSult,@Picture,@Email,@Phone,@F_M,@Website,@ftMVC_EducationID,@InstagramID,@State,
	@City,@Biography,@googleAccount,@Active,@UUID,@Question,@Answer,@Phone_OK,@Email_OK,@Code,@hasChannel)
END

GO

