FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /src
COPY ["Protos/", "./Protos/"]
COPY ["server/.", "./server/"]
WORKDIR /src/server
RUN dotnet restore "./GrpcGreeter.csproj"
RUN dotnet build "GrpcGreeter.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "GrpcGreeter.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "GrpcGreeter.dll"]
