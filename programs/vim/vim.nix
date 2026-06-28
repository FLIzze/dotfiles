{ pkgs, ... } : {
  programs.vim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      fzf-vim
      vim-surround
      vim-commentary
      vim-fugitive
    ];

    extraConfig = builtins.readFile ./.vimrc;
  };
}
