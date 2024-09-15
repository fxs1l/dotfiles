#!/bin/bash
echo 0 | pkexec tee /sys/devices/system/cpu/cpufreq/boost
