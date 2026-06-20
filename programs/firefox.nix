{ pkgs, ... } : {
  programs.firefox = {
    enable = true;
    # configPath = "${config.xdg.configHome}/mozilla/firefox";
    # TODO UPDATE THIS
    configPath = ".mozilla/firefox";

    policies = {
      DisableTelemetry = true;
      DisplayMenuBar = "never";
    };

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      search = {
        force           = true;
        default         = "ddg";
        privateDefault  = "ddg";
      };

      settings = {
        "browser.startup.homepage" = "https://duckduckgo.com/";
      };

      extensions = {
       packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
          vimium
          darkreader
        ];
      };
    };
  };
}
