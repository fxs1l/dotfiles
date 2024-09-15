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
TRICKS=(
    win7
)
NAME="GameName"
ENGINE="5.11-staging"
ARCH="amd64"

WINE_ROOT="$HOME/.PlayOnLinux"
PREFIX="${WINE_ROOT}/wineprefix/${NAME}"
WINE="${WINE_ROOT}/wine/linux-${ARCH}/${ENGINE}"
LOADER="${WINE}/bin/wine"
SERVER="${WINE}/bin/wineserver"


main() {

    tricks
}


tricks() {

    echo
    echo "   --------------------   Tricks   --------------------   "
    echo

    printf "%s\n" "${TRICKS[@]}"

    env WINEPREFIX="$PREFIX" WINE="$LOADER" WINESERVER="$SERVER" winetricks "${TRICKS[@]}"

    echo
    echo "${c2}Script finished!${c0}"
}

main "$@"
