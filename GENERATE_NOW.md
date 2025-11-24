# 🎯 READY TO GENERATE - All Models Installed!

**✅ YOU HAVE ALL MODELS!** No downloads needed!

**Location**: `C:\Users\me\source\repos\stable-diffusion-webui\models\Stable-diffusion\`

---

## 🚀 START NOW (Copy-Paste These Commands)

```powershell
cd C:\Users\me\source\repos\stable-diffusion-webui
$env:COMMANDLINE_ARGS = "--skip-python-version-check --skip-torch-cuda-test --no-half"
.\webui.bat
```

**Browser will open at**: <http://127.0.0.1:7860>

> **Note**: Using Python 3.14 with CPU-only torch. For better performance, consider using Python 3.10 with CUDA support.

---

## 📦 Your Installed Models

✅ **pixel-art-xl.safetensors** (BEST FOR SNES)  
✅ **pixel-art-style.ckpt** (FAST & SIMPLE)  
✅ **sd_xl_base_1.0.safetensors** (BASE MODEL)

---

## 🎮 INSTANT SNES SPRITE (Copy This Exactly)

### Step 1: Select Model
In WebUI, click dropdown → Select: **`pixel-art-xl.safetensors`**

### Step 2: Copy This Prompt
```
pixel, SNES style hero warrior, green tunic, sword and shield, 16-bit Super Nintendo sprite, side view
```

### Step 3: Copy Negative Prompt
```
3d render, realistic, photorealistic, smooth, blurry, modern graphics
```

### Step 4: Settings
- **Sampling Steps**: 25
- **Sampling Method**: DPM++ 2M Karras
- **CFG Scale**: 8
- **Width**: 1024
- **Height**: 1024

### Step 5: CLICK GENERATE!

---

## 🌲 SylvanTimes Game - Ready-to-Use Prompts

### Main Hero (Sylvan)
```
PROMPT:
pixel, young elf ranger hero, green forest cloak, brown braided hair, bow and arrows, leather armor, SNES RPG character, 16-bit sprite, side view

NEGATIVE:
3d render, realistic, smooth, blonde hair, metal armor, modern

SETTINGS:
Model: pixel-art-xl.safetensors
Size: 1024×1024
Steps: 25
CFG: 8
```

### Shadow Wolf Enemy
```
PROMPT:
pixel, corrupted shadow wolf enemy, black fur, red glowing eyes, dark aura, aggressive, SNES enemy sprite, 16-bit, side view

NEGATIVE:
cute, friendly, realistic, 3d, brown wolf, normal

SETTINGS:
Model: pixel-art-xl.safetensors
Size: 512×512
Steps: 20
CFG: 7
```

### Magic Acorn (Key Item)
```
PROMPT:
pixel, glowing golden acorn, magical aura, oak leaf, shimmering, SNES item icon, 16-bit, simple

NEGATIVE:
realistic, 3d, brown, complex, detailed

SETTINGS:
Model: pixel-art-xl.safetensors
Size: 512×512
Steps: 20
CFG: 7
```

### Enchanted Forest Background
```
PROMPT:
pixel, magical enchanted forest, ancient trees, glowing mushrooms, fireflies, forest path, SNES background, Super Nintendo style, 256 colors

NEGATIVE:
3d, realistic, modern, desert, characters, UI elements

