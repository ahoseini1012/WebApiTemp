namespace LicenseServer.Utilities
{
    public class ApiResult<T>
    {
        public int _Status { get; set; }
        public T? Result { get; set; }
        public int? _ErrorCode { get; set; } = 0;
        public string? Message { get; set; } = String.Empty;
    }
}