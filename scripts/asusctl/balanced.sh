#!/bin/bash
# Change asusctl fan profile to balanced
asusctl profile -P balanced

# Enable balanced preset for HS-Series APUs
sleep 1
sudo ryzenadj --tctl-temp 80 --apu-skin-temp=80 --stapm-limit=52000 --slow-limit=52000 --fast-limit=58000 --slow-time=75 --stapm-time=10 --vrm-current=145000 --vrmmax-current=145000
