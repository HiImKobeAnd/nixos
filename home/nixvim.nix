{...}: {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    clipboard.providers.wl-copy.enable = true;
    opts = {
      undofile = true;

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
      fzf-lua.enable = true;
      lualine.enable = true;
      nvim-autopairs.enable = true;
      luasnip.enable = true;
      lsp.enable = true;
      lsp-format.enable = true;
      comment.enable = true;
      web-devicons.enable = true;
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
          format_on_save = "fallback";
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];
      };
    };
  };
}
