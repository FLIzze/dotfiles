{ inputs, pkgs, ... }:

{
  services.pipewire = {
    enable            = true;
    alsa.enable       = true;
    alsa.support32Bit = true;
    pulse.enable      = true;
    jack.enable       = true;
  };

  boot.loader = {
    loader = {
      systemd-boot.enable      = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";

  nixpkgs = {
    overlays = [
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.unstable-packages
    ];
    config.allowUnfree = true;
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry        = "";
    };
    channel.enable = false;
  };

  fonts = {
    packages = with pkgs; [ nerd-fonts.iosevka-term ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "IosevkaTerm Nerd Font" ];
        sansSerif = [ "IosevkaTerm Nerd Font" ];
        serif     = [ "IosevkaTerm Nerd Font" ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    wget fuzzel vim swaylock swaybg tmux git zip unzip tree foot ripgrep niri fzf fastfetch home-manager protonvpn-gui
    qbittorrent mpv waybar
  ];

  programs.zsh.enable     = true;
  programs.steam.enable   = true;
  programs.firefox.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin        = "no";
      PasswordAuthentication = false;
    };
  };

  system.stateVersion = "25.11";
}
