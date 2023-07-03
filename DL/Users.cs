using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using WebTemplate.Utilities;
using WebTemplate.DL;
using WebTemplate.Models;
using Microsoft.AspNetCore.Identity;
using fetratgram_smh.Utility;
using fetratgram_smh.Models.User;

namespace WebTemplate.DL
{

    public interface IUsers
    {
        public Task<ApiResult<List<UserModel>>> GetUsers(GetUsersModel model);
        public Task<ApiResult<LoginModelResponse>> GetLogIn(LoginModelRequest model);
        public Task<ApiResult<bool>> LogOut(LogOutModelRequest model);
        public Task<ApiResult<bool>> AddUser(AddUserModel model);
        public Task<ApiResult<bool>> UpdateUserByEmail(UpdaeUserModel model);
        public Task<ApiResult<bool>> ChangePassword(ChangePasswordModel model);
        public Task<ApiResult<bool>> ResetPassword(string token, string email, string newPassword);
        public ApiResult<bool> SendVerificationEmail(string token, string email);
        public Task<ApiResult<bool>> InsertVerificationEmailRecord(string email);
        public Task<ApiResult<bool>> VerifyEmail(string token, string email);
        public Task<ApiResult<RefreshTokenModel>> GetNewTokens(GetNewTokensModel model);
    }

    public class Users : IUsers
    {
        private readonly DBContext _db;
        private readonly IGenerateNewToken _generateNewToken;
        private readonly IEmailSender _emailSender;
        private readonly IConfiguration _configuration;

        public Users(
            DBContext dBContext,
            IGenerateNewToken generateNewToken,
            IEmailSender emailSender,
            IConfiguration configuration)
        {
            _db = dBContext;
            _generateNewToken = generateNewToken;
            _emailSender = emailSender;
            _configuration = configuration;
        }

        public async Task<ApiResult<bool>> AddUser(AddUserModel model)
        {
            // var addUserModel = new AddUserModel();

            using var cnn = _db.CreateConnection();
            var procedure = "SP_AddUsers";
            DynamicParameters data = new();
            data.Add("Username", model.Username);
            data.Add("Password", model.Password);
            data.Add("Email", model.Email);
            data.Add("MobileNumber", model.MobileNumber);
            data.Add("FirstName", model.FirstName);
            data.Add("LastName", model.LastName);
            data.Add("@returnToken", dbType: DbType.Int32, direction: ParameterDirection.Output);
            data.Add("@responseMessage", dbType: DbType.String, direction: ParameterDirection.Output, size: 250);


            var results = await cnn.QueryAsync<string>(procedure, data, commandType: CommandType.StoredProcedure);

            var returnToken = data.Get<int?>("@returnToken");
            var responseMessage = data.Get<string>("@responseMessage");

            if (returnToken > 0 && returnToken != null)
            {
                SendVerificationEmail(returnToken.Value.ToString(), model.Email);
                return new ApiResult<bool>()
                {
                    Data = true,
                    Message = "user added successfully",
                    ErrorCode = 0,
                    Status = (int)MyStatusCode.Success
                };
            }
            else
            {
                return new ApiResult<bool>
                {
                    Data = false,
                    Message = responseMessage,
                    ErrorCode = (int)MyErrorCode.user_existed_error,
                    Status = (int)MyStatusCode.BadRequest
                };
            }
        }

        public async Task<ApiResult<List<UserModel>>> GetUsers(GetUsersModel model)
        {
            var apiResult = new ApiResult<List<UserModel>>();

            using var cnn = _db.CreateConnection();
            var procedure = "sp_getUsers";
            DynamicParameters data = new();
            data.Add("Email", model.Email);
            data.Add("@responseMessage", dbType: DbType.Int32, direction: ParameterDirection.Output);
            var response = await cnn.QueryAsync<UserModel>(procedure, data, commandType: CommandType.StoredProcedure);
            List<UserModel> userList = response.AsList();

            if (userList.Any())
            {
                apiResult.Data = userList;
                apiResult.Status = (int)MyStatusCode.Success;
                apiResult.ErrorCode = null;
                apiResult.Message = String.Empty;
            }
            else
            {
                apiResult.Data = userList;
                apiResult.Status = (int)MyStatusCode.Success;
                apiResult.ErrorCode = null;
                apiResult.Message = "کاربری یافت نشد";
            }
            return apiResult;
        }

