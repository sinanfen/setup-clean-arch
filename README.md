# setup-clean-arch

# :package: Clean Architecture Solution Setup Script

Bu script, Clean Architecture proje yapısını hızlıca oluşturur. Solution adı parametre olarak alınır.

## :dividers: Klasör Yapısı

```
repos/
└── {SolutionName}.sln
└── src/
    ├── {SolutionName}.Domain/
    │   ├── Entities/Placeholder.cs
    │   ├── ValueObjects/Placeholder.cs
    │   └── ...
    ├── {SolutionName}.Application/
    ├── {SolutionName}.Infrastructure/
    └── {SolutionName}.WebApi/
```

## :white_check_mark: Kullanım Adımları

### :one: Proje Konumuna Git
```powershell
cd C:\Users\Sinan\source\repos
```

### :two: Script Çalıştırma Yetkisi Ver (Geçici)
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```
➡ `Y` yazıp Enter'a bas.

### :three: Scripti Çalıştır (Masaüstünden çalıştırabilirsiniz)
```powershell
& "C:\Users\Sinan\Desktop\setup-clean-arch.ps1" -SolutionName "YemekzaVendor"
```

## :checkered_flag: Örnek Çıktı (Entities folder içinde):
```csharp
namespace YemekzaVendor.Domain.Entities
{
    public class Placeholder
    {
    }
}
```

## :arrows_counterclockwise: Özet Komut Akışı
```powershell
cd C:\Users\Sinan\source\repos
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
& "C:\Users\Sinan\Desktop\setup-clean-arch.ps1" -SolutionName "YemekzaVendor"
```

## :information_source: Notlar
- Mevcut .sln dosyası varsa tekrar oluşturulmaz.
- Tüm folderlar otomatik oluşturulur.
- Placeholder.cs classları otomatik eklenir.
- İstediğin Solution adıyla tekrar tekrar kullanabilirsin.
