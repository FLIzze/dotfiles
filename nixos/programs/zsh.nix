{ ... } : {
  programs.zsh = {
    enable = true;

    oh-my-zsh = { 
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "robbyrussell";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
