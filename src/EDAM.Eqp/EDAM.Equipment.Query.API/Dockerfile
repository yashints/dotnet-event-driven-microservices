#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["EDAM.Equipment.Query.API/EDAM.Equipment.Query.API.csproj", "EDAM.Equipment.Query.API/"]
RUN dotnet restore "EDAM.Equipment.Query.API/EDAM.Equipment.Query.API.csproj"
COPY . .
WORKDIR "/src/EDAM.Equipment.Query.API"
RUN dotnet build "EDAM.Equipment.Query.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "EDAM.Equipment.Query.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "EDAM.Equipment.Query.API.dll"]