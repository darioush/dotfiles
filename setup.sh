#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
    local src="$DOTFILES_DIR/$1"
    local dst="$2"

    if [ -L "$dst" ]; then
        rm "$dst"
    elif [ -e "$dst" ]; then
        echo "Backing up $dst -> ${dst}.bak"
        mv "$dst" "${dst}.bak"
    fi

    mkdir -p "$(dirname "$dst")"
    ln -s "$src" "$dst"
    echo "Linked $dst -> $src"
}

link .vim        "$HOME/.vim"
link .vimrc      "$HOME/.vimrc"
link .tmux.conf  "$HOME/.tmux.conf"
link nvim        "$HOME/.config/nvim"

echo "Done. Open nvim to auto-install plugins via lazy.nvim."
