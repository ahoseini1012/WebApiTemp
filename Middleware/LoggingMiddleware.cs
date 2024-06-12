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
                .WriteTo.Seq("http://45.149.79.174:5341/")
                .CreateLogger();
        }
        public async Task Invoke(HttpContext httpContext)
        {
            bool requestHasBody = httpContext.Request.ContentLength > 0;
            if (requestHasBody)
            {
                var requestBody = await GetRawBodyAsync(httpContext.Request, Encoding.UTF8);
                var requestEnriched = Log
                    .ForContext("Url", httpContext.Request.Path)
                    .ForContext("RequestBody", requestBody);
                requestEnriched.Information(httpContext.Request.Path);

                await _next(httpContext); // calling next middleware

                HttpResponse response = httpContext.Response;
                var originalResponseBody = response.Body;
                using var newResponseBody = new MemoryStream();
                response.Body = newResponseBody;
                newResponseBody.Seek(0, SeekOrigin.Begin);
                var responseBody =
                    await new StreamReader(response.Body).ReadToEndAsync();
                var responseEnriched = Log
                    .ForContext("Url", httpContext.Request.Path)
                    .ForContext("responseBody", responseBody);
                responseEnriched.Information(httpContext.Request.Path);

                newResponseBody.Seek(0, SeekOrigin.Begin);
                await newResponseBody.CopyToAsync(originalResponseBody);
            }else
            {
                await _next(httpContext); // calling next middleware
            }

        }

        public static async Task<string> GetRawBodyAsync(HttpRequest request, Encoding encoding)
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