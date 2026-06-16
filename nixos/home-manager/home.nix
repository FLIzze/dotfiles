{
	inputs,
	lib,
	config,
	pkgs,
	...
} : {
  imports = [
    ../programs/vim.nix
    ../programs/niri.nix
    ../programs/zsh.nix
    ../programs/foot.nix
    ../programs/git.nix
    ../programs/tmux.nix
  ];

  nixpkgs = {
    config = { 
      allowUnfree = true;
	};
  };

  home = {
    username = "flizze";
    homeDirectory = "/home/flizze";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
