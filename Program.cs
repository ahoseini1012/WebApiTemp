using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using WebTemplate.DL;
using WebTemplate.Utilities;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using fetratgram_smh.Utility.Email;
using fetratgram_smh.Utility;

internal class Program
{
    private static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        // Add services to the container.
        builder.Services.AddControllers();
        builder.Services.AddSingleton<DBContext>();
        builder.Services.AddScoped<IUsers, Users>();
        builder.Services.AddTransient<IGenerateNewToken, GenerateNewToken>();

        // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddSwaggerGen(options =>
        {
            options.SwaggerDoc("v1", new OpenApiInfo { Title = "FetratGram", Version = "v1" });
            options.ResolveConflictingActions(apiDescriptions => apiDescriptions.First());
            options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
            {
                Scheme = "Bearer",
                BearerFormat = "JWT",
                In = ParameterLocation.Header,
                Name = "Authorization",
                Description = "Bearer Authentication with JWT Token",
                Type = SecuritySchemeType.Http
            });
            options.AddSecurityRequirement(new OpenApiSecurityRequirement {
                {
                    new OpenApiSecurityScheme {
                        Reference = new OpenApiReference {
                            Id = "Bearer",
                                Type = ReferenceType.SecurityScheme
                        }
                    },
                    new List < string > ()
                }
            });
        });

        // Email service configuration
        var emailConfig = builder.Configuration.GetSection("EmailConfiguration").Get<EmailConfiguration>();
        builder.Services.AddSingleton(emailConfig);
        builder.Services.AddScoped<IEmailSender, EmailSender>();

        //versioning
        builder.Services.AddApiVersioning(config =>
                    {
                        // Specify the default API Version as 1.0
                        config.DefaultApiVersion = new ApiVersion(1, 0);
                        // If the client hasn't specified the API version in the request, use the default API version number 
                        config.AssumeDefaultVersionWhenUnspecified = true;
                        // Advertise the API versions supported for the particular endpoint
                        config.ReportApiVersions = true;
                        //config.ApiVersionReader = new HeaderApiVersionReader("x-api-version");
                    });

        //JWT Authentication
        var secretKey = builder.Configuration["Jwt:Key"];
        var tokenTimeOut = Convert.ToDouble(builder.Configuration["Jwt:TokenTimeOut"]);
        var key = Encoding.UTF8.GetBytes(secretKey);
        builder.Services.AddAuthentication(x =>
        {
            x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
            x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
        })
        .AddJwtBearer(x =>
        {
            x.RequireHttpsMetadata = false;
            x.SaveToken = true;
            x.TokenValidationParameters = new TokenValidationParameters
            {
                //برای کنترل زمان توکن
                ClockSkew = TimeSpan.FromMinutes(tokenTimeOut),
                ValidateLifetime = true,
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(key),
                ValidateIssuer = false,
                ValidateAudience = false
            };
        });


        builder.Services.AddCors(options =>
        {
            options.AddPolicy("Policy1",
                          policy =>
                          {
                              policy
                            .AllowAnyOrigin()
                            .AllowAnyHeader()
                            .AllowAnyMethod();
                          });
        });

        var app = builder.Build();

        // Configure the HTTP request pipeline.
        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI();
            app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "WebTemplate v1"));
        }

        app.UseHttpsRedirection();
        app.UseAuthentication();
        app.UseAuthorization();

        app.MapControllers();

        app.Run();
    }
}