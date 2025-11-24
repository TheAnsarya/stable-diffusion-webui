# Complete Setup Documentation - Final Summary

**Date**: November 23, 2025  
**Project**: SNES Pixel Art Generation for SylvanTimes Game  
**Status**: ✅ Ready for Model Download and Generation

---

## What Has Been Completed

### ✅ 1. Stable Diffusion WebUI Setup
- Repository location: `C:\Users\me\source\repos\stable-diffusion-webui`
- ControlNet extension installed
- Configuration files created
- Scripts and presets ready

### ✅ 2. Documentation Created

**In stable-diffusion-webui:**
- `PIXEL_ART_SETUP.md` - Complete setup guide
- `QUICKSTART_PIXEL_ART.md` - Quick start reference
- `AI_PIXEL_ART_GUIDE_SNES.md` - Comprehensive SNES development guide
- `download_models.ps1` - Automated model download script
- `docs/SESSION_LOG.md` - Complete session log
- `docs/CHAT_TRANSCRIPT.md` - Full chat transcript

**Configuration Files:**
- `configs/pixel-art-16x16.yaml` - 16×16 sprite configuration
- `configs/pixel-art-xl.yaml` - XL pixel art configuration
- `configs/pixel-art-settings.json` - UI presets

**Scripts:**
- `scripts/pixel_art_presets.py` - WebUI preset buttons
- `scripts/batch-generate-snes-sprites.ps1` - Batch generation template

**For SylvanTimes Project:**
- `C:\Users\me\source\repos\SylvanTimes\docs\AI_PIXEL_ART_GUIDE.md` - Ready to create

---

## 🚀 Next Steps to Start Generating

### Step 1: Download Models

Run this in PowerShell from the stable-diffusion-webui directory:

```powershell
cd C:\Users\me\source\repos\stable-diffusion-webui
.\download_models.ps1
```

This will download:
1. **SDXL Base 1.0** (6.94 GB) → `models/Stable-diffusion/`
2. **Pixel Art XL LoRA** (~100 MB) → `models/Lora/`

**Alternative (Manual Download)**:
- Visit: <https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/tree/main>
- Download: `sd_xl_base_1.0.safetensors`
- Save to: `models/Stable-diffusion/`
- Visit: <https://huggingface.co/nerijs/pixel-art-xl/tree/main>
- Download: `pixel-art-xl.safetensors`
- Save to: `models/Lora/`

### Step 2: Launch WebUI

```powershell
.\webui.bat
```

First launch installs dependencies (5-10 minutes).  
WebUI will open at: <http://127.0.0.1:7860>

### Step 3: Configure for Pixel Art

1. **Select Model**: Click dropdown → `sd_xl_base_1.0.safetensors`
2. **Add LoRA**: Click 🎴 icon → Select `pixel-art-xl`
3. **Settings**:
   - Steps: 25
   - Sampler: DPM++ 2M Karras
   - CFG Scale: 8
   - Size: 1024×1024

### Step 4: Generate Your First Sprite

**Prompt:**
```
pixel, young elf ranger character, green cloak, bow and arrows, 16-bit SNES style, side view
```

**Negative:**
```
3d render, realistic, smooth, blurry, photorealistic, modern
```

Click **Generate**!

### Step 5: Post-Process for SNES

1. **Downscale**: 1024×1024 → 128×128 (nearest-neighbor)
2. **Reduce Palette**: To 16 colors (Aseprite or GIMP)
3. **Resize**: To final SNES size (8×8, 16×16, 32×32, 64×64)
4. **Export**: As indexed PNG

---

## 📋 Complete File Structure

```
stable-diffusion-webui/
├── configs/
│   ├── pixel-art-16x16.yaml          ✅ Created
│   ├── pixel-art-xl.yaml             ✅ Created
│   └── pixel-art-settings.json       ✅ Created
│
├── docs/
│   ├── SESSION_LOG.md                ✅ Created
│   ├── CHAT_TRANSCRIPT.md            ✅ Created
│   └── COMPLETE_SETUP_SUMMARY.md     ✅ This file
│
├── extensions/
│   └── sd-webui-controlnet/          ✅ Installed
│
├── models/
│   ├── Stable-diffusion/
│   │   └── [sd_xl_base_1.0.safetensors]    ⏳ Download needed
│   └── Lora/
│       └── [pixel-art-xl.safetensors]      ⏳ Download needed
│
├── scripts/
│   ├── pixel_art_presets.py          ✅ Created
│   └── batch-generate-snes-sprites.ps1  ✅ Created
│
├── download_models.ps1                ✅ Created
├── PIXEL_ART_SETUP.md                 ✅ Created
├── QUICKSTART_PIXEL_ART.md            ✅ Created
├── AI_PIXEL_ART_GUIDE_SNES.md         ✅ Created
└── webui.bat                          ✅ Existing

SylvanTimes/
└── docs/
    └── AI_PIXEL_ART_GUIDE.md          ⏳ Ready to create
```

