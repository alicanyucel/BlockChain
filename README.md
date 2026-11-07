# Blockchain API

ASP.NET Core kullanılarak geliştirilmiş Blockchain API örneği.

## Blockchain Tanımı

*Blockchain*, işlemlerden oluşan blokların birbirine geriye dönük bağlantılarla bağlandığı ve sıralandığı bir veri yapısıdır. Düz bir dosyada veya basit bir veritabanında saklanabilir. Her blok, başlık bilgilerinden SHA-256 kriptografik hash algoritması kullanılarak üretilen bir hash değeriyle tanımlanır.

## Teknoloji ve Çalıştırma

- .NET 10 (`net10.0`)
- ASP.NET Core
- MongoDB.Driver 3.13.0
- Swashbuckle / Swagger 10.3.1

Gereksinimleri doğrulamak ve çözümü çalıştırmak için:

```powershell
dotnet --version
dotnet restore .\BlockchainAPI.sln
dotnet build .\BlockchainAPI.sln
dotnet run --project .\BlockchainAPI.Core\BlockchainAPI.Core.csproj
```

Swagger arayüzü, uygulama çalıştıktan sonra `/swagger` yolu üzerinden açılabilir.

## Endpoint'ler

- `GET: GetAllBlocks` — Blockchain içindeki tüm blokları döndürür.
- `GET: GetBalance` — Belirli bir madenci adresinin bakiyesini döndürür. Adres metin olarak gönderilir.
- `GET: IsValidChain` — Blockchain'in geçerli olup olmadığını kontrol eder.
- `POST: MineBlock` — Yeni bir blok üretir ve belirli bir madenci adresi için işlem oluşturur. Bakiyeyi daha sonra kontrol edebilmek için adresi saklayın.

## Bağlantılar

- GitHub: https://github.com/kolosovpetro/Blockchain-Api
- Swagger: https://blockchain-web-api.herokuapp.com/swagger
