# Pixel Art Generation Setup for SNES Development

This Stable Diffusion WebUI installation has been configured for pixel art generation, specifically optimized for SNES game development.

## Installed Extensions

### ControlNet
- **Location**: `extensions/sd-webui-controlnet/`
- **Purpose**: Enables precise control over image generation using control maps
- **Usage**: Essential for maintaining pixel art structure and style consistency

## Recommended Models

### 1. Pixel Art XL (LoRA) - RECOMMENDED
**Best for**: High-quality pixel art with SDXL base
- **Type**: LoRA adapter (not standalone model)
- **Download**: [HuggingFace - nerijs/pixel-art-xl](https://huggingface.co/nerijs/pixel-art-xl)
- **Installation**:
  1. Download `pixel-art-xl.safetensors` from Files tab
  2. Place in `models/Lora/` directory
  3. Download SDXL base model: [stabilityai/stable-diffusion-xl-base-1.0](https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0)
  4. Place SDXL base in `models/Stable-diffusion/`
- **Usage**:
  - Select SDXL base model
  - Click 🎴 icon to open LoRA selector
  - Add `pixel-art-xl` with weight 1.0-1.2
  - Prefix prompts with `pixel, `
- **Recommended Settings**:
  - Sampling Steps: 20-30 (or 8 steps with LCM LoRA)
  - CFG Scale: 7-9 (or 1.5 with LCM)
  - Sampler: DPM++ 2M Karras or Euler a
  - Resolution: 1024x1024 (SDXL native), then downscale 8x with nearest-neighbor
  - Use fixed VAE to avoid artifacts

### 2. Pixel Art Style (Standalone)
**Best for**: Simple pixel art without needing SDXL
- **Type**: Full fine-tuned Stable Diffusion model
- **Download**: [HuggingFace - kohbanye/pixel-art-style](https://huggingface.co/kohbanye/pixel-art-style)
- **Installation**:
  1. Download model files from Files tab
  2. Place in `models/Stable-diffusion/`
- **Usage**:
  - Select model from dropdown
  - Add `pixelartstyle` token to your prompts
- **Recommended Settings**:
  - Sampling Steps: 20-30
  - CFG Scale: 7-9
  - Sampler: Euler a or DPM++ 2M Karras
  - Resolution: 512x512

## Configuration Files

### pixel-art-16x16.yaml
- Optimized for 16x16 pixel art generation
- Perfect for SNES character sprites and icons
- Lower resolution settings for authentic retro look

### pixel-art-xl.yaml
- Higher resolution pixel art generation
- Good for backgrounds, larger sprites, and detailed assets
- Supports more complex scenes while maintaining pixel art aesthetic

## SNES Development Workflow

### Recommended Process:
1. **Generate base art** using Pixel Art XL LoRA for concept exploration
2. **Refine with ControlNet** to maintain consistent style
3. **Downscale properly** using nearest-neighbor scaling (8x reduction for SDXL)
4. **Post-process**:
   - Reduce to SNES palette (256 colors max, typically 16-color palettes)
   - Ensure sprite dimensions match SNES specifications (8x8, 16x16, 32x32, 64x64)
   - Export in appropriate format (.chr, .bin, or indexed PNG)

### SNES Sprite Specifications:
- **Colors**: Up to 16 colors per sprite (including transparency)
- **Sizes**: 8x8, 16x16, 32x32, 64x64 pixels
- **Palettes**: 8 palettes of 16 colors each
- **Total colors**: 256 simultaneous colors (15-bit color depth: 32,768 total)

## Prompt Tips for SNES-Style Pixel Art

### For Pixel Art XL LoRA:
Always start prompts with `pixel, ` when using this LoRA.

### Good keywords include:
- "pixel" (required for Pixel Art XL)
- "isometric" or "non-isometric"
- "retro game"
- "16-bit style"
- "limited palette"
- "SNES"

### Negative prompts:
- "3d render"
- "realistic"
- "photorealistic"
- "smooth"
- "blurry"
- "antialiased"
- "gradient"

### Example prompts:

**With Pixel Art XL:**
```
Pixel, a knight character with sword and shield, 16-bit style, side view
Negative: 3d render, realistic, smooth
```

```
Pixel, fantasy dragon enemy, retro game sprite, limited palette, isometric
Negative: photorealistic, blurry, detailed
```

```
Pixel, medieval castle background, stone walls, torches, SNES style
Negative: 3d, modern graphics, realistic
```

**With Pixel Art Style:**
```
a brave knight with sword, pixelartstyle
```

```
an astronaut riding a horse, pixelartstyle
```

```
a fantasy castle on a hill, pixelartstyle
```

## ControlNet Models for Pixel Art

Download these ControlNet models for better pixel art control:
- **control_v11p_sd15_lineart**: Good for maintaining pixel art outlines
- **control_v11f1p_sd15_depth**: Useful for sprite depth consistency
- **control_v11p_sd15_scribble**: Quick concept sketching

Place ControlNet models in: `extensions/sd-webui-controlnet/models/`

## Additional Tools & Resources

### Color Palette Reducers:
- Use external tools like Aseprite or GIMP to reduce to SNES palettes
- Apply dithering for authentic retro look

### Testing:
- Test generated sprites in SNES emulators (bsnes, Mesen-S)
- Verify color count and palette constraints

### Batch Generation:
- Use X/Y/Z plot for generating sprite variations
- Scripts for batch processing in `scripts/` directory

## Cost Information

- **Local Generation**: Free (requires compatible GPU)
  - Recommended: NVIDIA GPU with 6GB+ VRAM
  - CPU generation possible but very slow
- **Cloud Options**: 
  - Google Colab: Free tier available, Pro from $10/month
  - RunPod, Vast.ai: Pay per hour (~$0.20-0.50/hr for GPU)

## Quick Start

1. Download models:
   - **Pixel Art XL LoRA**: <https://huggingface.co/nerijs/pixel-art-xl>
   - **SDXL Base**: <https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0>
   - OR **Pixel Art Style**: <https://huggingface.co/kohbanye/pixel-art-style>
2. Place files:
   - LoRA → `models/Lora/`
   - Base models → `models/Stable-diffusion/`
3. Launch WebUI: `webui.bat`
4. Select SDXL base + add Pixel Art XL LoRA (or select Pixel Art Style model)
5. Start generating with proper prompts!

## Troubleshooting

- **Out of memory errors**: Reduce batch size, lower resolution, or use `--medvram` flag
- **Colors not limited**: Post-process in image editor to reduce palette
- **Blurry pixels**: Ensure using nearest-neighbor scaling, avoid bilinear/bicubic
- **ControlNet not appearing**: Restart WebUI after installation

---

For SNES development, pixel-art-diffusion-hard-16 is **RECOMMENDED** as it produces authentic retro sprites with proper constraints.
