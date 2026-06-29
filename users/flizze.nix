{ pkgs, ... }:

{
  users.users.flizze = {
    isNormalUser   = true;
    extraGroups    = [ "wheel" "networkmanager" "docker" "virtualbox" ];
    shell          = pkgs.zsh;
    openssh.authorizedKeys.keys = [];
  };
}
