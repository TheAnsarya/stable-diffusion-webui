# AI Pixel Art Generation Guide for SNES Development

Complete guide for generating pixel art assets using AI for SNES-style game development.

## Overview

This guide covers using Stable Diffusion to generate pixel art suitable for SNES games. Two main approaches are available:

1. **Pixel Art XL LoRA** (Recommended) - High quality, requires SDXL base
2. **Pixel Art Style** - Standalone model, simpler setup

## Prerequisites

### Required Software
- [Stable Diffusion WebUI](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
- Python 3.10.6 or newer
- NVIDIA GPU with 6GB+ VRAM (recommended) or CPU (very slow)

### Optional Tools
- [Aseprite](https://www.aseprite.org/) - For palette reduction and sprite editing
- [GIMP](https://www.gimp.org/) - Free alternative for image editing
- SNES emulator (bsnes, Mesen-S) - For testing assets

## Installation

### 1. Install Stable Diffusion WebUI

```powershell
cd C:\Users\me\source\repos
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
cd stable-diffusion-webui
.\webui.bat
```

First run will download dependencies (this takes a while).

### 2. Install ControlNet Extension (Optional but Recommended)

```powershell
cd extensions
git clone https://github.com/Mikubill/sd-webui-controlnet.git
cd ..
```

Restart WebUI after installing extensions.

### 3. Download Models

#### Option A: Pixel Art XL LoRA (RECOMMENDED)

**Step 1: Download SDXL Base Model**
- Visit: <https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0>
- Click "Files and versions" tab
- Download: `sd_xl_base_1.0.safetensors` (6.94 GB)
- Place in: `stable-diffusion-webui/models/Stable-diffusion/`

**Step 2: Download Pixel Art XL LoRA**
- Visit: <https://huggingface.co/nerijs/pixel-art-xl>
- Click "Files and versions" tab
- Download: `pixel-art-xl.safetensors` (~100 MB)
- Place in: `stable-diffusion-webui/models/Lora/`

#### Option B: Pixel Art Style (Simpler Alternative)

- Visit: <https://huggingface.co/kohbanye/pixel-art-style>
- Click "Files and versions" tab
- Download model files
- Place in: `stable-diffusion-webui/models/Stable-diffusion/`

## Usage

### Starting the WebUI

```powershell
cd C:\Users\me\source\repos\stable-diffusion-webui
.\webui.bat
```

Open browser to: <http://127.0.0.1:7860>

### Using Pixel Art XL LoRA

1. **Select base model**: Click model dropdown → `sd_xl_base_1.0.safetensors`
2. **Add LoRA**: Click 🎴 icon below prompt box
3. **Select LoRA**: Find and click `pixel-art-xl`
4. **Set weight**: Adjust to 1.0-1.2 (default 1.0 is fine)
5. **Configure settings**:
   - **Sampling Steps**: 20-30
   - **Sampling Method**: DPM++ 2M Karras
   - **CFG Scale**: 7-9
   - **Width/Height**: 1024x1024 (SDXL native)

6. **Write prompt**: Always start with `pixel,`

Example:
```
Pixel, a brave knight character, sword and shield, 16-bit style, side view
```

Negative prompt:
```
3d render, realistic, smooth, blurry, photorealistic
```

7. **Generate**: Click "Generate"
8. **Downscale**: After generation, downscale 8x using nearest-neighbor to get crisp pixels

### Using Pixel Art Style Model

1. **Select model**: Click dropdown → `pixel-art-style`
2. **Configure settings**:
   - **Sampling Steps**: 20-30
   - **Sampling Method**: Euler a
   - **CFG Scale**: 7-9
   - **Width/Height**: 512x512

3. **Write prompt**: Add `pixelartstyle` token

Example:
```
a brave knight with sword and shield, pixelartstyle
```

4. **Generate**: Click "Generate"

## SNES Technical Specifications

### Color Limits
- **Palette size**: 256 colors total on screen
- **Per sprite**: 16 colors (including transparency)
- **Color depth**: 15-bit (32,768 possible colors)
- **Palettes**: 8 palettes of 16 colors each

### Sprite Sizes
- 8x8 pixels
- 16x16 pixels
- 32x32 pixels
- 64x64 pixels

### Common Formats
- `.chr` - Character/tile data
- `.bin` - Raw binary sprite data
- Indexed PNG - With palette information

## Workflow for SNES Assets

### 1. Generation
Generate your pixel art using one of the models above.

### 2. Downscaling
For Pixel Art XL (SDXL):
- Original: 1024x1024
- Downscale 8x: 128x128
- Method: **Nearest-neighbor only** (never bilinear/bicubic)

### 3. Palette Reduction

**Using Aseprite:**
1. Open image
2. Sprite → Color Mode → Indexed
3. Reduce to 16 colors
4. Adjust palette to SNES-appropriate colors
5. Export as indexed PNG

**Using GIMP:**
1. Image → Mode → Indexed
2. Generate optimum palette: 16 colors
3. Enable dithering if desired
4. Export as PNG

### 4. Resize to SNES Specs
- Resize to 8x8, 16x16, 32x32, or 64x64
- Use nearest-neighbor scaling
- Ensure pixel-perfect alignment

### 5. Testing
- Import into SNES development tools
- Test in emulator
- Verify palette constraints

## Prompt Engineering for SNES Style

### Essential Keywords (Pixel Art XL)
- `pixel,` - **REQUIRED** prefix
- `16-bit style`
- `retro game`
- `limited palette`
- `isometric` or `side view`
- `SNES`

### Negative Prompts
Always use these to avoid unwanted styles:
- `3d render`
- `realistic`
- `photorealistic`
- `smooth`
- `blurry`
- `antialiased`
- `gradient`
- `detailed textures`

### Example Prompts by Use Case

**Character Sprites:**
```
Pixel, fantasy hero warrior, sword and shield, 16-bit RPG style, front view, limited palette
Negative: 3d, realistic, smooth, detailed
```

**Enemy Sprites:**
```
Pixel, green slime monster, SNES RPG enemy, side view, retro game sprite
Negative: photorealistic, 3d render, blurry
```

**Items/Icons:**
```
Pixel, magical sword item icon, glowing blade, 16-bit style, simple
Negative: realistic, 3d, complex, detailed
```

**Backgrounds:**
```
Pixel, medieval castle interior, stone walls, torches, SNES background, isometric
Negative: 3d, photorealistic, modern graphics
```

**Tiles:**
```
Pixel, grass tile, seamless tileable, top-down view, SNES style
Negative: realistic, 3d, detailed texture
```

## Advanced Techniques

### Batch Generation
Generate multiple variations:
1. Set "Batch count" to 4-8
2. Use different seeds for variety
3. Use X/Y/Z plot script for systematic variations

### ControlNet Integration
For maintaining consistent style:
1. Generate base sprite
2. Use as ControlNet reference
3. Generate variations with same structure

### LCM for Speed (Advanced)
For faster generation with Pixel Art XL:
- Add LCM LoRA: `lcm-lora-sdxl`
- Reduce steps to 8
- Set CFG to 1.5
- LoRA weights: LCM=1.0, Pixel Art XL=1.2

## Common Issues & Solutions

### Blurry Output
- **Cause**: Wrong scaling method or antialiasing
- **Solution**: Use nearest-neighbor scaling only

### Too Many Colors
- **Cause**: AI generates high-color images
- **Solution**: Post-process with palette reduction (see Workflow)

### Not Pixel Art Style
- **Cause**: Missing keywords or wrong negative prompts
- **Solution**: Add `pixel,` prefix and comprehensive negative prompts

### Out of Memory
- **Cause**: Insufficient VRAM
- **Solutions**:
  - Launch with `--medvram` or `--lowvram`
  - Reduce batch size
  - Lower resolution
  - Use Pixel Art Style instead of SDXL

### Model Not Appearing
- **Cause**: Wrong directory
- **Solution**: 
  - Base models → `models/Stable-diffusion/`
  - LoRAs → `models/Lora/`
  - Refresh model list (🔄 button)

## File Structure

```
stable-diffusion-webui/
├── models/
│   ├── Stable-diffusion/
│   │   └── sd_xl_base_1.0.safetensors
│   └── Lora/
│       └── pixel-art-xl.safetensors
├── extensions/
│   └── sd-webui-controlnet/
├── outputs/
│   └── txt2img-images/
└── webui.bat
```

## Resources

### Model Downloads
- [Pixel Art XL LoRA](https://huggingface.co/nerijs/pixel-art-xl)
- [SDXL Base](https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0)
- [Pixel Art Style](https://huggingface.co/kohbanye/pixel-art-style)
- [ControlNet Extension](https://github.com/Mikubill/sd-webui-controlnet)

### Tools
- [Aseprite](https://www.aseprite.org/) - Pixel art editor ($19.99 or compile free)
- [GIMP](https://www.gimp.org/) - Free image editor
- [bsnes](https://github.com/bsnes-emu/bsnes) - Accurate SNES emulator

### Learning Resources
- [SNES Development Wiki](https://wiki.superfamicom.org/)
- [Pixel Art Tutorial](https://blog.studiominiboss.com/pixelart)
- Stable Diffusion Prompt Guide: Search for "Stable Diffusion prompt engineering"

## Cost Breakdown

### Local (Recommended for SNES Dev)
- **Hardware**: NVIDIA GPU (one-time, $300-1000+)
- **Software**: Free (Stable Diffusion WebUI)
- **Models**: Free (HuggingFace)
- **Generation**: Free (unlimited)

### Cloud Options
- **Google Colab**: Free tier or $10/month Pro
- **RunPod**: ~$0.20-0.50/hour GPU time
- **Vast.ai**: ~$0.15-0.40/hour GPU time

## Quick Reference

| Task | Model | Resolution | Steps | CFG | Sampler |
|------|-------|------------|-------|-----|---------|
| Character sprite | Pixel Art XL | 1024x1024 | 25 | 8 | DPM++ 2M Karras |
| Small icon | Pixel Art XL | 1024x1024 | 20 | 7 | Euler a |
| Background | Pixel Art XL | 1024x1024 | 30 | 9 | DPM++ 2M Karras |
| Quick test | Pixel Art Style | 512x512 | 20 | 7 | Euler a |

## Next Steps

1. ✅ Install Stable Diffusion WebUI
2. ✅ Download models (Pixel Art XL + SDXL base)
3. ✅ Generate test images
4. ✅ Set up Aseprite for palette reduction
5. ✅ Create SNES-compliant sprites
6. ✅ Integrate into your game project

---

**Good luck with your SNES development! 🎮✨**

For questions or issues, check the [Stable Diffusion WebUI GitHub](https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues).
