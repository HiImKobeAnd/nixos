{pkgs, ...}: {
  nixvim = {
    enable = true;

    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;

      shiftwidth = 2;
      ignorecase = true;
      smartcase = true;
      autoindent = true;
    };

    plugins = {
      bufferline.enable = true;
      lightline.enable = true;
      nvim-autopairs.enable = true;
      which-key.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<leader>fg" = "live_grep";
        };
        extensions.fzf-native.enable = true;
      };
      treesitter = {
        enable = true;
        nixgrammars = true;
        settings.indent.enable = true;
      };
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp = {
        experimental.ghost_text = true;
        sources = [
          "nvim_lsp"
          "path"
        ];
      };
      lsp = {
        enable = true;
        server = {
          nixd.enable = true;
        };
        keymaps.lspBuf = {
          "gd" = "definition";
          "gD" = "refernces";
          "gt" = "type_definition";
          "gi" = "implementation";
          "K" = "hover";
        };
        rust-tools.enable = true;
      };
    };
  };
}
