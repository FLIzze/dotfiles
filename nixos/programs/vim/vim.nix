{ pkgs, ... } : {
  programs.vim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      fzf-vim
      vim-surround
      vim-commentary
      undotree
    ];

    extraConfig = builtins.readFile ./.vimrc;
  };
}
