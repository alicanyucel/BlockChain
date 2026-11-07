# Runtime
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS base
WORKDIR /app

EXPOSE 8080

# Build
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

COPY ["BlockchainAPI.Core/BlockchainAPI.Core.csproj", "BlockchainAPI.Core/"]
COPY ["BlockchainAPI.Responses/BlockchainAPI.Responses.csproj", "BlockchainAPI.Responses/"]
COPY ["BlockchainAPI.Blockchain/BlockchainAPI.Blockchain.csproj", "BlockchainAPI.Blockchain/"]
COPY ["BlockchainAPI.Block/BlockchainAPI.Block.csproj", "BlockchainAPI.Block/"]
COPY ["BlockchainAPI.Transactions/BlockchainAPI.Transactions.csproj", "BlockchainAPI.Transactions/"]
COPY ["BlockchainAPI.Repository/BlockchainAPI.Repository.csproj", "BlockchainAPI.Repository/"]

RUN dotnet restore "BlockchainAPI.Core/BlockchainAPI.Core.csproj"

COPY . .

WORKDIR "/src/BlockchainAPI.Core"

RUN dotnet build "BlockchainAPI.Core.csproj" \
    -c Release \
    -o /app/build \
    --no-restore

FROM build AS publish

RUN dotnet publish "BlockchainAPI.Core.csproj" \
    -c Release \
    -o /app/publish \
    --no-build

FROM base AS final

WORKDIR /app

COPY --from=publish /app/publish .

ENTRYPOINT ["dotnet", "BlockchainAPI.Core.dll"]