        public async Task<ApiResult<LoginModelResponse>> GetLogIn(LoginModelRequest model)
        {
            using var cnn = _db.CreateConnection();
            var procedure = "sp_getLogin";
            DynamicParameters data = new();
            data.Add("Email", model.Email);
            data.Add("Password", model.Password);
            data.Add("responseMessage", dbType: DbType.String, direction: ParameterDirection.Output, size: 50);
            data.Add("responseBoolean", dbType: DbType.Boolean, direction: ParameterDirection.Output);
            var response = await cnn.QueryAsync<UserModel>(procedure, data, commandType: CommandType.StoredProcedure);
            var responseMessage = data.Get<string>("responseMessage");
            var responseBoolean = data.Get<bool>("responseBoolean");

            if (response.Any())
            {
                var res = response.FirstOrDefault();
                string accessToken = _generateNewToken.NewToken(res!.Id.ToString());
                string refreshToken = Guid.NewGuid().ToString();
                // insert user logging into database
                procedure = "sp_insertLoginHistoryAndUserTokens";
                data = new();
                data.Add("Accesstoken", accessToken);
                data.Add("Refreshtoken", refreshToken);
                data.Add("UserId", res!.Id.ToString());
                data.Add("responseMessage", dbType: DbType.String, direction: ParameterDirection.Output, size: 50);
                data.Add("responseBoolean", dbType: DbType.Boolean, direction: ParameterDirection.Output);
                await cnn.QueryAsync(procedure, data, commandType: CommandType.StoredProcedure);
                var responseMessage1 = data.Get<string>("responseMessage");
                var responseBoolean1 = data.Get<bool>("responseBoolean");

                if (responseBoolean1)
                {
                    return new ApiResult<LoginModelResponse>()
                    {
                        // Generate Token and RefereshToken
                        Data = new LoginModelResponse()
                        {
                            AccessToken = accessToken,
                            RefereshToken = refreshToken,
                            UserId = res!.Id
                        },
                        Status = 200,
                        ErrorCode = 0,
                        Message = responseMessage1
                    };
                }
                else
                {
                    return new ApiResult<LoginModelResponse>()
                    {
                        // Generate Token and RefereshToken
                        Data = null,
                        Status = 200,
                        ErrorCode = 404,
                        Message = responseMessage1
                    };
                }
            }
            else
            {
                return new ApiResult<LoginModelResponse>()
                {
                    // Generate Token and RefereshToken
                    Data = null,
                    Status = 200,
                    ErrorCode = 404,
                    Message = "کلمه عبور یا  نام کاربری اشتباه هست"
                };
            }
        }

        public async Task<ApiResult<bool>> LogOut(LogOutModelRequest model)
        {
            using var cnn = _db.CreateConnection();
            var procedure = "sp_getLogout";
            DynamicParameters data = new();
            data.Add("UserId", model.UserId);
            data.Add("RefreshToken", model.RefreshToken);
            data.Add("responseMessage", dbType: DbType.Boolean, direction: ParameterDirection.Output);

            await cnn.QueryAsync<int>(procedure, data, commandType: CommandType.StoredProcedure);
            var responseMessage = data.Get<bool>("@responseMessage");

            return new ApiResult<bool>()
            {
                Status = (int)MyStatusCode.Success,
                Data = true,
                Message = "user has been logged out successfully.",
                ErrorCode = 0
            };

        }

