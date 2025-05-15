param (
    [string]$SolutionName = "MyApp"
)

# Base Path: C:\Users\Sinan\source\repos
$reposRoot = (Get-Location).Path

# Solution Folder: C:\Users\Sinan\source\repos\MyApp
$solutionRoot = Join-Path $reposRoot $SolutionName

# src Folder: C:\Users\Sinan\source\repos\MyApp\src
$basePath = Join-Path $solutionRoot "src"

# Solution file: C:\Users\Sinan\source\repos\MyApp\MyApp.sln
$solutionFile = Join-Path $solutionRoot "$SolutionName.sln"

# Ana klasoru olustur
if (!(Test-Path $solutionRoot)) {
    New-Item -Path $solutionRoot -ItemType Directory -Force | Out-Null
    Write-Output "Created folder: $solutionRoot"
}

# src klasoru
if (!(Test-Path $basePath)) {
    New-Item -Path $basePath -ItemType Directory -Force | Out-Null
    Write-Output "Created folder: $basePath"
}

# Solution dosyasi
if (!(Test-Path $solutionFile)) {
    dotnet new sln -n $SolutionName -o $solutionRoot
    Write-Output "Created solution file: $solutionFile"
} else {
    Write-Output "Solution file already exists: $solutionFile"
}

# Project structure definition
$projects = @{
    "Domain" = @("Entities", "ValueObjects", "Repositories", "DomainEvents", "Exceptions", "Shared")
    "Application" = @("Abstractions", "Contracts", "Behaviors", "Features", "DependencyInjection")
    "Infrastructure" = @("Persistence", "Persistence/Configurations", "Persistence/Repositories", "Services", "DependencyInjection")
    "WebApi" = @("Controllers", "Middlewares", "ViewModels")
}

# Project folders and placeholder files
foreach ($projectKey in $projects.Keys) {
    $projectName = "$SolutionName.$projectKey"
    $projectPath = Join-Path $basePath $projectName

    # Proje klasoru
    New-Item -Path $projectPath -ItemType Directory -Force | Out-Null

    # Project type
    if ($projectKey -eq "WebApi") {
        dotnet new webapi -n $projectName -o $projectPath --framework net8.0
    } else {
        dotnet new classlib -n $projectName -o $projectPath --framework net8.0
    }

    # sln icine ekle
    dotnet sln $solutionFile add "$projectPath\$projectName.csproj"

    # Folders and Placeholder.cs files
    foreach ($folder in $projects[$projectKey]) {
        $folderPath = Join-Path $projectPath $folder
        New-Item -Path $folderPath -ItemType Directory -Force | Out-Null

        $placeholderFile = Join-Path $folderPath "Placeholder.cs"
        $namespace = "$projectName.$folder".Replace("/", ".").Replace("\\", ".")

        $content = @"
namespace $namespace
{
    public class Placeholder
    {
    }
}
"@
        $content | Out-File -FilePath $placeholderFile -Encoding UTF8
    }
}

Write-Output "Setup completed for $SolutionName"
