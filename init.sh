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
mkdir -p ~/.config/hypr/ ~/.config/rofi/ ~/.config/kitty ~/.config/waybar

echo "Creating symlinks..."

link "$DOTFILES/hypr" ~/.config/hypr
link "$DOTFILES/waybar" ~/.config/waybar
link "$DOTFILES/rofi/" ~/.config/rofi
link "$DOTFILES/kitty/" ~/.config/kitty

link "$DOTFILES/.vimrc" ~/.vimrc
link "$DOTFILES/.tmux.conf" ~/.tmux.conf
link "$DOTFILES/.zshrc" ~/.zshrc
link "$DOTFILES/.emacs.el" ~/.emacs.el

echo "Downloading dependencies..."

# --------------------
# Utils
# --------------------

# yay -S tmux gvim hyprland hyprpaper hyprlock hypridle swaync rofi ripgrep zsh zsh-completions waybar unzip fzf xdg-utils dolphin hyprshot
# curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
# sudo systemctl enable --now bluetooth.service

# --------------------
# Driver
# --------------------

# yay -S nvidia

# chsh -s $(which zsh)

echo "All done! Reboot your system now"
