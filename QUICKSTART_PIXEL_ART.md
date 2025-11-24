# Quick Start Guide - SNES Pixel Art Generation

## What Was Set Up

Your Stable Diffusion WebUI is now configured for SNES pixel art generation:

✅ **ControlNet Extension** - Installed in `extensions/sd-webui-controlnet/`
✅ **Pixel Art Configs** - Two config files for different pixel art styles
✅ **Documentation** - Complete setup guide in `PIXEL_ART_SETUP.md`
✅ **Helper Scripts** - Preset scripts and batch generation tools

## Next Steps

### 1. Models Ready! ✅

You already have the models downloaded:

**✅ Pixel Art XL LoRA (RECOMMENDED)**
- Location: `models/Stable-diffusion/pixel-art-xl.safetensors`
- Type: LoRA adapter for SDXL
- Usage: Use with SDXL base model

**✅ SDXL Base 1.0**
- Location: `models/Stable-diffusion/sd_xl_base_1.0.safetensors`
- Type: Base model for Pixel Art XL LoRA
- Required for best quality

**✅ Pixel Art Style (Alternative)**
- Location: `models/Stable-diffusion/pixel-art-style.ckpt`
- Type: Standalone model
- Usage: Add `pixelartstyle` token to prompts

### 2. Launch WebUI

```powershell
.\webui.bat
```

Or with API enabled for batch processing:
```powershell
.\webui.bat --api
```

### 3. Select Model and Configure

1. Open WebUI in browser (usually <http://127.0.0.1:7860>)
2. **Option A: Pixel Art XL with SDXL (RECOMMENDED for SNES):**
   - Select `sd_xl_base_1.0.safetensors` from model dropdown
   - Since your LoRA is in Stable-diffusion folder, you'll use it as a model
   - OR select `pixel-art-xl.safetensors` directly
   - Configure settings (see below)
3. **Option B: Pixel Art Style (Simpler):**
   - Select `pixel-art-style.ckpt` from dropdown
   - Add `pixelartstyle` to all prompts
   - Works great for SNES sprites
4. Start generating!

### 4. Use Presets

The `pixel_art_presets.py` script adds quick-access buttons for:
- 16x16 sprites (items, small characters)
- 32x32 characters (player, enemies)
- Backgrounds and tiles
- High-detail pixel art

## Example Prompts

Try these to get started:

**For Pixel Art XL (with LoRA):**

```text
pixel, a hero warrior with sword and shield, 16-bit style, limited palette
Negative: 3d render, realistic, smooth, blurry
```

```text
pixel, red dragon enemy sprite, side view, retro game, 16 colors
Negative: 3d, photorealistic, detailed
```

```text
pixel, castle interior background, stone walls, torches, isometric
Negative: realistic, 3d render
```

**For Pixel Art Style (standalone):**

```text
a hero warrior, sword and shield, pixelartstyle
```

```text
an astronaut riding a horse, pixelartstyle
```

## SNES Color Limits

Remember to post-process your generated art:
- **16 colors** per sprite (including transparency)
- **256 total colors** on screen
- Use tools like Aseprite or GIMP for palette reduction

## Files Created

- `PIXEL_ART_SETUP.md` - Full documentation
- `configs/pixel-art-16x16.yaml` - Config for 16x16 sprites
- `configs/pixel-art-xl.yaml` - Config for XL pixel art
- `configs/pixel-art-settings.json` - Recommended UI settings
- `scripts/pixel_art_presets.py` - Quick preset buttons
- `scripts/batch-generate-snes-sprites.ps1` - Batch generation helper

## Troubleshooting

**Models not appearing?**
- Base models go in `models/Stable-diffusion/`
- LoRAs go in `models/Lora/`
- Click refresh button next to model dropdown (🔄)
- For LoRAs, click the 🎴 button and refresh there
- Check file extensions (.safetensors or .ckpt)

**ControlNet not showing?**
- Restart WebUI after extension installation
- Check `extensions/sd-webui-controlnet/` exists

**Need help?**
- Read full guide: `PIXEL_ART_SETUP.md`
- Check WebUI console for errors
- Verify GPU drivers are up to date

---

**Ready to generate SNES pixel art! 🎮✨**

Download the models, launch the WebUI, and start creating retro game sprites!
