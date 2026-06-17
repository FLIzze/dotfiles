{ pkgs, ... } : {
  home.packages = [ pkgs.niri ];

  xdg.configFile."niri/config.kdl".text = builtins.readFile ./config.kdl;
}
