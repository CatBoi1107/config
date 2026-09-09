#!/bin/sh
FILE="$1"

# Get the MIME type of the file
MIME=$(file --mime-type -b "$FILE")

case "$MIME" in
    video/*) 
        mediainfo --no-preview "$FILE" 
        ;;
    image/*) 
        mediainfo "$FILE" 
        ;;
    audio/*|application/*) 
        mediainfo "$FILE" 
        ;;
    *) 
        # Fallback for typst or anything else
        if echo "$FILE" | grep -q '\.typ$'; then
            preview-typst "$FILE"
        fi
        ;;
esac
