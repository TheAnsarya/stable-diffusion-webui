# Stable Diffusion WebUI - Pixel Art Setup Session Log

**Date**: November 23, 2025  
**Project**: SNES Pixel Art Generation Setup  
**Repository**: stable-diffusion-webui (AUTOMATIC1111)

## Session Overview

This session configured Stable Diffusion WebUI for SNES-style pixel art generation, including ControlNet extension installation, model configuration, and documentation creation.

---

## Commands Executed

### 1. Extension Installation

**Command**: Clone ControlNet Extension
```powershell
cd extensions
git clone https://github.com/Mikubill/sd-webui-controlnet.git
```

**Output**:
```
Cloning into 'sd-webui-controlnet'...
remote: Enumerating objects: 9979, done.
remote: Counting objects: 100% (724/724), done.
remote: Compressing objects: 100% (99/99), done.
remote: Total 9979 (delta 669), reused 625 (delta 625), pack-reused 9255 (from 2)
Receiving objects: 100% (9979/9979), 18.11 MiB | 3.94 MiB/s, done.
Resolving deltas: 100% (5980/5980), done.
```

**Status**: ✅ Success  
**Location**: `extensions/sd-webui-controlnet/`

---

### 2. WebUI Launch

**Command**: Launch Stable Diffusion WebUI
```powershell
.\webui.bat
```

**Working Directory**: `C:\Users\me\source\repos\stable-diffusion-webui`  
**Status**: ✅ Success (Exit Code: 0)

---

## Files Created

### Configuration Files

#### 1. `configs/pixel-art-16x16.yaml`
**Purpose**: Optimized configuration for 16x16 pixel art generation  
**Key Settings**:
- Image size: 16x16
- Optimized for retro SNES sprites
- Attention resolutions: [4, 2, 1]

#### 2. `configs/pixel-art-xl.yaml`
**Purpose**: Configuration for higher resolution pixel art  
**Key Settings**:
- Image size: 128
- Higher resolution for detailed pixel art
- SDXL-compatible parameters

#### 3. `configs/pixel-art-settings.json`
**Purpose**: UI settings preset for pixel art generation  
**Key Settings**:
- Output directory: `outputs/pixel-art`
- Upscaler: Nearest (no antialiasing)
- CLIP layers: 2
- Organized output structure

---

### Documentation Files

#### 1. `PIXEL_ART_SETUP.md`
**Purpose**: Complete setup guide for pixel art generation  
**Sections**:
- Model recommendations and download links
- Configuration file descriptions
- SNES development workflow
- Prompt engineering tips
- ControlNet integration
- Troubleshooting guide

#### 2. `QUICKSTART_PIXEL_ART.md`
**Purpose**: Quick reference guide for getting started  
**Sections**:
- What was set up
- Model download instructions
- WebUI launch commands
- Example prompts
- SNES color limits
- Troubleshooting

#### 3. `AI_PIXEL_ART_GUIDE_SNES.md`
**Purpose**: Comprehensive guide for SNES game development  
**Sections**:
- Installation walkthrough
- Model download and placement
- Usage instructions for both LoRA and standalone models
- SNES technical specifications
- Complete workflow from generation to SNES-compliant sprites
- Prompt engineering guide
- Advanced techniques
- Cost breakdown

---

### Script Files

#### 1. `scripts/pixel_art_presets.py`
**Purpose**: Adds quick preset buttons to WebUI  
**Features**:
- 16x16 sprite preset
- 32x32 character preset
- Background/tile preset
- Pixel Art XL preset
- Pre-configured settings for each type

**Presets Included**:
```python
- 16x16 Sprite: 256x256, Euler a, CFG 7, 20 steps
- 32x32 Character: 512x512, Euler a, CFG 7.5, 25 steps
- Background/Tile: 512x512, DPM++ 2M Karras, CFG 8, 30 steps
- Pixel Art XL: 768x768, DPM++ 2M Karras, CFG 8.5, 30 steps
```

#### 2. `scripts/batch-generate-snes-sprites.ps1`
**Purpose**: PowerShell script for batch sprite generation  
**Features**:
- Template prompts for common SNES sprites
- Batch configuration
- Output organization
- Usage instructions

**Example Prompts Included**:
1. Hero character (knight with sword)
2. Enemy slime monster
3. Treasure chest
4. Health potion
5. Magic scroll
6. Gold coin

---

## Models Recommended

### Primary Model: Pixel Art XL (LoRA)

**Source**: <https://huggingface.co/nerijs/pixel-art-xl>  
**Type**: LoRA adapter  
**Size**: ~100 MB  
**Placement**: `models/Lora/pixel-art-xl.safetensors`

**Requirements**:
- Base Model: SDXL 1.0
- Source: <https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0>
- File: `sd_xl_base_1.0.safetensors` (6.94 GB)
- Placement: `models/Stable-diffusion/`

**Usage**:
- Select SDXL base model
- Add LoRA via 🎴 button
- Set weight: 1.0-1.2
- Prefix prompts with `pixel,`

