{
  config,
  pkgs,
  nixcord,
  catppuccin,
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

  programs.nixcord = {
    enable = true;
    config = {
      themeLinks = ["https://raw.githubusercontent.com/jack-mil/gruvy-discord/master/gruvbox-desktop.css"];
      plugins = {
        betterFolders = {
          enable = true;
          sidebarAnim = false;
          closeAllFolders = true;
          closeAllHomeButton = true;
          closeOthers = true;
        };
        callTimer.enable = true;
        clearURLs.enable = true;
        fakeNitro.enable = true;
        moreKaomoji.enable = true;
        mutualGroupDMs.enable = true;
        watchTogetherAdblock.enable = true;
        messageClickActions.enable = true;
        noTrack.enable = true;
        shikiCodeblocks.enable = true;
        volumeBooster.enable = true;
      };
    };
  };

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bindm = [
      "$mod,t,exec,alacritty"
    ];
  };

  imports = [./dconf.nix];
}
