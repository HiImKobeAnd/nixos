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

  programs.bash = {
    enable = true;
    initExtra = "fish";
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --group-directories-first";
      la = "eza --all";
      lt = "eza -R --level=1";
      ltt = "eza -R --level=2";
      lttt = "eza -R --level=3";
    };
    shellInit = "
    set fish_gretting
    set -g fish_prompt_pwd_dir_length 0
    ";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    extraOptions = ["--icons=auto"];
  };
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = ["gsconnect@andyholmes.github.io"];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = "false";
      font-antialiasing = "grayscale";
      font-hinting = "slight";
    };
    "org/gnome/desktop/wm/keybindings" = {
      maximize = ["<Super>m"];
      minimize = ["<Super>h"];
      move-to-workspace-left = ["<Ctrl><Shift><Super>Left"];
      move-to-workspace-right = ["<Ctrl><Shift><Super>Right"];
      switch-to-workspace-left = ["<Ctrl><Super>Left"];
      switch-to-workspace-right = ["<Ctrl><Super>Right"];
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Open Browser";
      command = "firefox";
      binding = "<Ctrl>n";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Open Terminal";
      command = "alacritty";
      binding = "<Super>t";
    };
  };
}
