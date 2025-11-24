# Model Download Script for Pixel Art Generation
# Run this script to download required models for SNES pixel art generation

Write-Host "`n╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  Stable Diffusion Pixel Art Models - Download Script      ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

# Ensure we're in the right directory
$scriptDir = $PSScriptRoot
if ($scriptDir) {
    Set-Location $scriptDir
}

Write-Host "Working Directory: $(Get-Location)`n" -ForegroundColor Yellow

# Create directories if they don't exist
$dirs = @(
    "models\Stable-diffusion",
    "models\Lora"
)

foreach ($dir in $dirs) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
        Write-Host "✅ Created directory: $dir" -ForegroundColor Green
    }
}

Write-Host "`n" + "="*60 -ForegroundColor Gray

# Model definitions
$models = @(
    @{
        Name = "SDXL Base 1.0"
        Url = "https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors"
        Path = "models\Stable-diffusion\sd_xl_base_1.0.safetensors"
        Size = "6.94 GB"
        Required = $true
    },
    @{
        Name = "Pixel Art XL LoRA"
        Url = "https://huggingface.co/nerijs/pixel-art-xl/resolve/main/pixel-art-xl.safetensors"
        Path = "models\Lora\pixel-art-xl.safetensors"
        Size = "~100 MB"
        Required = $true
    }
)

# Check existing files
Write-Host "`nChecking existing models..." -ForegroundColor Cyan

$toDownload = @()
foreach ($model in $models) {
    if (Test-Path $model.Path) {
        $fileSize = (Get-Item $model.Path).Length
        $fileSizeMB = [math]::Round($fileSize / 1MB, 2)
        Write-Host "✅ $($model.Name) already exists ($fileSizeMB MB)" -ForegroundColor Green
        Write-Host "   Location: $($model.Path)" -ForegroundColor Gray
    } else {
        Write-Host "⏳ $($model.Name) needs to be downloaded ($($model.Size))" -ForegroundColor Yellow
        $toDownload += $model
    }
}

if ($toDownload.Count -eq 0) {
    Write-Host "`n✅ All required models are already downloaded!" -ForegroundColor Green
    Write-Host "`nYou can now:" -ForegroundColor Cyan
    Write-Host "  1. Run: .\webui.bat" -ForegroundColor White
    Write-Host "  2. Open browser to: http://127.0.0.1:7860" -ForegroundColor White
    Write-Host "  3. Select SDXL base model" -ForegroundColor White
    Write-Host "  4. Add Pixel Art XL LoRA (click 🎴 icon)" -ForegroundColor White
    Write-Host "  5. Start generating pixel art!`n" -ForegroundColor White
    exit 0
}

Write-Host "`n" + "="*60 -ForegroundColor Gray
Write-Host "`nREQUIRED DOWNLOADS:" -ForegroundColor Yellow
Write-Host "Total models to download: $($toDownload.Count)" -ForegroundColor White

$totalSizeText = ($toDownload | ForEach-Object { $_.Size }) -join " + "
Write-Host "Total size: $totalSizeText`n" -ForegroundColor White

Write-Host "NOTE: Large files may take time depending on your connection." -ForegroundColor Magenta
Write-Host "      If download fails, you can manually download from the URLs below.`n" -ForegroundColor Magenta

# Ask for confirmation
$response = Read-Host "Do you want to download these models now? (y/n)"
if ($response -ne 'y' -and $response -ne 'Y') {
    Write-Host "`nDownload cancelled. Manual download instructions:" -ForegroundColor Yellow
    foreach ($model in $toDownload) {
        Write-Host "`n$($model.Name):" -ForegroundColor Cyan
        Write-Host "  URL: $($model.Url)" -ForegroundColor White
        Write-Host "  Save to: $($model.Path)" -ForegroundColor White
    }
    exit 0
}

Write-Host "`n" + "="*60 -ForegroundColor Gray
Write-Host "`nStarting downloads...`n" -ForegroundColor Cyan

