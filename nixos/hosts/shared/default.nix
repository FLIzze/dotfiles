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
    systemd-boot.enable      = true;
    efi.canTouchEfiVariables = true;
  };

  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Paris";

  programs.steam.enable = true;
  programs.zsh.enable   = true;

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
    wget 
    zip 
    unzip 
    tree 
    ripgrep 
    home-manager 
    vim
  ];

  security.pam.services.swaylock = {};

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin        = "no";
      PasswordAuthentication = false;
    };
  };

  system.stateVersion = "25.11";
}
