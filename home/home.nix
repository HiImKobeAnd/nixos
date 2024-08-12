{
  config,
  pkgs,
  nixcord,
  ...
}: {
  home = {
    username = "hiimkobeand";
    homeDirectory = "/home/hiimkobeand";
    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "hiimkobeand";
      userEmail = "hiimkobeand@gmail.com";
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [ale vim-airline auto-pairs ctrlp fugitive vim-prettier];
      extraConfig = "
    let g:ale_fix_on_save = 1
    let g:ale_compeltion_enabled = 1
    let g:ale_use_neovim_diagnostics_api = 1
    set number relativenumber
    set ignorecase
    set smartcase
    set expandtab
    set tabstop=2
    set shiftwidth=2
    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)
    autocmd FileType nix let b:ale_fixers = {'nix': ['alejandra']}
    ";
    };

    firefox = {
      enable = true;
    };

    bash = {
      enable = true;
      initExtra = "fish";
    };

    fish = {
      enable = true;
      shellAliases = {
        ls = "eza --group-directories-first";
        la = "eza --all";
        lt = "eza -R --level=1";
        ltt = "eza -R --level=2";
        lttt = "eza -R --level=3";
      };
      interactiveShellInit = "
    set fish_gretting ''
	    ";
      shellInit = "
    set fish_prompt_pwd_dir_length 0
    ";
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [
        "--cmd cd"
      ];
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    eza = {
      enable = true;
      enableFishIntegration = true;
      extraOptions = ["--icons=auto"];
    };

    gh.enable = true;

    nixcord = {
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
  };
  imports = [./dconf.nix];
}
