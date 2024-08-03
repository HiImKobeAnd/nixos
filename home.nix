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
    plugins = with pkgs.vimPlugins; [ale vim-airline auto-pairs];
    extraConfig = "
    let g:ale_fix_on_save = 1
    autocmd FileType nix let b:ale_fixers = {'nix': ['alejandra']}
    ";
  };
  programs.firefox = {
    enable = true;
  };
}
