using System.Data;
using Dapper;
using LicenseServer.Models.Authentication;
using LicenseServer.Models.DB;
using LicenseServer.Utilities;

namespace LicenseServer.DL.Authentication
{
    public interface IAuthentication_DL
    {
        Task<DBResult<User>> Login(Login.request request);
    }

    public class Authentication_DL : IAuthentication_DL
    {
        private readonly DBContext _db;

        public Authentication_DL(DBContext dBContext)
        {
            _db = dBContext;
        }

        public async Task<DBResult<User>> Login(Login.request request)
        {
            var dbResult = new DBResult<User>();
            var cnn = _db.CreateConnection();
            var data = new DynamicParameters();
            data.Add("username", request.username);
            data.Add("password", request.password);
            data.Add("responseCode", dbType: DbType.Int32, direction: ParameterDirection.Output);
            data.Add("responseMessage", dbType: DbType.String, direction: ParameterDirection.Output, size: 250);

            var queryRes = await cnn.QueryAsync<User>("SP_UserGetLogin", data, commandType: CommandType.StoredProcedure);
            dbResult.responseMessage = data.Get<string>("responseMessage");
            dbResult.responseCode = data.Get<int>("responseCode");
            if (dbResult.responseCode != 500)
            {
                dbResult.Result = queryRes.FirstOrDefault();
            }
            return dbResult;
        }

    }
}