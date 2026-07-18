#!/bin/sh
BASENAME=$(date +%y%m%d_%H)
OUTPUT_DIR=~/ThePreservedLexicon/Media/Images/Screenshots/
mkdir -p "$OUTPUT_DIR"

TEMP=$(mktemp -p "$OUTPUT_DIR" --suffix=.png hypr_XXXXXX)

hyprshot -m region -o "$OUTPUT_DIR" -f "$(basename "$TEMP")" --freeze

# Poll instead of waiting for an event: works whether grim finished
# before or after this point. Bails after ~10s if selection was cancelled
# (file stays empty).
i=0
prev_size=-1
while [ $i -lt 100 ]; do
    size=$(stat -c%s "$TEMP" 2>/dev/null || echo 0)
    if [ "$size" -gt 0 ] && [ "$size" = "$prev_size" ]; then
        break
    fi
    prev_size=$size
    sleep 0.1
    i=$((i + 1))
done

if [ -s "$TEMP" ]; then
    FILEPATH="$OUTPUT_DIR$BASENAME.jpg"
    COUNT=1
    while [ -f "$FILEPATH" ]; do
        FILEPATH="$OUTPUT_DIR$BASENAME($COUNT).jpg"
        COUNT=$((COUNT + 1))
    done

    ffmpeg -i "$TEMP" -qscale:v 10 "$FILEPATH" \
        && rm -f "$TEMP" \
        && wl-copy --type image/png < "$FILEPATH"
else
    rm -f "$TEMP"
fi
