#!/bin/bash

DOTFILES="$HOME/Documents/dotfiles"

link() {
	local src=$1
	local dest=$2

	if [ -e "$dest" ] || [ -L "$dest" ]; then
		echo "Removing existing file or symlink: $dest"
		rm -rf "$dest"
	fi

	ln -s "$src" "$dest"
	echo "Linked $src -> $dest"
}

echo "Creating config directories if they don't exist..."
mkdir -p ~/.config/hypr/ ~/.config/rofi/

echo "Downloading dependencies..."

# yay -S tmux gvim hyprland hyprpaper hyprlock hypridle swaync rofi cliphist

echo "Creating symlinks..."

link "$DOTFILES/hypr/hyprland.conf" ~/.config/hypr/hyprland.conf
link "$DOTFILES/hypr/hyprlock.conf" ~/.config/hypr/hyprlock.conf
link "$DOTFILES/hypr/hyprpaper.conf" ~/.config/hypr/hyprpaper.conf
link "$DOTFILES/hypr/hypridle.conf" ~/.config/hypr/hypridle.conf
link "$DOTFILES/rofi/" ~/.config/rofi
link "$DOTFILES/tmux/.tmux.conf" ~/.tmux.conf
link "$DOTFILES/.bashrc" ~/.bashrc
link "$DOTFILES/.bash_aliases" ~/.bash_aliases
link "$DOTFILES/.vimrc" ~/.vimrc

echo "All done!"
