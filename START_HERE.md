# START HERE - Ready to Generate SNES Pixel Art!

**✅ YOUR MODELS ARE READY!**

Located in: `C:\Users\me\source\repos\stable-diffusion-webui\models\Stable-diffusion\`

---

## 🚀 Quick Start (3 Steps to First Image)

### Step 1: Launch WebUI

```powershell
cd C:\Users\me\source\repos\stable-diffusion-webui
.\webui.bat
```

Wait for it to open at: <http://127.0.0.1:7860>

### Step 2: Select a Model

Click the model dropdown at the top and choose ONE:

**Option A: `pixel-art-xl.safetensors` (RECOMMENDED for SNES)**
- Best for: High-quality SNES-style sprites
- Prefix prompts with: `pixel,`
- Settings: 1024×1024, Steps 25, CFG 8

**Option B: `pixel-art-style.ckpt` (Simpler)**
- Best for: Quick SNES sprites
- Add to prompts: `pixelartstyle`
- Settings: 512×512, Steps 20, CFG 7

**Option C: `sd_xl_base_1.0.safetensors`**
- Use this as base if you want to load pixel-art-xl as LoRA
- Most powerful but more complex

### Step 3: Generate Your First SNES Sprite!

**Copy this prompt into the WebUI:**

**If using pixel-art-xl.safetensors:**
```
pixel, SNES style hero warrior character, green tunic, sword and shield, 16-bit sprite, side view, Super Nintendo graphics
```

**If using pixel-art-style.ckpt:**
```
SNES hero warrior, green tunic, sword and shield, 16-bit sprite, pixelartstyle
```

**Negative prompt (for both):**
```
3d render, realistic, photorealistic, smooth, blurry, modern graphics, detailed textures
```

**Settings:**
- Sampling Steps: 25
- Sampling Method: DPM++ 2M Karras (or Euler a)
- CFG Scale: 8
- Width: 1024 (or 512 for pixel-art-style)
- Height: 1024 (or 512 for pixel-art-style)

**Click Generate!** 🎨

---

## 🎮 SNES-Style Prompts (Ready to Copy-Paste)

### Characters

**Hero Character:**
```
pixel, SNES RPG hero character, Link style, green tunic, sword, 16-bit Super Nintendo sprite, side view
Negative: 3d, realistic, smooth, modern
```

**Enemy Slime:**
```
pixel, Super Nintendo slime enemy, blue gelatinous, cute eyes, 16-bit SNES sprite, simple
Negative: realistic, 3d render, detailed
```

**NPC Merchant:**
```
pixel, SNES merchant character, hooded robe, backpack, 16-bit sprite, friendly, Super Nintendo style
Negative: 3d, photorealistic, smooth
```

### Items (8×8 or 16×16)

**Health Potion:**
```
pixel, SNES health potion icon, red bottle, glowing, simple, 16-bit item sprite
Negative: realistic, 3d, complex, detailed
```

**Treasure Chest:**
```
pixel, Super Nintendo treasure chest, closed, wooden, gold trim, 16-bit sprite, top-down view
Negative: 3d, realistic, open
```

**Magic Sword:**
```
pixel, SNES legendary sword icon, glowing blade, blue aura, 16-bit item sprite
Negative: realistic, 3d, photorealistic
```

### Backgrounds

**Forest Scene:**
```
pixel, SNES forest background, tall trees, grass, mushrooms, Super Nintendo RPG style, 256 colors
Negative: 3d, realistic, modern, characters
```

**Castle Interior:**
```
pixel, Super Nintendo castle interior, stone walls, torches, pillars, SNES background, 16-bit
Negative: photorealistic, 3d render, modern
```

**Cave Dungeon:**
```
pixel, SNES cave dungeon background, dark rocks, crystals, underground, Super Nintendo style
Negative: realistic, 3d, bright, modern
```

---

## 📐 Post-Processing for SNES

### Generated images need to be processed for SNES:

**1. Downscale (if using 1024×1024)**
- Open in Aseprite or GIMP
- Resize to 128×128 (or desired size)
- **MUST USE: Nearest Neighbor scaling**
- Never bilinear/bicubic!

**2. Reduce Colors**
- Sprite → Color Mode → Indexed (Aseprite)
- Or Image → Mode → Indexed (GIMP)
- Limit to 16 colors per sprite

**3. Final Resize**
- SNES sizes: 8×8, 16×16, 32×32, or 64×64
- Again use Nearest Neighbor

**4. Export**
- Save as indexed PNG
- Ready for SNES dev tools!

---

## 🎨 SylvanTimes Game Prompts

### Forest Characters

**Sylvan (Elf Ranger Protagonist):**
```
pixel, young elf ranger hero, green forest cloak, bow and arrows, brown braided hair, 16-bit SNES style, side view, Link-like
Negative: 3d, realistic, modern, armor
```

**Ancient Tree Guardian:**
```
pixel, ancient tree spirit guardian, glowing green eyes, wooden face, bark texture, moss, SNES boss sprite, large
Negative: 3d, realistic, human, smooth
```

**Forest Dwarf Merchant:**
```
pixel, friendly dwarf merchant, red beard, brown leather vest, backpack of goods, SNES NPC sprite, cheerful
Negative: 3d, realistic, tall, warrior
```

### Forest Enemies

**Corrupted Shadow Wolf:**
```
pixel, dark corrupted wolf enemy, red glowing eyes, black fur, shadow aura, SNES enemy sprite, aggressive, 16-bit
Negative: cute, realistic, 3d, friendly, brown
```

**Dark Forest Fairy:**
```
pixel, evil fairy enemy, purple magic, dark wings, mischievous, SNES sprite, small, flying
Negative: cute, friendly, realistic, 3d, large
```

**Moss Golem Boss:**
```
pixel, giant stone golem covered in moss, glowing runes, forest guardian, SNES boss sprite, 32x32, imposing
Negative: 3d, realistic, small, modern, smooth
```

### Forest Items

**Enchanted Acorn:**
```
pixel, glowing golden acorn, magical aura, oak leaf attached, SNES item icon, 16-bit, simple
Negative: realistic, 3d, complex, brown
```

**Elven Longbow:**
```
pixel, legendary elven bow, glowing green runes, elegant wood, SNES weapon icon, 16-bit
Negative: realistic, 3d, modern, crossbow
```

**Forest Healing Herb:**
```
pixel, green healing herb potion, leaf decoration, glass vial, glowing, SNES item, 16-bit
Negative: realistic, 3d, red, complex
```

### Forest Environments

**Enchanted Forest Path:**
```
pixel, magical forest path, towering ancient trees, glowing mushrooms, fireflies, SNES background, Super Nintendo style
Negative: 3d, realistic, modern, desert, characters
```

**Elf Tree Village:**
```
pixel, elf village in giant trees, wooden platforms, rope bridges, lanterns, SNES background, 16-bit, peaceful
Negative: 3d, realistic, modern, stone, ground level
```

**Sacred Grove:**
```
pixel, mystical sacred grove, glowing magical plants, ancient stones, ethereal light, SNES background, 16-bit
Negative: 3d, realistic, dark, modern, city
```

**Dark Forest Cave:**
```
pixel, dark cave entrance in forest, twisted roots, crystals, ominous, SNES dungeon background, 16-bit
Negative: 3d, realistic, bright, modern, colorful
```

---

## ⚙️ Recommended Settings

| Model | Resolution | Steps | CFG | Sampler |
|-------|-----------|-------|-----|---------|
| pixel-art-xl.safetensors | 1024×1024 | 25 | 8 | DPM++ 2M Karras |
| pixel-art-style.ckpt | 512×512 | 20 | 7 | Euler a |
| For items/icons | 512×512 | 20 | 7 | Euler a |
| For backgrounds | 1024×1024 | 30 | 9 | DPM++ 2M Karras |

---

## 🔧 Common Issues

**Issue: Blurry pixels**
- ✅ Always use Nearest Neighbor scaling
- ❌ Never use bilinear or bicubic

**Issue: Too many colors**
- This is normal! AI generates millions of colors
- Reduce to 16 colors in Aseprite/GIMP

**Issue: Not pixelated enough**
- Add "SNES" or "Super Nintendo" to prompt
- Add "16-bit sprite" to prompt
- Use pixel-art-xl model

**Issue: Out of memory**
```powershell
# Launch with low VRAM mode
.\webui.bat --medvram
```

---

## 📝 Workflow Summary

```
1. Launch WebUI → .\webui.bat
2. Select model → pixel-art-xl.safetensors
3. Write prompt → pixel, SNES hero warrior...
4. Add negative → 3d render, realistic...
5. Set size → 1024×1024
6. Generate! → Click button
7. Downscale → 128×128 (nearest neighbor)
8. Reduce colors → 16 colors
9. Resize → 16×16, 32×32, etc.
10. Export → indexed PNG
```

---

## 📚 More Documentation

- **Complete Setup**: `PIXEL_ART_SETUP.md`
- **SNES Development**: `AI_PIXEL_ART_GUIDE_SNES.md`
- **Session Logs**: `docs/SESSION_LOG.md`
- **All References**: `docs/README.md`

---

## ✅ Quick Checklist

- [x] Models downloaded (you have them!)
- [ ] Launch WebUI: `.\webui.bat`
- [ ] Select `pixel-art-xl.safetensors`
- [ ] Copy a prompt from above
- [ ] Set resolution to 1024×1024
- [ ] Click Generate
- [ ] Download Aseprite or GIMP
- [ ] Process your first sprite!

---

**🎮 Start generating SNES pixel art NOW! All models are ready!**

Your next command:
```powershell
.\webui.bat
```

Then open browser to <http://127.0.0.1:7860> and start creating!
