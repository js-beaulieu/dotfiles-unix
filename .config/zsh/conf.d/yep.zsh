#!/usr/bin/env zsh

ROOT_DIR="$HOME/.config/yadm/bootstrap.d"

function yep() {
    if command -v yay &> /dev/null; then
        FILE="$ROOT_DIR/packages.arch.txt"
        echo "Exporting 'yay' packages to '$FILE...'"
        yay -Qqet > "$FILE"
    fi
    if command -v apt &> /dev/null; then
        FILE="$ROOT_DIR/packages.apt.txt"
        echo "TODO: Exporting 'apt' packages to '$FILE...'"
    fi
}
