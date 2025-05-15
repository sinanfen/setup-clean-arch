
# setup-clean-arch

# 📦 Clean Architecture Solution Setup Script

Bu script, Clean Architecture proje yapısını hızlıca oluşturur. Solution adı parametre olarak alınır.

## 🗂️ Klasör Yapısı

```
repos/
└── {SolutionName}/
    ├── {SolutionName}.sln
    └── src/
        ├── {SolutionName}.Domain/
        │   ├── Entities/Placeholder.cs
        │   ├── ValueObjects/Placeholder.cs
        │   └── ...
        ├── {SolutionName}.Application/
        ├── {SolutionName}.Infrastructure/
        └── {SolutionName}.WebApi/
```

## ✅ Kullanım Adımları

### 1️⃣ Proje Konumuna Git
```powershell
cd C:\Users\Sinan\source\repos
```

### 2️⃣ Script Çalıştırma Yetkisi Ver (Geçici)
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```
➡ Çıkan soruya `Y` yazıp Enter'a bas.

### 3️⃣ Scripti Çalıştır (Masaüstünden örnek)
```powershell
& "C:\Users\Sinan\Desktop\setup-clean-arch.ps1" -SolutionName "YemekzaVendor"
```

## 🏁 Örnek Çıktı (Entities folder içinde):
```csharp
namespace YemekzaVendor.Domain.Entities
{
    public class Placeholder
    {
    }
}
```

## 🔄 Özet Komut Akışı
```powershell
cd C:\Users\Sinan\source\repos
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
& "C:\Users\Sinan\Desktop\setup-clean-arch.ps1" -SolutionName "YemekzaVendor"
```

## ℹ️ Notlar
- Solution klasörü otomatik oluşturulur.
- Solution dosyası varsa tekrar oluşturulmaz.
- src altına projeler otomatik oluşturulur.
- Folderlar ve Placeholder.cs dosyaları oluşturulur.
- SolutionName parametresi ile farklı isimlerde tekrar tekrar çalıştırabilirsiniz.
