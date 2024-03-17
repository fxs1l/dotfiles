#!/bin/bash

echo 1 | pkexec tee /sys/devices/system/cpu/cpufreq/boost
