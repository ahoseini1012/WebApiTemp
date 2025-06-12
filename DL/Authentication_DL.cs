using System.Data;
using Dapper;
using Microsoft.Data.SqlClient;
using WebTemplate.Models.DB;
using static WebTemplate.Utility.ExceptionHandling;

namespace LicenseServer.DL.Authentication
{
    public interface IAuthentication_DL
    {
        Task<int> InsertNewUser(User user);
        Task<int> InsertOTP(string mobileNo);
        // Task<int> Login(LoginByUsername.request request);
    }

    public class Authentication_DL : IAuthentication_DL
    {
        private readonly Serilog.ILogger _logger;
        private readonly DBContext _db;

        public Authentication_DL(DBContext dBContext,
         Serilog.ILogger logger)
        {
            _logger = logger;
            _db = dBContext;
        }

        public async Task<int> InsertNewUser(User user)
        {
            try
            {
                var cnn = _db.CreateConnection();
                var data = new DynamicParameters();
                data.Add("Fname", user.Fname);
                data.Add("Lname", user.Lname);
                data.Add("MobileNo", user.MobileNo);
                data.Add("Email", user.Email);

                int insertUser = await cnn.ExecuteAsync("sp_insertUser", data, commandType: CommandType.StoredProcedure);
            }
            catch (SqlException dbEx)
            {
                if (dbEx.Number == 2627)
                {
                    throw new CustomException("Duplicate mobile number detected", ErrorCode.DuplicatedMobileNumber);
                }
                throw;
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                throw;
            }
            return -1;
        }

        public async Task<int> InsertOTP(string mobileNo)
        {
            try
            {
                var cnn = _db.CreateConnection();
                var data = new DynamicParameters();
                data.Add("mobileNo", mobileNo);
                data.Add("otp", dbType: DbType.Int32, direction: ParameterDirection.Output);
                await cnn.ExecuteAsync("sp_OTPGeneration", data, commandType: CommandType.StoredProcedure);
                return data.Get<int>("otp");
            }
            catch (SqlException dbEx)
            {
                if (dbEx.InnerException is SqlException sqlEx && (sqlEx.Number == 5000))
                {
                    throw new CustomException("recently generated token. try again after 2 minutes", ErrorCode.AlreadyGeneratedOTP);
                }
                throw;
            }
            catch (System.Exception)
            {
                throw;
            }
        }

        // public async Task<int> Login(LoginByUsername.request request)
        // {
        //     var dbResult = new DBResult<User_>();
        //     var cnn = _db.CreateConnection();
        //     var data = new DynamicParameters();
        //     data.Add("username", request.username);
        //     data.Add("password", request.password);
        //     data.Add("responseCode", dbType: DbType.Int32, direction: ParameterDirection.Output);
        //     data.Add("responseMessage", dbType: DbType.String, direction: ParameterDirection.Output, size: 250);

        //     var queryRes = await cnn.QueryAsync<User_>("SP_UserGetLogin", data, commandType: CommandType.StoredProcedure);
        //     dbResult.responseMessage = data.Get<string>("responseMessage");
        //     dbResult.responseCode = data.Get<int>("responseCode");
        //     if (dbResult.responseCode != 500)
        //     {
        //         dbResult.Result = queryRes.FirstOrDefault();
        //     }
        //     return dbResult;
        // }
    }
}