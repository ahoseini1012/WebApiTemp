CREATE FUNCTION [dbo].[fn_CheckUrl]
(
    @url nvarchar(max)
)
RETURNS nvarchar(max)
as
begin
    return @url+'_1'
end

--select dbo.fn_CheckUrl('ab',1)

GO

