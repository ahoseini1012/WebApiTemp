namespace LicenseServer.Models
{
    public enum MyStatusCode
    {
        Success = 200,
        Error = 500,
        UnAuthorize = 401,
        forbidden = 403,
        NotFound = 404,
        BadRequest = 400,
        UnKnown_error = -1,
        Execption_error = -2,
        User_existed_error = 10410,
        verification_error = 10411,
        ResetPassword_error = 10412,
        ChangePassword_error = 10413,
        ChangeProfile_error = 10414,
        UploadAvatar_error = 10415,
        FileNotFount_error = 10416,
        DB_error = 10417,
        Duplicated_Record_error = 10418,
        Sending_otp = 10419,
        FillForm = 10420,
        Invalid_MobileNo = 10421,
    }
}