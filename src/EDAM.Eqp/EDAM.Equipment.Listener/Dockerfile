#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/runtime:7.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["EDAM.Equipment.Listener/EDAM.Equipment.Listener.csproj", "EDAM.Equipment.Listener/"]
COPY ["EDAM.Equipment.Infrastructure/EDAM.Equipment.Infrastructure.csproj", "EDAM.Equipment.Infrastructure/"]
COPY ["EDAM.Equipment.Domain/EDAM.Equipment.Domain.csproj", "EDAM.Equipment.Domain/"]
RUN dotnet restore "EDAM.Equipment.Listener/EDAM.Equipment.Listener.csproj"
COPY . .
WORKDIR "/src/EDAM.Equipment.Listener"
RUN dotnet build "EDAM.Equipment.Listener.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "EDAM.Equipment.Listener.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "EDAM.Equipment.Listener.dll"]