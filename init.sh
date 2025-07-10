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
mkdir -p ~/.config/i3 ~/.config/i3status ~/.config/nvim

echo "Creating symlinks..."

link "$DOTFILES/alacritty/.alacritty.toml" ~/.alacritty.toml
link "$DOTFILES/i3/config" ~/.config/i3/config
link "$DOTFILES/i3/i3status/config" ~/.config/i3status/config
link "$DOTFILES/i3/.xinitrc" ~/.xinitrc
link "$DOTFILES/nvim" ~/.config/nvim
link "$DOTFILES/tmux/.tmux.conf" ~/.tmux.conf
link "$DOTFILES/.bashrc" ~/.bashrc
link "$DOTFILES/.bash_aliases" ~/.bash_aliases

echo "Copying hosts file to /etc/hosts (requires sudo)..."
sudo cp "$DOTFILES/hosts" /etc/hosts

echo "All done!"
