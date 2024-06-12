
CREATE PROCEDURE [dbo].[ftsMVC_ListEventINTime]
	
AS
BEGIN
	SET NOCOUNT ON;

	
    -- Insert statements for procedure here
	 --SELECT        *
	 --FROM            ftMVC_ContentsEvent
	 --where convert(nvarchar(10), DATEADD(day,CONVERT(INT , (SELECT Value as AddDay from ftMVC_Settings 
	 --				where name = 'Month' + CONVERT(varchar(2), MONTH(GETDATE()) , 2) )), getdate()) , 131) =
	 --				right('00' + CONVERT(varchar(2), Date_Day) ,2) + '/' + right('00' + CONVERT(varchar(2),Date_Month)  , 2) + '/' + right(convert(nvarchar(10), getdate(), 131),4)
	 

		SELECT        ftMVC_Contents.ID, ftMVC_Contents.titleMin, ftMVC_Contents.titleMax, ftMVC_Contents.URLAddress, ftMVC_Headlines.URLAddress AS HeadlinesURLAddress, 2 AS [order]
		FROM            ftMVC_Contents INNER JOIN
									 (SELECT        ID, ftMVC_ContentsID, ftMVC_UsersID, Date_Month, Date_Day
										FROM            ftMVC_ContentsEvent
										WHERE        (CONVERT(nvarchar(10), DATEADD(day, CONVERT(INT,
																	 (SELECT        Value AS AddDay
																		FROM            ftMVC_Settings
																		WHERE        (Name = 'Month' + CONVERT(varchar(2), MONTH(GETDATE()), 2)))), GETDATE()), 131) = RIGHT('00' + CONVERT(varchar(2), Date_Day), 2) + '/' + RIGHT('00' + CONVERT(varchar(2), Date_Month), 2) 
																 + '/' + RIGHT(CONVERT(nvarchar(10), GETDATE(), 131), 4))) AS Q11 ON ftMVC_Contents.ID = Q11.ftMVC_ContentsID INNER JOIN
								 ftMVC_Headlines ON ftMVC_Contents.ftMVC_HeadlinesID = ftMVC_Headlines.ID
		WHERE        (ftMVC_Contents.ShowOrNoShow = 1) AND (ftMVC_Contents.Archive = 0)



END

GO

