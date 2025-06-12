
namespace WebTemplate.Utility
{
    public class ExceptionHandling
    {
        public enum ErrorCode
        {
            Success = 0,
            DuplicatedMobileNumber = 1001,
            AlreadyGeneratedOTP=1002,
            UnknownError = 9999
        }

        public class CustomException : Exception
        {
            public ErrorCode ErrorCode { get; }

            public CustomException(string message, ErrorCode errorCode) : base(message)
            {
                ErrorCode = errorCode;
            }
        }


    }
}