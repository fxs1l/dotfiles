#!/usr/bin/env bash

filename="/home/$(whoami)/Pictures/Linux Screenshots/$(date +'%Y.%m.%d-%H:%M:%S').png"
touch "$filename"

# Use slurp to select a region and pass it to grim
region=$(slurp)
if [ -n "$region" ]; then
    grim "$filename" -g "$region"
else
    # If selection was cancelled, remove the file
    echo "Selection cancelled. Removing file: $filename"
    rm "$filename"
fi
