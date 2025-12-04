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

echo "Downloading dependencies..."

# --------------------
# Utils 
# --------------------

yay -S tmux gvim hyprland hyprpaper hyprlock hypridle swaync rofi ripgrep zsh zsh-completions waybar unzip fzf xdg-utils
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# --------------------
# Driver
# --------------------

yay -S nvidia

# --------------------
# Font
# --------------------

cd ~/Downloads
curl -L -o 0xProto.zip "https://release-assets.githubusercontent.com/github-production-release-asset/27574418/a71442d6-9d7f-4ff0-8cd2-64a8fc50dbc6?sp=r&sv=2018-11-09&sr=b&spr=https&se=2025-12-04T18%3A19%3A58Z&rscd=attachment%3B+filename%3D0xProto.zip&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2025-12-04T17%3A19%3A30Z&ske=2025-12-04T18%3A19%3A58Z&sks=b&skv=2018-11-09&sig=jb8MFRLxUsgCRQZDF%2Bg%2F6DITuV8qTmdKr3z8BbNSUx0%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc2NDg3MDU4NCwibmJmIjoxNzY0ODY4Nzg0LCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.H15CThltpCUhu5iMgpvVdkYNUXN1Ds4lHXpv8YXt0_E&response-content-disposition=attachment%3B%20filename%3D0xProto.zip&response-content-type=application%2Foctet-stream"
unzip 0xProto.zip
sudo mkdir -p /usr/share/fonts/
sudo mv 0xProtoNerdFontMono-Regular.ttf /usr/share/fonts/

cd -

chsh -s $(which zsh)

echo "All done! Reboot your system now"
