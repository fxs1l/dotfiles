#!/bin/bash
# Change asusctl fan profile to quiet
asusctl profile -P quiet 

# Enable balanced preset for HS-Series APUs
sleep 1
sudo ryzenadj --tctl-temp 80 --apu-skin-temp=80 --stapm-limit=6000 --slow-limit=8000 --fast-limit=8000 --slow-time=75 --stapm-time=10 --vrm-current=145000 --vrmmax-current=145000


