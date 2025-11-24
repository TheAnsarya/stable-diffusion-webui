# Pixel Art Batch Generator
# Quickly generate multiple SNES-style sprites with variations

# CONFIGURATION
$outputDir = "outputs\pixel-art\batch"
$model = "pixel-art-diffusion-hard-16"  # Change to your model name
$configFile = "configs\pixel-art-16x16.yaml"

# Sprite prompts for SNES game
$prompts = @(
    "16-bit SNES pixel art, hero character, knight with sword, 16x16 sprite, limited palette",
    "Super Nintendo pixel art, enemy slime monster, 16x16 sprite, green, 16 colors",
    "SNES pixel art, treasure chest, closed, 16x16 sprite, wooden, metal lock",
    "16-bit pixel art, health potion, red bottle, 16x16 sprite, glowing",
    "Super Nintendo style, magic scroll, 16x16 sprite, parchment, glowing runes",
    "SNES pixel art, gold coin, spinning, 16x16 sprite, shiny"
)

# Generation settings
$steps = 20
$sampler = "Euler a"
$cfg = 7
$width = 256
$height = 256
$batchSize = 4
$negativePrompt = "blurry, smooth, antialiased, gradient, photorealistic, 3d, modern"

# Create output directory
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

Write-Host "=== SNES Pixel Art Batch Generator ===" -ForegroundColor Cyan
Write-Host "Output Directory: $outputDir" -ForegroundColor Yellow
Write-Host "Generating $($prompts.Count) sprite types with $batchSize variations each" -ForegroundColor Yellow
Write-Host ""

# Note: This is a template script
# Actual API integration requires the WebUI to be running with API enabled
Write-Host "NOTE: To use this script, you need to:" -ForegroundColor Green
Write-Host "1. Start WebUI with API enabled: .\webui.bat --api" -ForegroundColor White
Write-Host "2. Install required module: Install-Module -Name PowerShellForGitHub" -ForegroundColor White
Write-Host "3. Or use the WebUI's built-in batch generation features" -ForegroundColor White
Write-Host ""

# Display what would be generated
$i = 1
foreach ($prompt in $prompts) {
    Write-Host "[$i/$($prompts.Count)] $prompt" -ForegroundColor Cyan
    Write-Host "  -> Output: $outputDir\sprite-$i-*.png" -ForegroundColor Gray
    $i++
}

Write-Host ""
Write-Host "Recommended workflow:" -ForegroundColor Yellow
Write-Host "1. Use WebUI's txt2img tab with these prompts" -ForegroundColor White
Write-Host "2. Enable 'Batch count' = $batchSize for variations" -ForegroundColor White
Write-Host "3. Use X/Y/Z Plot script for systematic variations" -ForegroundColor White
Write-Host "4. Post-process in Aseprite to reduce to exact SNES palette" -ForegroundColor White

# Save prompts to file for easy copy-paste
$promptFile = Join-Path $outputDir "prompts.txt"
$prompts | Out-File -FilePath $promptFile -Encoding UTF8
Write-Host ""
Write-Host "Prompts saved to: $promptFile" -ForegroundColor Green
Write-Host "Settings: Steps=$steps, Sampler=$sampler, CFG=$cfg, Size=${width}x${height}" -ForegroundColor Green
