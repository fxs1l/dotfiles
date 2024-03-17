#!/bin/bash
# Change asusctl fan profile to performance
asusctl profile -P performance 

# Enable performance preset for HS-Series APUs
sleep 1
sudo ryzenadj --tctl-temp 80 --apu-skin-temp=80 --stapm-limit=65000 --slow-limit=65000 --fast-limit=72000 --slow-time=75 --stapm-time=10 --vrm-current=145000 --vrmmax-current=145000
