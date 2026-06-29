{ inputs, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable      = true;
      efi.canTouchEfiVariables = true;
    };

    kernelParams = [
      "zswap.enabled=1"
      "zswap.compressor=zstd"
      "zswap.zpool=zsmalloc"
      ];
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8192; # 8 GiB
    }
  ];

  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Paris";

  programs = {
    steam.enable = true;
    zsh.enable   = true;
  };

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

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
    ];
    config.niri.default = [ "wlr" "gtk" ];
  };

  environment.systemPackages = with pkgs; [
    wget 
    zip 
    unzip 
    tree 
    ripgrep 
    fd
    home-manager 
    jq
    vim
  ];

  security.pam.services.swaylock = {};

  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --cmd niri-session";
          user    = "greeter";
        };
        initial_session = {
          command = "niri-session";
          user    = "flizze";
        };
      };
    };

    openssh = {
      enable = true;
      settings = {
        PermitRootLogin        = "no";
        PasswordAuthentication = false;
      };
    };

    pipewire = {
      enable            = true;
      alsa.enable       = true;
      alsa.support32Bit = true;
      pulse.enable      = true;
      jack.enable       = true;
    };
  };


  virtualisation = {
    docker.enable = true;
    virtualbox.host.enable = true;
  };

  system.stateVersion = "25.11";
}
