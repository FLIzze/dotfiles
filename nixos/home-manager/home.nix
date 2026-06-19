{
	inputs,
	lib,
	config,
	pkgs,
	...
} : {
  imports = [
    ../programs/vim/vim.nix
    ../programs/niri/niri.nix
    ../programs/tmux/tmux.nix
    ../programs/zsh.nix
    ../programs/foot.nix
    ../programs/git.nix
    ../programs/firefox.nix
    ../programs/mpv.nix
  ];

  nixpkgs = {
    config = { 
      allowUnfree = true;
	};
  };

  home = {
    username = "flizze";
    homeDirectory = "/home/flizze";
    packages = with pkgs; [
      fuzzel 
      swaylock 
      swaybg 
      fzf 
      fastfetch 
      protonvpn-gui
      qbittorrent 
      bat
      waybar
    ];
    file.".vim/undodir/.keep".text = "";

    stateVersion = "25.11";
  };
}
