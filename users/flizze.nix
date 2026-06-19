{ pkgs, ... }:

{
  users.users.flizze = {
    isNormalUser   = true;
    extraGroups    = [ "wheel" "networkmanager" ];
    hashedPassword = "$y$j9T$w1dKXBPvi3EFMtTY.cCGi1$UlQwNBYyVOe1zGGpQcfnraYeXoaUrcBiQqyJoyPruV/";
    shell          = pkgs.zsh;
    openssh.authorizedKeys.keys = [];
  };
}