        public async Task<ApiResult<bool>> UpdateUserByEmail(UpdaeUserModel model)
        {
            using var cnn = _db.CreateConnection();
            var procedure = "sp_updateUser";
            DynamicParameters data = new();
            data.Add("Email", model.Email);
            data.Add("MobileNumber", model.MobileNumber);
            data.Add("FirstName", model.FirstName);
            data.Add("LastName", model.LastName);
            data.Add("responseMessage", dbType: DbType.String, direction: ParameterDirection.Output, size: 50);

            var response = await cnn.QueryAsync<int>(procedure, data, commandType: CommandType.StoredProcedure);
            var responseMessage = data.Get<string>("responseMessage");
            if (response.Any())
            {
                return new ApiResult<bool>()
                {
                    Status = 200,
                    Data = true,// response.FirstOrDefault(),
                    Message = responseMessage,
                    ErrorCode = 0
                };
            }
            else
            {
                return new ApiResult<bool>()
                {
                    Status = 200,
                    Data = false,
                    Message = responseMessage,
                    ErrorCode = 400
                };

            }
        }

        /// <summary>
        /// to send email containing verification token
        /// </summary>
        /// <param name="token"></param>
        /// <param name="email"></param>
        /// <returns></returns>
        public ApiResult<bool> SendVerificationEmail(string token, string email)
        {
            var message = _emailSender.CreateEmailMessage(email, $"you email confirmation code is : {token}");
            _emailSender.SendEmail(message);
            return new ApiResult<bool>()
            {
                Data = true,
                Status = (int)MyStatusCode.Success,
                ErrorCode = null,
                Message = "email has been send successfully"
            };
        }

        /// <summary>
        /// to send new verification email containing token. this method is generating token to send to user's email.
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public async Task<ApiResult<bool>> InsertVerificationEmailRecord(string email)
        {
            // create random number as token with 6 digit numbers
            Random rnd = new();
            var token = rnd.NextInt64(100000, 999999);

            // call sp to insert new record into EmailVerificationHistory
            using var cnn = _db.CreateConnection();
            var procedure = "sp_SendVerificationEmail";
            DynamicParameters data = new();
            data.Add("@Email", email);
            data.Add("@Token", token);
            data.Add("@responseMessage", dbType: DbType.Boolean, direction: ParameterDirection.Output);

            // get the response sp execution
            var response = await cnn.QueryAsync<int>(procedure, data, commandType: CommandType.StoredProcedure);
            var responseMessage = data.Get<bool>("@responseMessage");

            if (responseMessage)
            {
                // send email
                var isSent = SendVerificationEmail(token.ToString(), email);

                return new ApiResult<bool>()
                {
                    Data = isSent.Data,
                    Message = isSent.Data ? "new verification email has been sent successfully" : "some error accourds while sending verification email",
                    ErrorCode = isSent.Data ? 0 : (int)MyErrorCode.execption_error,
                    Status = isSent.Data ? 200 : 400
                };
            }
            else
            {
                return new ApiResult<bool>()
                {
                    Data = responseMessage,
                    Message = "some error accourds while trying to generate new verification token",
                    ErrorCode = (int)MyErrorCode.execption_error,
                    Status = (int)MyStatusCode.BadRequest
                };
            }
        }

        /// <summary>
        /// validate email to to verify email with two parameters: token and user's email.
        /// </summary>
        /// <param name="token"></param>
        /// <param name="email"></param>
        /// <returns></returns>
        public async Task<ApiResult<bool>> VerifyEmail(string token, string email)
        {
            //
            using var cnn = _db.CreateConnection();
            var procedure = "sp_VerifyEmail";
            DynamicParameters data = new();
            data.Add("@Email", email);
            data.Add("@Token", token);
            data.Add("@responseMessage", dbType: DbType.Boolean, direction: ParameterDirection.Output);

            // get the response sp execution
            var response = await cnn.QueryAsync<int>(procedure, data, commandType: CommandType.StoredProcedure);
            var responseMessage = data.Get<bool>("@responseMessage");

            // generate response
            return new ApiResult<bool>()
            {
                Data = responseMessage,
                Message = responseMessage ? "email is verified successfully" : "some error accourds while trying to verify email",
                ErrorCode = responseMessage ? 0 : (int)MyErrorCode.execption_error,
                Status = responseMessage ? 200 : 400
            };
        }

