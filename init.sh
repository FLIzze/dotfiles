#!/bin/bash

set -euo pipefail

DOTFILES="$HOME/dotfiles"

backup_and_link() {
  local src=$1
  local dest=$2

  if [ -L "$dest" ]; then
    echo "Removing existing symlink: $dest"
    rm "$dest"
  elif [ -e "$dest" ]; then
    echo "Backing up existing file: $dest -> ${dest}.backup"
    mv "$dest" "${dest}.backup"
  fi

  ln -s "$src" "$dest"
  echo "Linked $src -> $dest"
}

echo "Creating config directories..."
mkdir -p ~/.config/alacritty 2>/dev/null
mkdir -p ~/.config/i3 2>/dev/null
mkdir -p ~/.config/i3status 2>/dev/null
mkdir -p ~/.config/nvim 2>/dev/null

echo "Symlinking configs..."

backup_and_link "$DOTFILES/alacritty/enfocado_light.toml" ~/.config/alacritty/alacritty.yml
backup_and_link "$DOTFILES/i3/config" ~/.config/i3/config
backup_and_link "$DOTFILES/i3/i3status/config" ~/.config/i3status/config
backup_and_link "$DOTFILES/nvim" ~/.config/nvim
backup_and_link "$DOTFILES/tmux/.tmux.conf" ~/.tmux.conf
backup_and_link "$DOTFILES/tmux/.push.sh" ~/.push.sh
backup_and_link "$DOTFILES/tmux/.tmux-sessionizer" ~/.tmux-sessionizer
backup_and_link "$DOTFILES/i3/.xinitrc" ~/.xinitrc
backup_and_link "$DOTFILES/.bashrc" ~/.bashrc
backup_and_link "$DOTFILES/.bash_aliases" ~/.bash_aliases

echo "Copying hosts file to /etc/hosts (requires sudo)..."
sudo cp "$DOTFILES/hosts" /etc/hosts

echo "Done! Your dotfiles are set up."
