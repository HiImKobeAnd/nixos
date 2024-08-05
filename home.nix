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

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = ["pop-shell@system76.com
      gsconnect@andyholmes.github.io"];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = "false";
      font-antialiasing = "grayscale";
      font-hinting = "slight";
    };
    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>q"];
      maximize = ["<Super>Up"];
      minimize = ["<Super>Down"];
      move-to-workspace-down = ["<Ctrl><Super>Down"];
      move-to-workspace-up = ["<Ctrl><Super>Up"];
    };
    "org/gnome/shell/extesions/pop-shell" = {
      tile-by-default = true;
    };

    "org/gnome/settings-daemon/plugnis/media-keys/custom-keybindings/custom0" = {
      name = "Open Terminal";
      command = "firefox";
      binding = "<Ctrl>n";
    };
  };
}