# Download function with progress
function Download-ModelFile {
    param(
        [string]$Url,
        [string]$OutputPath,
        [string]$ModelName
    )
    
    try {
        Write-Host "Downloading: $ModelName" -ForegroundColor Cyan
        Write-Host "From: $Url" -ForegroundColor Gray
        Write-Host "To: $OutputPath`n" -ForegroundColor Gray
        
        # Use System.Net.WebClient for better progress reporting
        $webClient = New-Object System.Net.WebClient
        
        # Register progress event
        $webClient.DownloadProgressChanged += {
            param($sender, $e)
            $percent = $e.ProgressPercentage
            if ($percent -gt 0) {
                $received = [math]::Round($e.BytesReceived / 1MB, 2)
                $total = [math]::Round($e.TotalBytesToReceive / 1MB, 2)
                Write-Progress -Activity "Downloading $ModelName" -Status "$received MB / $total MB" -PercentComplete $percent
            }
        }
        
        # Download synchronously
        $webClient.DownloadFile($Url, $OutputPath)
        $webClient.Dispose()
        
        Write-Progress -Activity "Downloading $ModelName" -Completed
        
        $fileSize = (Get-Item $OutputPath).Length
        $fileSizeMB = [math]::Round($fileSize / 1MB, 2)
        
        Write-Host "✅ Downloaded successfully ($fileSizeMB MB)" -ForegroundColor Green
        Write-Host ""
        return $true
        
    } catch {
        Write-Host "❌ Download failed: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host ""
        return $false
    }
}

# Download each model
$successCount = 0
$failedModels = @()

foreach ($model in $toDownload) {
    $result = Download-ModelFile -Url $model.Url -OutputPath $model.Path -ModelName $model.Name
    
    if ($result) {
        $successCount++
    } else {
        $failedModels += $model
    }
}

# Summary
Write-Host "`n" + "="*60 -ForegroundColor Gray
Write-Host "`nDOWNLOAD SUMMARY:" -ForegroundColor Cyan
Write-Host "Successful: $successCount / $($toDownload.Count)" -ForegroundColor Green

if ($failedModels.Count -gt 0) {
    Write-Host "Failed: $($failedModels.Count)" -ForegroundColor Red
    Write-Host "`nFailed downloads - Manual download required:" -ForegroundColor Yellow
    foreach ($model in $failedModels) {
        Write-Host "`n$($model.Name):" -ForegroundColor Cyan
        Write-Host "  1. Visit: $($model.Url)" -ForegroundColor White
        Write-Host "  2. Download the file" -ForegroundColor White
        Write-Host "  3. Save to: $($model.Path)" -ForegroundColor White
    }
} else {
    Write-Host "`n✅ All models downloaded successfully!" -ForegroundColor Green
}

# Next steps
if ($successCount -eq $toDownload.Count) {
    Write-Host "`n" + "="*60 -ForegroundColor Gray
    Write-Host "`nNEXT STEPS:" -ForegroundColor Cyan
    Write-Host "1. Launch WebUI:" -ForegroundColor White
    Write-Host "   .\webui.bat`n" -ForegroundColor Gray
    
    Write-Host "2. Open browser to:" -ForegroundColor White
    Write-Host "   http://127.0.0.1:7860`n" -ForegroundColor Gray
    
    Write-Host "3. Select model:" -ForegroundColor White
    Write-Host "   - Click model dropdown" -ForegroundColor Gray
    Write-Host "   - Select: sd_xl_base_1.0.safetensors`n" -ForegroundColor Gray
    
    Write-Host "4. Add LoRA:" -ForegroundColor White
    Write-Host "   - Click 🎴 icon below prompt" -ForegroundColor Gray
    Write-Host "   - Click: pixel-art-xl" -ForegroundColor Gray
    Write-Host "   - Set weight: 1.0-1.2`n" -ForegroundColor Gray
    
    Write-Host "5. Generate pixel art:" -ForegroundColor White
    Write-Host "   - Start prompts with: pixel," -ForegroundColor Gray
    Write-Host "   - Example: pixel, a knight with sword, 16-bit style" -ForegroundColor Gray
    Write-Host "   - Add negative: 3d render, realistic, smooth`n" -ForegroundColor Gray
    
    Write-Host "See QUICKSTART_PIXEL_ART.md for detailed instructions!" -ForegroundColor Yellow
}

Write-Host "`n" + "="*60 -ForegroundColor Gray
Write-Host ""
