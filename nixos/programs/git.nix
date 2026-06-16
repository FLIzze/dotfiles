{ ... }: {
  programs.git = {
    enable = true;

    settings.user = {
      name = "flizze";
      email = "alexandre.bel@ynov.com";
    };
  };
}
