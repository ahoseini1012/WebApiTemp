namespace WebTemplate.Utilities
{
    public class ApiResult<T>
    {
        public int Status { get; set; }
        public T? Data { get; set; }
        public int? ErrorCode { get; set; } = 0;
        public string Message { get; set; } = String.Empty;
    }
}