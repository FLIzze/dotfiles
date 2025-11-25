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
mkdir -p ~/.config/hypr/ ~/.config/rofi/ ~/.config/kitty

echo "Downloading dependencies..."

# yay -S tmux gvim hyprland hyprpaper hyprlock hypridle swaync rofi ripgrep zsh zsh-completions
# curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

echo "Creating symlinks..."

link "$DOTFILES/hypr/hyprland.conf" ~/.config/hypr/hyprland.conf
link "$DOTFILES/hypr/hyprlock.conf" ~/.config/hypr/hyprlock.conf
link "$DOTFILES/hypr/hyprpaper.conf" ~/.config/hypr/hyprpaper.conf
link "$DOTFILES/hypr/hypridle.conf" ~/.config/hypr/hypridle.conf
link "$DOTFILES/rofi/" ~/.config/rofi
link "$DOTFILES/kitty/" ~/.config/kitty
link "$DOTFILES/.tmux.conf" ~/.tmux.conf
link "$DOTFILES/.zshrc" ~/.zshrc
link "$DOTFILES/.vimrc" ~/.vimrc

echo "All done!"
