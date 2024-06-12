using System.Data;
using Dapper;
using LicenseServer.ThirdPartyServices;
using LicenseServer.DL;
using LicenseServer.Models;
using LicenseServer.Utilities;

namespace LicenseServer.DL
{
    public interface IHome
    {
    }

    public class Home : IHome
    {
        private readonly DBContext _db;

        public Home(DBContext dBContext)
        {
            _db = dBContext;
        }



        // public async Task<ApiResult<Ftgram_API3_Response>> Version()
        // {
        //     var apiResult = new ApiResult<Ftgram_API3_Response>() { Result = new Ftgram_API3_Response() };

        //     using var cnn = _db.CreateConnection();
        //     var procedure = "sp_GetVersion";
        //     DynamicParameters data = new();

        //     var dbResult = await cnn.QueryAsync<ftGRAM_Version>(procedure, data, commandType: CommandType.StoredProcedure);
        //     if (!dbResult.Any())
        //     {
        //         apiResult._Status = (int)MyStatusCode.NotFound;
        //         apiResult.Result.Result = string.Empty;
        //         apiResult.Result.Message = "ورژنی یافت نشد";
        //         apiResult.Message = "ورژنی یافت نشد";
        //     }
        //     else
        //     {
        //         apiResult._Status = (int)MyStatusCode.Success;
        //         apiResult.Message = dbResult.FirstOrDefault()!.Description;
        //         apiResult.Result.Message = dbResult.FirstOrDefault()!.Description;
        //         apiResult.Result.Result = dbResult.FirstOrDefault()!.Version.Trim();
        //     }
        //     return apiResult;
        // }
    }
}