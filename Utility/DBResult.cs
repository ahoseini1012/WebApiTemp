namespace LicenseServer.Utilities
{
    public class DBResult<T>
    {
        public T? Result { get; set; }
        public string responseMessage { get; set; } = String.Empty;
        public int responseCode { get; set; }
    }
}