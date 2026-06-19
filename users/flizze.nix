{ pkgs, ... }:

{
  users.users.flizze = {
    isNormalUser   = true;
    extraGroups    = [ "wheel" "networkmanager" "docker" "virtualbox" ];
    hashedPassword = "$y$j9T$w1dKXBPvi3EFMtTY.cCGi1$UlQwNBYyVOe1zGGpQcfnraYeXoaUrcBiQqyJoyPruV/";
    shell          = pkgs.zsh;
    openssh.authorizedKeys.keys = [];
  };
}
