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
SETUP="Setup.exe"
NAME="GameName"
ENGINE="5.11-staging"
ARCH="amd64"

WINE_ROOT="$HOME/.PlayOnLinux"
PREFIX="${WINE_ROOT}/wineprefix/${NAME}"
WINE="${WINE_ROOT}/wine/linux-${ARCH}/${ENGINE}"
LOADER="${WINE}/bin/wine"
SERVER="${WINE}/bin/wineserver"


main() {

    run "${SETUP}"
}


run() {

    echo
    echo "   ---------------------   Run   ----------------------   "
    echo

    local file="$1"
    [ -f "$file" ] || exit_error "$file doesn't exist"

    if echo "$file" | grep -iq '.msi';
    then
        echo "${c2}[>] run .msi ${c0} $file"
        env WINEPREFIX="$PREFIX" WINELOADER="$LOADER" WINESERVER="$SERVER" WINEDEBUG="-all" WINEDLLOVERRIDES="winemenubuilder.exe=d" msiexec /i "$file"
    else
        echo "${c2}[>] run .exe ${c0} $file"
        env WINEPREFIX="$PREFIX" WINELOADER="$LOADER" WINESERVER="$SERVER" WINEDEBUG="-all" WINEDLLOVERRIDES="winemenubuilder.exe=d" "$LOADER" "$file"
    fi

    echo
    echo "${c2}Script finished!${c0}"
}

main "$@"
