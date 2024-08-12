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
      plugins = with pkgs.vimPlugins; [
        {
          plugin = comment-nvim;
          type = "lua";
          config = "require(\"Comment\").setup()";
        }

        {
          plugin = nvim-lspconfig;
          type = "lua";
          config = "./nvim/plugin/lsp.lua";
        }

        {
          plugin = nvim-cmp;
          type = "lua";
          config = "./nvim/plugin/cmp.lua";
        }

        cmp-buffer
        cmp-path
        cmp-nvim-lsp

        {
          plugin = telescope-nvim;
          type = "lua";
          config = "./nvim/plugin/telescope.lua";
        }

        telescope-fzf-native-nvim

        luasnip
        friendly-snippets
        lualine-nvim
        auto-pairs
        ctrlp
        fugitive
        vim-nix
        {
          plugin = nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-javascript
            p.tree-sitter-rust
          ]);
          type = "lua";
          config = "./nvim/plugin/treesitter.lua";
        }
      ];
      extraLuaConfig = "
      ${builtins.readFile ./nvim/options.lua}
      ${builtins.readFile ./nvim/other.lua}
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