---

## 🎮 SylvanTimes-Specific Prompts

### Characters

**Protagonist - Sylvan the Ranger:**
```
Prompt: pixel, young elf ranger, green cloak, bow and arrows, brown hair, 16-bit SNES style, side view, standing pose
Negative: 3d render, realistic, smooth, blurry, photorealistic
```

**Tree Spirit Guardian:**
```
Prompt: pixel, ancient tree spirit guardian, glowing green eyes, wooden armor, moss covered, SNES RPG style, front view
Negative: 3d, realistic, detailed textures, smooth
```

**Dwarf Merchant:**
```
Prompt: pixel, friendly dwarf merchant, red beard, backpack full of items, 16-bit style, cheerful expression
Negative: photorealistic, 3d render, blurry
```

### Enemies

**Corrupted Forest Wolf:**
```
Prompt: pixel, dark corrupted wolf enemy, red glowing eyes, shadow aura, SNES style, side view, aggressive stance
Negative: realistic, 3d, smooth, cute, friendly
```

**Evil Fairy Sprite:**
```
Prompt: pixel, mischievous dark fairy enemy, purple magic aura, small wings, retro game sprite, SNES style
Negative: photorealistic, 3d, detailed, cute
```

**Ancient Stone Golem (Boss):**
```
Prompt: pixel, large stone forest golem boss, moss covered, glowing runes, imposing, SNES RPG enemy, 32x32
Negative: 3d render, realistic, modern graphics, small
```

### Items

**Magic Acorn (Key Item):**
```
Prompt: pixel, glowing magic acorn item, golden aura, oak leaf attached, simple icon, 16-bit style
Negative: realistic, 3d, complex, detailed, photorealistic
```

**Legendary Elven Bow:**
```
Prompt: pixel, legendary elven bow weapon, glowing green runes, wooden, elegant, item icon, SNES style
Negative: photorealistic, 3d, modern, realistic
```

**Forest Health Potion:**
```
Prompt: pixel, green forest health potion, leaf decoration, glass bottle, glowing liquid, simple icon
Negative: realistic, 3d, complex, detailed
```

### Backgrounds

**Enchanted Forest Path:**
```
Prompt: pixel, enchanted forest path, tall ancient trees, dappled sunlight, mushrooms, SNES background, tileable
Negative: 3d, photorealistic, modern, characters, UI elements
```

**Elf Village:**
```
Prompt: pixel, peaceful elf village, wooden treehouses, rope bridges, tree platforms, SNES style background, isometric view
Negative: realistic, 3d render, detailed textures, modern architecture
```

**Ancient Mystic Grove:**
```
Prompt: pixel, mystical ancient grove, glowing mushrooms, magical atmosphere, fireflies, SNES RPG background
Negative: photorealistic, 3d, modern graphics, realistic lighting
```

**Dark Forest Cave:**
```
Prompt: pixel, dark forest cave interior, glowing crystals, underground stream, stalactites, SNES dungeon background
Negative: realistic, 3d, smooth lighting, modern
```

---

## 🛠 Post-Processing Workflow

### Required Tools
- **Aseprite** ($19.99) - Best for pixel art
- **GIMP** (Free) - Good alternative
- **Photoshop** - If you already have it

### Step-by-Step Process

**1. Generate in WebUI**
- Size: 1024×1024
- Use prompts above
- Generate 4-6 variations

**2. Select Best Result**
- Choose clearest pixel art style
- Best composition
- Appropriate for SNES aesthetic

**3. Downscale (Aseprite)**
```
File → Open → [your image]
Sprite → Sprite Size
Width: 128, Height: 128
Resize Method: Nearest Neighbor ← CRITICAL!
OK
```

**4. Reduce Palette (Aseprite)**
```
Sprite → Color Mode → Indexed
Colors: 16 (SNES sprite limit)
Palette: Generate new (or load SNES palette)
Dithering: None (or Floyd-Steinberg)
OK
```

