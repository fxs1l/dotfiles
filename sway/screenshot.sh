#!/usr/bin/env bash
filename="/home/$(whoami)/Pictures/Linux Screenshots/$(date +'%m_%d_%Y-%H:%M:%S').png"
touch "$filename"
grim "$filename"
