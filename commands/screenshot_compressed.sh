#!/bin/sh
BASENAME=$(date +%y%m%d_%H)
OUTPUT_DIR=~/ThePreservedLexicon/Images/Screenshots/
TEMP="$OUTPUT_DIR"temp.png

hyprshot -m region -o "$OUTPUT_DIR" -f temp.png --freeze

if [ -f "$TEMP" ]; then
    FILEPATH="$OUTPUT_DIR$BASENAME.jpg"
    COUNT=1
    while [ -f "$FILEPATH" ]; do
        FILEPATH="$OUTPUT_DIR$BASENAME($COUNT).jpg"
        COUNT=$((COUNT + 1))
    done

    ffmpeg -i "$TEMP" -qscale:v 10 "$FILEPATH" \
        && rm "$TEMP" \
        && wl-copy --type image/png < "$FILEPATH"
fi
