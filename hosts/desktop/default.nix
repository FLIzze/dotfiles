{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../shared/default.nix
  ];

  boot.loader.grub.device = "/dev/nvme0n1";
}
