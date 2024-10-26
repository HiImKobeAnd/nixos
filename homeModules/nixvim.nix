{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    clipboard.providers.wl-copy.enable = true;
    globals.mapleader = " ";
    opts = {
      undofile = true;
      undolevels = 10000;

      number = true;

      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;

      updatetime = 200;

      termguicolors = true;

      mouse = "a";

      ignorecase = true;
      smartcase = true;
    };
    plugins = {
      lualine.enable = true;
      nvim-autopairs.enable = true;
      luasnip.enable = true;
      lsp-format.enable = true;
      comment.enable = true;
      web-devicons.enable = true;
      fzf-lua = {
        enable = true;
        profile = "default";
        keymaps = {
          "<C-p>" = "files";
          "<leader>fg" = "live_grep";
          "<leader>km" = "keymaps";
          "<leader>gs" = "git_status";
          "<leader>sd" = "diagnostics_document";
          "<leader>sD" = "diagnostics_workspace";
        };
      };

      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          html.enable = true;
          lua_ls.enable = true;
          nil_ls.enable = true;
          ts_ls.enable = true;
          jsonls.enable = true;
          yamlls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          htmx.enable = true;
          eslint.enable = true;
        };
      };
      telescope = {
        enable = true;
        extensions = {
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
        settings = {
          auto_install = true;
          highlight.enable = true;
          indent.enable = true;
        };
      };
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            nix = "nixfmt";
            javascript = "prettier";
            typescript = "prettier";
            rust = "rustfmt";
            yaml = "yamlfmt";
            css = "prettier";
            html = "prettier";
            json = "prettier";
            lua = "stylua";
          };
          format_on_save = "fallback";
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          preselect = "cmp.PreselectMode.Item";
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<Up>" = "cmp.mapping.select_prev_item()";
            "<Down>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<CR>" = "cmp.mapping.confirm({select = false})";
          };
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
          ];
        };
      };
    };
  };
}
