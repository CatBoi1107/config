#!/bin/sh
BASENAME=$(date +%y%m%d_%H)
OUTPUT_DIR="$HOME/ThePreservedLexicon/Media/Images/Screenshots/"
mkdir -p "$OUTPUT_DIR"

# Select region with slurp
GEOM=$(slurp)

# Exit cleanly if selection was cancelled
[ -z "$GEOM" ] && exit 0

# Generate a unique filename for the final JPEG
FILEPATH="$OUTPUT_DIR$BASENAME.jpg"
COUNT=1
while [ -f "$FILEPATH" ]; do
    FILEPATH="$OUTPUT_DIR$BASENAME($COUNT).jpg"
    COUNT=$((COUNT + 1))
done

# --- THE CONVEYOR BELT ---
# 1. grim captures the screen. The '-' tells it to push raw data down the pipe.
# 2. ffmpeg catches that raw data (pipe:0), compresses it, and saves it directly to your drive.
# Because of the pipe, the uncompressed image never touches your hard drive!
grim -g "$GEOM" - | ffmpeg -y -i pipe:0 -qscale:v 10 "$FILEPATH"

# Copy the finished JPEG to the clipboard.
# We use --type image/png to "trick" clipse and Wayland into accepting it!
wl-copy --type image/png < "$FILEPATH"
