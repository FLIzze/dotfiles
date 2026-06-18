{ pkgs, ... }:

{
  users.users.flizze = {
    isNormalUser = true;
    extraGroups  = [ "wheel" "networkmanager" ];
    shell        = pkgs.zsh;
    hashedPassword = "$y$j9T$w1dKXBPvi3EFMtTY.cCGi1$UlQwNBYyVOe1zGGpQcfnraYeXoaUrcBiQqyJoyPruV/";
    openssh.authorizedKeys.keys = [];
  };
}
