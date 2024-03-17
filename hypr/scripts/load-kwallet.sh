#!/usr/bin/env bash

sleep 25 && /usr/lib/pam_kwallet_init --no-startup-id
notify-send "Kwallet is iniatiated"