SETTINGS:
Model: pixel-art-xl.safetensors
Size: 1024×1024
Steps: 30
CFG: 9
```

---

## 📐 After Generating: Make it SNES-Ready

### Tools Needed
- **Aseprite** ($19.99) - <https://www.aseprite.org/>
- **GIMP** (Free) - <https://www.gimp.org/>

### Process (5 minutes per sprite)

**1. Downscale**
```
Open in Aseprite/GIMP
Sprite → Sprite Size (Aseprite) or Image → Scale Image (GIMP)
From: 1024×1024 → To: 128×128
Method: NEAREST NEIGHBOR ← CRITICAL!
```

**2. Reduce Colors**
```
Aseprite: Sprite → Color Mode → Indexed → 16 colors
GIMP: Image → Mode → Indexed → 16 colors
```

**3. Final Size**
```
Resize to SNES size:
- Items: 8×8 or 16×16
- Characters: 16×16 or 32×32
- Bosses: 32×32 or 64×64
Method: NEAREST NEIGHBOR
```

**4. Export**
```
Save as PNG (indexed colors)
```

---

## 🎨 More SylvanTimes Prompts

### Ancient Tree Guardian (Boss/Ally)
```
pixel, ancient tree spirit guardian, wooden bark face, glowing green eyes, moss beard, nature magic, SNES RPG character, 16-bit, large
```

### Dark Forest Fairy (Enemy)
```
pixel, evil fairy enemy, purple magic, dark wings, mischievous, small, SNES sprite, 16-bit, flying
```

### Elven Bow (Weapon)
```
pixel, legendary elven bow, wooden, green glowing runes, elegant, SNES weapon icon, 16-bit
```

### Forest Health Potion
```
pixel, green healing potion, glass bottle, leaf decoration, glowing, SNES item, 16-bit, simple icon
```

### Elf Tree Village
```
pixel, elf village in giant trees, wooden platforms, rope bridges, lanterns, SNES background, 16-bit, peaceful
```

### Dark Cave Dungeon
```
pixel, dark forest cave, twisted roots, glowing crystals, ominous, SNES dungeon background, 16-bit
```

---

## ⚙️ Quick Settings Guide

| What You're Making | Model | Size | Steps | CFG |
|-------------------|-------|------|-------|-----|
| Hero Character | pixel-art-xl | 1024×1024 | 25 | 8 |
| Enemy Sprite | pixel-art-xl | 512×512 | 20 | 7 |
| Item Icon | pixel-art-xl | 512×512 | 20 | 7 |
| Background | pixel-art-xl | 1024×1024 | 30 | 9 |
| Boss | pixel-art-xl | 1024×1024 | 30 | 9 |

**Sampler**: Use DPM++ 2M Karras or Euler a

---

## 🔧 Common Problems

**❌ Too blurry**
- Use Nearest Neighbor scaling ALWAYS
- Never bilinear or bicubic

**❌ Too many colors**
- Normal! Reduce to 16 colors in Aseprite/GIMP after

**❌ Not pixelated enough**
- Add "SNES" and "16-bit" to prompt
- Use pixel-art-xl model

**❌ Out of memory**
```powershell
.\webui.bat --medvram
```

---

## ✅ Complete Workflow

```
1. .\webui.bat ← Launch
2. Select pixel-art-xl.safetensors ← Choose model
3. Copy prompt from above ← Paste prompt
4. Set size to 1024×1024 ← Configure
5. Click Generate ← Create!
6. Save image ← Download
7. Open in Aseprite ← Edit
8. Downscale to 128×128 (nearest neighbor) ← Reduce
9. Reduce to 16 colors ← Palette
10. Resize to 16×16 or 32×32 ← Final size
11. Export as PNG ← Save
12. Use in your SNES game! ← Done!
```

---

## 📚 Full Documentation

**In this directory**:
- `START_HERE.md` ← More detailed quick start
- `QUICKSTART_PIXEL_ART.md` ← Basic guide
- `PIXEL_ART_SETUP.md` ← Complete setup info
- `AI_PIXEL_ART_GUIDE_SNES.md` ← SNES development guide
- `docs/README.md` ← All documentation index
- `docs/COMPLETE_SETUP_SUMMARY.md` ← Full summary

**For SylvanTimes**:
Copy this file to: `C:\Users\me\source\repos\SylvanTimes\docs\AI_PIXEL_ART_GUIDE.md`

---

## 🎯 Your Next Command

```powershell
.\webui.bat
```

**Then**: 
1. Open <http://127.0.0.1:7860>
2. Select `pixel-art-xl.safetensors`
3. Copy the first prompt from above
4. Click Generate!

---

**🎮 ALL MODELS READY! START CREATING SNES PIXEL ART NOW! ✨**

Everything is installed and working!