**Recommended Settings**:
- Steps: 20-30
- CFG Scale: 7-9
- Sampler: DPM++ 2M Karras or Euler a
- Resolution: 1024x1024
- Downscale: 8x with nearest-neighbor

---

### Alternative Model: Pixel Art Style

**Source**: <https://huggingface.co/kohbanye/pixel-art-style>  
**Type**: Standalone fine-tuned model  
**Placement**: `models/Stable-diffusion/`

**Usage**:
- Select model from dropdown
- Add `pixelartstyle` token to prompts

**Recommended Settings**:
- Steps: 20-30
- CFG Scale: 7-9
- Sampler: Euler a
- Resolution: 512x512

---

## Project Structure

```
stable-diffusion-webui/
├── configs/
│   ├── pixel-art-16x16.yaml          [NEW - 16x16 config]
│   ├── pixel-art-xl.yaml             [NEW - XL config]
│   └── pixel-art-settings.json       [NEW - UI settings]
│
├── docs/                              [NEW - Documentation]
│   └── SESSION_LOG.md                [This file]
│
├── extensions/
│   └── sd-webui-controlnet/          [NEW - Installed]
│       ├── models/                   [ControlNet models go here]
│       ├── scripts/
│       └── [extension files]
│
├── models/
│   ├── Stable-diffusion/
│   │   └── [Place: sd_xl_base_1.0.safetensors]
│   └── Lora/
│       └── [Place: pixel-art-xl.safetensors]
│
├── scripts/
│   ├── pixel_art_presets.py          [NEW - Preset buttons]
│   └── batch-generate-snes-sprites.ps1  [NEW - Batch script]
│
├── PIXEL_ART_SETUP.md                [NEW - Main guide]
├── QUICKSTART_PIXEL_ART.md           [NEW - Quick start]
├── AI_PIXEL_ART_GUIDE_SNES.md        [NEW - Comprehensive guide]
├── webui.bat                         [WebUI launcher]
└── [other WebUI files]
```

---

## SNES Technical Specifications

### Color Constraints
- **Total colors on screen**: 256
- **Colors per sprite**: 16 (including transparency)
- **Color depth**: 15-bit (32,768 possible colors)
- **Palettes**: 8 palettes × 16 colors each

### Sprite Sizes
- 8×8 pixels
- 16×16 pixels
- 32×32 pixels
- 64×64 pixels

### Common File Formats
- `.chr` - Character/tile data
- `.bin` - Raw binary sprite data
- Indexed PNG - With palette information

---

## Prompt Engineering Guide

### For Pixel Art XL LoRA

**Required Prefix**: `pixel,`

**Good Keywords**:
- `pixel,` (REQUIRED)
- `16-bit style`
- `retro game`
- `limited palette`
- `isometric` / `side view`
- `SNES`

**Negative Prompts** (Always use):
```
3d render, realistic, photorealistic, smooth, blurry, antialiased, gradient
```

### Example Prompts

**Character Sprite**:
```
Prompt: Pixel, fantasy hero warrior, sword and shield, 16-bit style, side view
Negative: 3d render, realistic, smooth, blurry
Settings: 1024x1024, 25 steps, CFG 8, DPM++ 2M Karras
```

**Enemy Sprite**:
```
Prompt: Pixel, green slime monster, SNES RPG enemy, side view, retro game
Negative: photorealistic, 3d, detailed
Settings: 1024x1024, 20 steps, CFG 7, Euler a
```

**Background**:
```
Prompt: Pixel, medieval castle interior, stone walls, torches, isometric
Negative: 3d, modern graphics, realistic
Settings: 1024x1024, 30 steps, CFG 9, DPM++ 2M Karras
```

**Item/Icon**:
```
Prompt: Pixel, magical sword icon, glowing blade, simple, 16-bit
Negative: realistic, 3d, complex, detailed
Settings: 1024x1024, 20 steps, CFG 7, Euler a
```

---

## Workflow: Generation to SNES Asset

### Step 1: Generate
1. Launch WebUI: `.\webui.bat`
2. Open browser: <http://127.0.0.1:7860>
3. Select SDXL base model
4. Add Pixel Art XL LoRA (weight 1.0-1.2)
5. Write prompt with `pixel,` prefix
6. Add negative prompts
7. Set resolution: 1024×1024
8. Generate

### Step 2: Downscale
1. Take 1024×1024 output
2. Downscale 8× → 128×128
3. **CRITICAL**: Use nearest-neighbor only
4. Never use bilinear/bicubic (causes blur)

### Step 3: Palette Reduction

**Using Aseprite**:
1. Open image
2. Sprite → Color Mode → Indexed
3. Reduce to 16 colors
4. Adjust to SNES-appropriate colors
5. Export as indexed PNG

**Using GIMP**:
1. Image → Mode → Indexed
2. Generate optimum palette: 16 colors
3. Enable dithering if desired
4. Export as PNG

### Step 4: Resize to SNES Specs
1. Resize to 8×8, 16×16, 32×32, or 64×64
2. Use nearest-neighbor scaling
3. Ensure pixel-perfect alignment

### Step 5: Test
1. Import into SNES development tools
2. Test in emulator (bsnes, Mesen-S)
3. Verify palette constraints
4. Check sprite display

