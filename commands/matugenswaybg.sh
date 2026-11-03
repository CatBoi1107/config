#!/bin/bash

# $1 is the image path passed to this script
IMAGE_PATH="$1"

# 1. Set the wallpaper using swaybg
swaybg -i "$IMAGE_PATH" -m fill &

# 2. Run matugen to extract colors and apply them
# 'image' tells it to analyze the file
# 'waybar' and 'kitty' tell it which templates to generate
matugen image "$IMAGE_PATH" -t waybar -t kitty

# 3. Reload waybar and kitty to apply the new colors instantly
killall -SIGUSR2 waybar
# Note: Kitty requires a specific command to reload, or you can just restart it. 
# A safer way for kitty is to let it reload on its own next time it opens, 
# or use: kitty @ set-colors --all ~/.config/kitty/theme.conf (if configured)
