var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello from .NET Core with Nginx!");

app.Run("http://*:8080"); // Listen on port 8080 for Nginx proxy