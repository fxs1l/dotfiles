#!/bin/bash
title=$(basename "$0")
echo -n -e "\033]0;$title\007"

# Colors
c0=$'\e[0m'
c1=$(tput setaf 202)
c2=$(tput setaf 154)
b0=$'\e[25m'
b1=$'\e[5m'

# Force output in english
export LC_ALL=en_US.UTF-8

# OPTIONS
NAME="Valheim"
ENGINE="5.11-staging"
ARCH="amd64"

WINE_ROOT="$HOME/.PlayOnLinux"
PREFIX="${WINE_ROOT}/wineprefix/${NAME}"
WINE="${WINE_ROOT}/wine/linux-${ARCH}/${ENGINE}"
LOADER="${WINE}/bin/wine"
SERVER="${WINE}/bin/wineserver"


main() {

    create_prefix
}


create_prefix() {

    echo
    echo "   ----------------   Create prefix   -----------------   "
    echo

    ARCH=$([ "$ARCH" == "amd64" ] && echo "win64" || echo "win32")

    env WINEARCH="$ARCH" WINEPREFIX="$PREFIX" WINELOADER="$LOADER" WINESERVER="$SERVER" WINEDEBUG="-all" wineboot
    env WINEPREFIX="$PREFIX" WINE="$LOADER" WINESERVER="$SERVER" winetricks isolate_home mimeassoc=off

    echo
    echo "${c2}Script finished!${c0}"
}

main "$@"

