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

  xdg.desktopEntries = {
    windows = {
      name = "windows 11";
      genericName = "Virtual machine";
      exec = "quickemu --vm /home/hiimkobeand/VM/quickemu/windows-11.conf --display spice";
      terminal = false;
      categories = ["Utility"];
    };
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "hiimkobeand";
      userEmail = "hiimkobeand@gmail.com";
      aliases = {
        st = "status";
        aa = "add -A";
        cc = "!koji";
        ll = "log --oneline --decorate --graph";
        last = "log -1 HEAD";
        unstage = "reset HEAD --";
      };
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
        c2odt = "libreoffice --headless --convert-to odt *.docx";
        opgaver = "~/Documents/Scripts/convert_opgaver.sh";
        o = "xdg-open";

        #Since I can't find an option to change the directory where my data is stored, I need to use the following alias:
        zathura = "zathura --fork -d ~/Documents/Books/zathura";
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

    sioyek = {
      enable = true;
      config = {
        "shared_database_path" = "/home/hiimkobeand/Documents/Books/sioyek";
      };
    };

    nixcord = {
      enable = true;
      discord.openASAR.enable = false;
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
          youtubeAdblock.enable = true;
          messageClickActions.enable = true;
          noTrack.enable = true;
          shikiCodeblocks.enable = true;
          volumeBooster.enable = true;
          dearrow.enable = true;
          dearrow.hideButton = true;
          moreCommands.enable = true;
          reverseImageSearch.enable = true;
        };
      };
    };
  };
}
