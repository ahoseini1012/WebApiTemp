using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Serilog;

namespace LicenseServer.Middleware
{
    public class LoggingMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly Serilog.ILogger _logger;
        public LoggingMiddleware(RequestDelegate next)
        {
            _next = next;
            _logger = new LoggerConfiguration()
                .WriteTo.Console()
                .WriteTo.Seq("http://localhost:5341/")
                .CreateLogger();
        }
        public async Task Invoke(HttpContext httpContext)
        {
            bool requestHasBody = httpContext.Request.ContentLength > 0;
            if (requestHasBody)
            {
                try
                {
                    httpContext.Request.EnableBuffering();
                    string requestBody = await new StreamReader(httpContext.Request.Body, Encoding.UTF8).ReadToEndAsync();
                    httpContext.Request.Body.Position = 0;
                    var requestEnriched = Log
                        .ForContext("ClientIP", httpContext.Connection.RemoteIpAddress)
                        .ForContext("RequestBody", requestBody);
                    requestEnriched.Information(httpContext.Request.Path);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Exception reading request: {ex.Message}");
                }

                Stream originalBody = httpContext.Response.Body;
                try
                {
                    using var memStream = new MemoryStream();
                    httpContext.Response.Body = memStream;

                    // call to the following middleware 
                    // response should be produced by one of the following middlewares
                    await _next(httpContext);

                    memStream.Position = 0;
                    string responseBody = new StreamReader(memStream).ReadToEnd();

                    memStream.Position = 0;
                    await memStream.CopyToAsync(originalBody);
                    // Console.WriteLine(responseBody);
                        var responseEnriched = Log
                            .ForContext("ClientIP", httpContext.Connection.RemoteIpAddress)
                            .ForContext("ResponseBody", responseBody);
                        responseEnriched.Information(httpContext.Request.Path);
                }
                finally
                {
                    httpContext.Response.Body = originalBody;
                }
            }
            else
            {
                await _next(httpContext); // calling next middleware
            }

        }

        public static async Task<string> GetRawRequestBodyAsync(HttpRequest request, Encoding encoding)
        {
            if (!request.Body.CanSeek)
            {
                request.EnableBuffering();
            }
            request.Body.Position = 0;
            var reader = new StreamReader(request.Body, encoding ?? Encoding.UTF8);
            var body = await reader.ReadToEndAsync().ConfigureAwait(false);
            request.Body.Position = 0;
            return body;
        }
    }


    // Extension method used to add the middleware to the HTTP request pipeline.
    public static class LoggingMiddlewareExtensions
    {
        public static IApplicationBuilder UseLoggingMiddleware(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<LoggingMiddleware>();
        }
    }


}