{
  config,
  pkgs,
  ...
}: {
  home.username = "hiimkobeand";
  home.homeDirectory = "/home/hiimkobeand";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "hiimkobeand";
    userEmail = "hiimkobeand@gmail.com";
  };

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [vim-lsp-settings vim-lsp vim-airline auto-pairs];
  };
}
