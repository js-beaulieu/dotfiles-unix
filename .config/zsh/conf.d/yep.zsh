#!/usr/bin/env zsh

ROOT_DIR="$HOME/.config/zsh/conf.d"

function yep() {
    if command -v yay &> /dev/null; then
        echo "TODO: export aur packages with yay"
    fi
    if command -v pacman &> /dev/null; then
        FILE="$ROOT_DIR/packages.pacman.txt"
        echo "Exporting pacman packages to $FILE..."
        sudo pacman -Qqetn > "$FILE"
    fi
    if command -v apt &> /dev/null; then
        echo "TODO: export apt package"
    fi
}
