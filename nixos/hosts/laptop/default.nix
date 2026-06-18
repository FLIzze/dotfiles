{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../shared/default.nix
  ];

  boot.loader.grub.device = "/dev/sda1";
}
