#!/bin/sh
BASENAME=$(date +%y%m%d_%H)
OUTPUT_DIR="$HOME/ThePreservedLexicon/Media/Images/Screenshots/"
mkdir -p "$OUTPUT_DIR"

# Select region with slurp
GEOM=$(slurp)

# Exit cleanly if selection was cancelled (e.g. user pressed Escape)
[ -z "$GEOM" ] && exit 0

TEMP=$(mktemp -p "$OUTPUT_DIR" --suffix=.png niri_XXXXXX)

# Capture directly into the temp file synchronously
grim -g "$GEOM" "$TEMP"

if [ -s "$TEMP" ]; then
    FILEPATH="$OUTPUT_DIR$BASENAME.jpg"
    COUNT=1
    while [ -f "$FILEPATH" ]; do
        FILEPATH="$OUTPUT_DIR$BASENAME($COUNT).jpg"
        COUNT=$((COUNT + 1))
    done

    # Compress to JPEG, clean up the temp PNG, and copy image to clipboard
    ffmpeg -i "$TEMP" -qscale:v 10 "$FILEPATH" \
        && rm -f "$TEMP" \
        && wl-copy --type image/jpeg < "$FILEPATH"
else
    rm -f "$TEMP"
fi
