{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    clipboard.providers.wl-copy.enable = true;
    clipboard.register = "unnamedplus";
    globals.mapleader = " ";
    colorschemes.gruvbox.enable = true;
    opts = {
      undofile = true;
      undolevels = 10000;

      breakindent = true;

      relativenumber = true;

      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;

      updatetime = 250;
      timeoutlen = 300;

      completeopt = "menuone,noselect";

      termguicolors = true;

      mouse = "a";

      ignorecase = true;
      smartcase = true;

      signcolumn = "yes";
    };
    keymaps = [
      {
        action = "<cmd> vim.lsp.buf.declaration()";
        mode = "n";
        key = "gD";
      }
      {
        action = "<cmd> vim.lsp.buf.definition()";
        mode = "n";
        key = "gd";
      }
    ];
    performance = {
      byteCompileLua.enable = true;
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          "fzf-lua"
        ];
      };
    };
    extraConfigLua = ''
      require('cmp').event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
    '';
    plugins = {
      lualine.enable = true;
      comment.enable = true;
      web-devicons.enable = true;
      auto-session.enable = true;
      nvim-autopairs.enable = true;
      undotree.enable = true;
      which-key.enable = true;
      fzf-lua = {
        enable = true;
        profile = "default";
        keymaps = {
          "<leader>f" = {
            action = "files";
            options = {
              desc = "Open file picker";
            };
          };
          "<leader>g" = {
            action = "live_grep";
            options = {
              desc = "Live Grep";
            };
          };
          "<leader>lr" = {
            action = "lsp_references";
            options = {
              desc = "References";
            };
          };
          "<leader>ls" = {
            action = "lsp_workspace_symbols";
            options = {
              desc = "Symbols";
            };
          };
          "<leader>ld" = {
            action = "lsp_definitions";
            options = {
              desc = "Definitions";
            };
          };
          "<leader>lD" = {
            action = "lsp_declarations";
            options = {
              desc = "Declarations";
            };
          };
          "<leader>d" = {
            action = "diagnostics_document";
            options = {
              desc = "Diagnostics Documents";
            };
          };
          "<leader>D" = {
            action = "diagnostics_workspace";
            options = {
              desc = "Diagnostics Workspace";
            };
          };
        };
      };

      lsp = {
        enable = true;
        inlayHints = false;
        servers = {
          html.enable = true;
          lua_ls.enable = true;
          ts_ls.enable = true;
          nil_ls = {
            enable = true;
            settings.formatting.command = [ "nixfmt" ];
          };
          jsonls.enable = true;
          yamlls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
            installRustfmt = true;
            settings.checkOnSave = true;
          };
          htmx.enable = true;
          eslint.enable = true;
        };
      };
      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };
      lsp-signature = {
        enable = true;
        settings = {
          bind = true;
          floating_window = true;
          always_trigger = true;
          time_interval = 200;
        };
      };
      telescope = {
        enable = true;
        extensions = {
          manix.enable = true;
          fzf-native.settings = {
            case_mode = "smart_case";
            fuzzy = true;
            override_file_sorter = true;
            override_generic_sorter = true;
          };
        };
      };
      treesitter = {
        enable = true;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          json
          lua
          nix
          regex
          markdown
          toml
          yaml
          javascript
          rust
        ];
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lsp-signature-help.enable = true;
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-y>" = "cmp.mapping.confirm({select = true})";
          };
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "nvim_lsp_signature_help"; }
            { name = "luasnip"; }
            { name = "buffer"; }
          ];
        };
      };
    };
  };
}
