{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixcord.homeManagerModules.nixcord
    ./dconf.nix
  ];

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
      extraPackages = with pkgs; [
        xclip
        lua-language-server
        nil
      ];
      plugins = with pkgs.vimPlugins; [
        comment-nvim

        nvim-lspconfig

        nvim-cmp

        cmp-buffer
        cmp-path
        cmp-nvim-lsp

        telescope-nvim

        telescope-fzf-native-nvim

        luasnip
        friendly-snippets
        lualine-nvim
        auto-pairs
        ctrlp
        fugitive
        vim-nix
        neodev-nvim
        {
          plugin = nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-javascript
            p.tree-sitter-rust
          ]);
        }
      ];
      extraLuaConfig = "
      ${builtins.readFile ./nvim/options.lua}
      ${builtins.readFile ./nvim/other.lua}
      ${builtins.readFile ./nvim/plugin/lsp.lua}
      ${builtins.readFile ./nvim/plugin/cmp.lua}
      ${builtins.readFile ./nvim/plugin/telescope.lua}
      ${builtins.readFile ./nvim/plugin/treesitter.lua}
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

        #Since I can't find an option to change the directory where my data is stored, I need to use the following alias:
        zathura = "zathura --fork -d ~/Documents/Bøger/zathura";
      };
      shellInit = "
      set -U fish_greeting 
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

    zathura = {
      enable = true;
      options = {
        continuous-hist-save = "true";
        database = "sqlite";
      };
    };

    nixcord = {
      enable = true;
      openASAR.enable = false;
      config = {
        themeLinks = ["https://catppuccin.github.io/discord/dist/catppuccin-macchiato-flamingo.theme.css"];
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
}
