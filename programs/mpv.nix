{ pkgs, ... } : {
  programs.mpv = {
    enable = true;

    config = {
      save-position-on-quit = "yes";
    };

    scripts = with pkgs.mpvScripts; [
      uosc
      thumbfast
      chapterskip
      mpris
    ];
  };
}
