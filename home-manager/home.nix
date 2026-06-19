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

  programs = {
    obs-studio.enable = true;
  };

  services.mako = {
    enable = true;

    settings.default-timeout = 10000; 
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
      hyprpicker
      xwayland-satellite
      pandoc
      onlyoffice-desktopeditors
      prismlauncher
      spotify
      libnotify
      playerctl
      brightnessctl
    ];
    file.".vim/undodir/.keep".text = "";

    stateVersion = "25.11";
  };
}
