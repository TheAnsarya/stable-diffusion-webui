"""
Pixel Art Presets for SNES Development
Adds quick-access presets for common SNES pixel art generation settings
"""

import gradio as gr
from modules import scripts

class PixelArtPresetsScript(scripts.Script):
    def title(self):
        return "Pixel Art Presets (SNES)"

    def show(self, is_img2img):
        return scripts.AlwaysVisible

    def ui(self, is_img2img):
        with gr.Group():
            with gr.Accordion("SNES Pixel Art Presets", open=False):
                gr.Markdown("""
                Quick presets for SNES-style pixel art generation.
                Click a preset to apply recommended settings.
                """)
                
                with gr.Row():
                    preset_16x16 = gr.Button("16x16 Sprite", variant="primary")
                    preset_32x32 = gr.Button("32x32 Character")
                    preset_bg = gr.Button("Background/Tile")
                    preset_xl = gr.Button("Pixel Art XL")
                
                gr.Markdown("""
                **Preset Details:**
                - **16x16 Sprite**: SNES small sprites, icons, items
                - **32x32 Character**: Player characters, enemies
                - **Background/Tile**: Tileable backgrounds, scenery
                - **Pixel Art XL**: High-detail concept art
                """)
        
        return []

    def apply_preset_16x16(self):
        """Settings for authentic 16x16 SNES sprites"""
        return {
            "steps": 20,
            "sampler_name": "Euler a",
            "cfg_scale": 7,
            "width": 256,
            "height": 256,
            "prompt_prefix": "16-bit SNES pixel art, 16x16 sprite, limited palette, retro game, ",
            "negative_prompt": "blurry, smooth, antialiased, gradient, photorealistic, 3d",
        }

    def apply_preset_32x32(self):
        """Settings for 32x32 character sprites"""
        return {
            "steps": 25,
            "sampler_name": "Euler a",
            "cfg_scale": 7.5,
            "width": 512,
            "height": 512,
            "prompt_prefix": "Super Nintendo pixel art, 32x32 character sprite, 16 colors, side view, ",
            "negative_prompt": "blurry, smooth, antialiased, photorealistic, modern graphics",
        }

    def apply_preset_bg(self):
        """Settings for backgrounds and tilesets"""
        return {
            "steps": 30,
            "sampler_name": "DPM++ 2M Karras",
            "cfg_scale": 8,
            "width": 512,
            "height": 512,
            "prompt_prefix": "SNES pixel art background, tileable, dithered, 256 colors, retro game, ",
            "negative_prompt": "characters, sprites, UI, smooth gradients, photorealistic",
        }

    def apply_preset_xl(self):
        """Settings for high-detail pixel art"""
        return {
            "steps": 30,
            "sampler_name": "DPM++ 2M Karras",
            "cfg_scale": 8.5,
            "width": 768,
            "height": 768,
            "prompt_prefix": "detailed pixel art, HD pixel art style, limited palette, clean pixels, ",
            "negative_prompt": "blurry, jpeg artifacts, antialiased, smooth",
        }
