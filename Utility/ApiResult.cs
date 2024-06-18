namespace LicenseServer.Utilities
{
    public class ApiResult<T>
    {
        public int Status { get; set; }
        public T? Result { get; set; }
        public string? Message { get; set; } = String.Empty;
    }
}