        public async Task<ApiResult<bool>> ChangePassword(ChangePasswordModel model)
        {
            using var cnn = _db.CreateConnection();
            var procedure = "sp_ChangePassword";
            DynamicParameters data = new();
            data.Add("userId", model.UserId);
            data.Add("OldPassword", model.Oldpassword);
            data.Add("NewPassword", model.Newpassword);
            data.Add("@responseMessage", dbType: DbType.String, direction: ParameterDirection.Output, size: 50);
            data.Add("@retVal", dbType: DbType.Int16, direction: ParameterDirection.Output);

            var response = await cnn.QueryAsync<int>(procedure, data, commandType: CommandType.StoredProcedure);
            var responseMessage = data.Get<string>("@responseMessage");
            if (response.Any())
            {
                return new ApiResult<bool>()
                {
                    Status = 200,
                    Data = true,
                    Message = responseMessage,
                    ErrorCode = -1
                };
            }
            else
            {
                return new ApiResult<bool>()
                {
                    Status = 200,
                    Data = false,
                    Message = responseMessage,
                    ErrorCode = 400
                };
            }
        }

        /// <summary>
        /// validate email to reset password with two parameters: token and email
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public async Task<ApiResult<bool>> ResetPassword(string token, string email, string newPassword)
        {
            using var cnn = _db.CreateConnection();
            var procedure = "sp_ResetPassword";
            DynamicParameters data = new();
            data.Add("@email", email);
            data.Add("@token", token);
            data.Add("@newPassword", newPassword);
            data.Add("@responseMessage", dbType: DbType.Boolean, direction: ParameterDirection.Output);

            // get the response sp execution
            var response = await cnn.QueryAsync<int>(procedure, data, commandType: CommandType.StoredProcedure);
            var responseMessage = data.Get<bool>("@responseMessage");

            // generate response
            return new ApiResult<bool>()
            {
                Data = responseMessage,
                Message = responseMessage ? "password is updated successfully" : "some error accourds while trying to update password",
                ErrorCode = responseMessage ? 0 : (int)MyErrorCode.execption_error,
                Status = responseMessage ? 200 : 400
            };
        }

        public async Task<ApiResult<RefreshTokenModel>> GetNewTokens(GetNewTokensModel model)
        {
            string NewAccessToken = _generateNewToken.NewToken(model.UserId.ToString());
            string NewRefreshToken = Guid.NewGuid().ToString();
            using var cnn = _db.CreateConnection();
            var procedure = "sp_getNewRefreshToken";
            DynamicParameters data = new();
            data.Add("@userId", model.UserId);
            data.Add("@RefreshTokenTimeout", _configuration["Jwt:RefreshTokenTimeout"]);
            data.Add("@OldRefreshToken", model.OldRefreshToken);
            data.Add("@NewRefreshToken", NewRefreshToken);
            data.Add("@returnedCreatedAt", dbType: DbType.DateTime, direction: ParameterDirection.Output);
            data.Add("@responseMessage", dbType: DbType.Boolean, direction: ParameterDirection.Output);

            // get the response sp execution
            await cnn.QueryAsync<int>(procedure, data, commandType: CommandType.StoredProcedure);
            var responseMessage = data.Get<bool>("@responseMessage");
            var returnedCreatedAt = data.Get<DateTime>("@returnedCreatedAt");
            if (responseMessage)
            {
                return new ApiResult<RefreshTokenModel>
                {
                    Data = new RefreshTokenModel
                    {
                        AccessTokenToken = NewAccessToken,
                        RefreshToken = NewRefreshToken,
                        CreatedAt = returnedCreatedAt
                    },
                    ErrorCode = 0,
                    Message = "new tokens inserted successfully",
                    Status = (int)MyStatusCode.Success
                };
            }
            else
            {
                return new ApiResult<RefreshTokenModel>
                {
                    Data = null,
                    ErrorCode = (int)MyErrorCode.execption_error,
                    Message = "some error accourds during insert new tokens",
                    Status = (int)MyStatusCode.Error
                };
            }
        }
    }
}