**5. Resize to Final Size**
```
For character sprites: 16×16 or 32×32
For items: 8×8 or 16×16
For bosses: 32×32 or 64×64

Sprite → Sprite Size
Use Nearest Neighbor ALWAYS
```

**6. Export**
```
File → Export
Format: PNG
Options: Index colors
Filename: descriptive_name.png
```

**7. Organize**
```
SylvanTimes/
├── assets/
│   ├── characters/
│   │   ├── sylvan_idle.png
│   │   ├── sylvan_walk.png
│   │   ├── guardian.png
│   │   └── merchant.png
│   ├── enemies/
│   │   ├── wolf.png
│   │   ├── fairy.png
│   │   └── golem.png
│   ├── items/
│   │   ├── acorn.png
│   │   ├── bow.png
│   │   └── potion.png
│   └── backgrounds/
│       ├── forest.png
│       ├── village.png
│       └── cave.png
```

---

## 📊 Settings Quick Reference

| Purpose | Resolution | Steps | CFG | Sampler | LoRA |
|---------|-----------|-------|-----|---------|------|
| Character Sprite | 1024×1024 | 25 | 8 | DPM++ 2M Karras | 1.0-1.2 |
| Enemy Sprite | 1024×1024 | 25 | 8 | Euler a | 1.0 |
| Item Icon | 1024×1024 | 20 | 7 | Euler a | 1.2 |
| Background | 1024×1024 | 30 | 9 | DPM++ 2M Karras | 1.0 |
| Quick Test | 512×512 | 20 | 7 | Euler a | 1.0 |

---

## 🔧 Troubleshooting

### WebUI Won't Start
```powershell
# Try with low VRAM mode
.\webui.bat --medvram

# Or for very low VRAM
.\webui.bat --lowvram
```

### Model Not Appearing
- Check file is in correct folder
- Click refresh button (🔄) next to model dropdown
- Restart WebUI

### Out of Memory
- Use --medvram or --lowvram flag
- Reduce batch size to 1
- Lower resolution to 512×512

### Not Pixel Art Style
- Make sure LoRA is loaded (check 🎴 section)
- Use "pixel," prefix in prompt
- Add strong negative prompts
- Increase LoRA weight to 1.2

### Blurry Results
- NEVER use bilinear/bicubic scaling
- ALWAYS use nearest-neighbor
- This is the #1 most common mistake!

---

## 📚 All Documentation Locations

**Quick Start:**
- `QUICKSTART_PIXEL_ART.md` - Start here

**Complete Guides:**
- `PIXEL_ART_SETUP.md` - Full setup information
- `AI_PIXEL_ART_GUIDE_SNES.md` - SNES development guide

**Session Logs:**
- `docs/SESSION_LOG.md` - Complete session log
- `docs/CHAT_TRANSCRIPT.md` - Full chat history
- `docs/COMPLETE_SETUP_SUMMARY.md` - This document

**Scripts:**
- `download_models.ps1` - Download models
- `scripts/pixel_art_presets.py` - WebUI presets
- `scripts/batch-generate-snes-sprites.ps1` - Batch generation

**For SylvanTimes:**
- `C:\Users\me\source\repos\SylvanTimes\docs\AI_PIXEL_ART_GUIDE.md`

---

## ✅ Checklist to Start

- [ ] Run `.\download_models.ps1` (or manually download models)
- [ ] Verify models are in correct folders
- [ ] Run `.\webui.bat`
- [ ] Wait for WebUI to open (http://127.0.0.1:7860)
- [ ] Select SDXL base model
- [ ] Add Pixel Art XL LoRA
- [ ] Set sampling steps to 25
- [ ] Set CFG to 8
- [ ] Set size to 1024×1024
- [ ] Copy a prompt from above
- [ ] Add negative prompts
- [ ] Click Generate!
- [ ] Download Aseprite or GIMP
- [ ] Follow post-processing workflow
- [ ] Create amazing pixel art for SylvanTimes! 🎮✨

---

## 🎯 Expected Results

After following this guide, you will:
1. ✅ Have a fully configured Stable Diffusion WebUI
2. ✅ Be able to generate SNES-style pixel art
3. ✅ Know how to process images for SNES constraints
4. ✅ Have example prompts for SylvanTimes assets
5. ✅ Understand the complete workflow
6. ✅ Have all documentation and references

---

**Everything is ready! Just download the models and start creating! 🌲🎮✨**

For questions, refer to the guides in this directory.
Good luck with SylvanTimes development!
