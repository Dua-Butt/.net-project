# Stage 1: Build the .NET app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY src/MyApp/MyApp.csproj .
RUN dotnet restore MyApp.csproj
COPY src/MyApp .
RUN dotnet publish MyApp.csproj -c Release -o /app/publish

# Stage 2: Runtime image for .NET app
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 8080
ENTRYPOINT ["dotnet", "MyApp.dll"]