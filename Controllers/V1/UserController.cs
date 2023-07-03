using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using fetratgram_smh.Models.User;
using fetratgram_smh.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using WebTemplate.DL;
using WebTemplate.Models;
using WebTemplate.Utilities;

namespace WebTemplate.Controllers.v1
{
    [ApiController]
    [Route("api/v{version:apiVersion}/[controller]/[action]")]
    public class UserController : ControllerBase
    {
        private readonly IUsers _users;

        public UserController(IUsers users)
        {
            _users = users;
        }

        // register users
        [HttpPost]
        public async Task<ApiResult<bool>> AddUser(AddUserModel model)
        {
            // return user by checking username and password
            try
            {
                return await _users.AddUser(model);
            }
            catch (System.Exception e)
            {
                return new ApiResult<bool>
                {
                    Data = false,
                    Status = 0,
                    ErrorCode = (int)MyErrorCode.execption_error,
                    Message = e.Message.ToString()
                };
            }
        }

        //get user by any usermodel parameters
        [HttpPost]
        public async Task<ApiResult<List<UserModel>>> GetUsers(GetUsersModel model)
        {

            //return user by checking username and password
            try
            {
                return await _users.GetUsers(model);
            }
            catch (System.Exception e)
            {
                var apiResult = new ApiResult<List<UserModel>>()
                {
                    Data = null,
                    Status = (int)MyStatusCode.Error,
                    ErrorCode = (int)MyErrorCode.execption_error,
                    Message = "Message: " + e.Message + " innerException: " + e.InnerException
                };
                return apiResult;
            }

        }

        //login
        [HttpPost]
        public async Task<ApiResult<LoginModelResponse>> GetLogin(LoginModelRequest model)
        {
            try
            {
                // check login parameters : username and password
                return await _users.GetLogIn(model);
            }
            catch (System.Exception e)
            {
                return new ApiResult<LoginModelResponse>()
                {
                    Data = null,
                    Status = (int)MyStatusCode.Error,
                    ErrorCode = (int)MyErrorCode.execption_error,
                    Message = e.Message.ToString()
                };
            }
        }

        //get new tokens
        [HttpPost]
        public async Task<ApiResult<RefreshTokenModel>> GetNewTokens(GetNewTokensModel model)
        {
            try
            {
                // check login parameters : username and password
                return await _users.GetNewTokens(model);
            }
            catch (System.Exception e)
            {
                return new ApiResult<RefreshTokenModel>()
                {
                    Data = null,
                    Status = (int)MyStatusCode.Error,
                    ErrorCode = (int)MyErrorCode.execption_error,
                    Message = e.Message.ToString()
                };
            }
        }

        //logOut
        [HttpPost]
        public async Task<ApiResult<bool>> LogOut(LogOutModelRequest model)
        {
            try
            {
                // check login parameters : username and password
                return await _users.LogOut(model);
            }
            catch (System.Exception e)
            {
                return new ApiResult<bool>()
                {
                    Data = false,
                    Status = (int)MyStatusCode.Error,
                    ErrorCode = (int)MyErrorCode.execption_error,
                    Message = e.Message.ToString()
                };
            }
        }

        //update user profile by email
        [HttpPost]
        public async Task<ApiResult<bool>> UpdateUserByEmail(UpdaeUserModel model)
        {
            try
            {
                // check login parameters : username and password
                return await _users.UpdateUserByEmail(model);
            }
            catch (System.Exception e)
            {
                return new ApiResult<bool>()
                {
                    Data = false,
                    Status = (int)MyStatusCode.Error,
                    ErrorCode = (int)MyErrorCode.execption_error,
                    Message = e.Message.ToString()
                };
            }
        }

        /// <summary>
        ///verify email. if token is null or empty new email verification with token will be sent then should try again this method to 
        ///verify email with token later. else calling with token and email will verify the email.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<ApiResult<bool>> SendVerificationEmail(SendVerificationEmailModel model)
        {
            try
            {
                var isSent = await _users.InsertVerificationEmailRecord(model.Email);
                if (isSent.Data)
                {
                    return new ApiResult<bool>
                    {
                        Data = true,
                        Status = (int)MyStatusCode.Success,
                        ErrorCode = 0,
                        Message = "new email verification is sent"
                    };
                }
                else
                {
                    return new ApiResult<bool>
                    {
                        Data = false,
                        Status = (int)MyStatusCode.BadRequest,
                        ErrorCode = 0,
                        Message = "fail to send verification email"
                    };
                }
            }
            catch (System.Exception e)
            {
                return new ApiResult<bool>()
                {
                    Data = false,
                    Message = e.Message,
                    ErrorCode = (int)MyErrorCode.execption_error,
                    Status = 400
                };
            }


        }

        [HttpPost]
        public async Task<ApiResult<bool>> VerifyEmailByToken(VerifyEmailByTokenModel model)
        {
            try
            {
                return await _users.VerifyEmail(model.Token, model.Email);
            }
            catch (System.Exception e)
            {
                return new ApiResult<bool>()
                {
                    Data = false,
                    Message = e.Message,
                    ErrorCode = (int)MyErrorCode.execption_error,
                    Status = 400
                };
            }
        }

        //reset user password. this method send email containing reset password link.
        [HttpPost]
        public async Task<ApiResult<bool>> ResetPasswordByToken(ResetPasswordByTokenModel mdoel)
        {
            try
            {
                // send email
                return await _users.ResetPassword(mdoel.Token, mdoel.Email, mdoel.NewPassword);
            }
            catch (System.Exception e)
            {
                return new ApiResult<bool>()
                {
                    Data = false,
                    Status = (int)MyStatusCode.NotFound,
                    ErrorCode = (int)MyErrorCode.execption_error,
                    Message = e.Message.ToString()
                };
            }
        }

        //change user password
        [HttpPost]
        public async Task<ApiResult<bool>> ChangePassword(ChangePasswordModel model)
        {
            try
            {
                // check login parameters : username and password
                return await _users.ChangePassword(model);
            }
            catch (System.Exception e)
            {
                return new ApiResult<bool>()
                {
                    Data = false,
                    Status = (int)MyStatusCode.Error,
                    ErrorCode = (int)MyErrorCode.execption_error,
                    Message = e.Message.ToString()
                };
            }
        }

    }
}