---

## Advanced Techniques

### Batch Generation
- Set "Batch count" to 4-8 for variations
- Use X/Y/Z plot for systematic tests
- Generate multiple seeds

### ControlNet Integration
1. Generate base sprite
2. Use as ControlNet reference
3. Generate variations maintaining structure
4. Download ControlNet models:
   - `control_v11p_sd15_lineart`
   - `control_v11f1p_sd15_depth`
   - Place in: `extensions/sd-webui-controlnet/models/`

### LCM for Speed
For faster generation (8 steps instead of 25):
1. Download LCM LoRA: `lcm-lora-sdxl`
2. Add both LoRAs:
   - LCM weight: 1.0
   - Pixel Art XL weight: 1.2
3. Use 8 steps, CFG 1.5

---

## Troubleshooting

### Issue: Models Not Appearing
**Solution**:
- Check file placement:
  - Base models → `models/Stable-diffusion/`
  - LoRAs → `models/Lora/`
- Click refresh button (🔄)
- Restart WebUI

### Issue: ControlNet Not Showing
**Solution**:
- Verify: `extensions/sd-webui-controlnet/` exists
- Restart WebUI after installation
- Check console for errors

### Issue: Out of Memory
**Solution**:
- Launch with flags: `.\webui.bat --medvram`
- Or: `.\webui.bat --lowvram`
- Reduce batch size
- Lower resolution

### Issue: Blurry Output
**Solution**:
- Use nearest-neighbor scaling only
- Never use bilinear/bicubic
- Check downscaling settings

### Issue: Too Many Colors
**Solution**:
- AI generates high-color images naturally
- Post-process with palette reduction
- Use Aseprite or GIMP (see Workflow)

---

## Next Steps

### Immediate Actions:
1. ✅ ControlNet extension installed
2. ✅ Configuration files created
3. ✅ Documentation written
4. ⏳ Download SDXL base model (6.94 GB)
5. ⏳ Download Pixel Art XL LoRA (~100 MB)
6. ⏳ Generate test images
7. ⏳ Create example sprites for documentation

### Model Download Commands:

**Using wget (if installed)**:
```powershell
# SDXL Base (6.94 GB)
wget https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors -O models/Stable-diffusion/sd_xl_base_1.0.safetensors

# Pixel Art XL LoRA
wget https://huggingface.co/nerijs/pixel-art-xl/resolve/main/pixel-art-xl.safetensors -O models/Lora/pixel-art-xl.safetensors
```

**Manual Download**:
1. Visit HuggingFace links above
2. Click "Files and versions"
3. Download files
4. Place in correct directories

---

## Resources Created

### Documentation
- `PIXEL_ART_SETUP.md` - Complete setup guide
- `QUICKSTART_PIXEL_ART.md` - Quick reference
- `AI_PIXEL_ART_GUIDE_SNES.md` - Comprehensive SNES guide
- `docs/SESSION_LOG.md` - This session log

### Configuration
- `configs/pixel-art-16x16.yaml` - 16×16 sprite config
- `configs/pixel-art-xl.yaml` - XL pixel art config
- `configs/pixel-art-settings.json` - UI settings

### Scripts
- `scripts/pixel_art_presets.py` - Preset buttons
- `scripts/batch-generate-snes-sprites.ps1` - Batch generator

---

## External Resources

### Model Downloads
- [Pixel Art XL LoRA](https://huggingface.co/nerijs/pixel-art-xl)
- [SDXL Base 1.0](https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0)
- [Pixel Art Style](https://huggingface.co/kohbanye/pixel-art-style)

### Extensions
- [ControlNet](https://github.com/Mikubill/sd-webui-controlnet)

### Tools
- [Aseprite](https://www.aseprite.org/) - Pixel art editor ($19.99)
- [GIMP](https://www.gimp.org/) - Free image editor
- [bsnes](https://github.com/bsnes-emu/bsnes) - SNES emulator

### Learning
- [SNES Dev Wiki](https://wiki.superfamicom.org/)
- [Pixel Art Tutorial](https://blog.studiominiboss.com/pixelart)

---

## Cost Analysis

### Local Setup (Recommended)
- **Hardware**: NVIDIA GPU 6GB+ VRAM (one-time cost)
- **Software**: Free (all open source)
- **Models**: Free (HuggingFace)
- **Generation**: Unlimited free

### Cloud Options
- **Google Colab**: Free tier or $10/month Pro
- **RunPod**: ~$0.20-0.50/hour
- **Vast.ai**: ~$0.15-0.40/hour

---

## Session Summary

**Total Files Created**: 7 (3 docs, 3 configs, 1 script)  
**Extensions Installed**: 1 (ControlNet)  
**Commands Executed**: 3  
**Status**: ✅ Setup Complete - Ready for model download and generation

**Next Session Goals**:
1. Download models
2. Generate example sprites
3. Create visual documentation with embedded images
4. Test SNES workflow end-to-end

---

**Session End**: November 23, 2025  
**Duration**: Setup and documentation phase  
**Status**: ✅ Configuration Complete

