{ inputs, ... }: {
  flake.nixosModules.nvf = { ... }: {
    imports = [
      inputs.nvf.nixosModules.default
    ];
    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          viAlias = false;
          vimAlias = true;

          options.tabstop = 2;
          options.shiftwidth = 2;
          options.mouse = "a";
          searchCase = "smart";
          undoFile.enable = true;

          telescope.enable = true;
          treesitter.enable = true;
          lazy.enable = true;
          autopairs.nvim-autopairs.enable = true;

          theme = {
            enable = true;
            name = "gruvbox";
            style = "dark";
          };

          binds = {
            whichKey.enable = true;
            # hardtime-nvim.enable = true;
            # hardtime-nvim.setupOpts = {
            # disable_mouse = false;
            # };
          };

          statusline = {
            lualine.enable = true;
          };

          snippets.luasnip.enable = true;
          autocomplete.blink-cmp = {
            enable = true;
            mappings.confirm = "C-Y";
          };

          session.nvim-session-manager = {
            enable = true;
            setupOpts.autoload_mode = "CurrentDir";
          };

          lsp = {
            enable = true;
            formatOnSave = true;
            inlayHints.enable = true;
            lightbulb.enable = true;
            lspconfig.enable = true;
          };

          visuals = {
            nvim-web-devicons.enable = true;
            fidget-nvim.enable = true;
          };

          notes.todo-comments.enable = true;

          ui = {
            borders.enable = true;
            ui2.enable = true;
          };

          vendoredKeymaps.enable = false;

          comments = {
            comment-nvim.enable = true;
          };

          clipboard = {
            enable = true;
            providers.wl-copy.enable = true;
            registers = "unnamedplus";
          };

          diagnostics = {
            nvim-lint.enable = true;
          };

          debugger = {
            nvim-dap = {
              enable = true;
              ui.enable = true;
            };
          };

          spellcheck.enable = true;

          languages = {
            enableExtraDiagnostics = true;
            enableFormat = true;
            enableTreesitter = true;

            nix = {
              enable = true;
              format.type = [ "nixfmt" ];
              lsp.servers = [ "nixd" ];
            };
            rust.enable = true;
            fish.enable = true;
            elixir.enable = true;
            docker.enable = true;
            bash.enable = true;
            go.enable = true;
            make.enable = true;
            env.enable = true;
            html.enable = true;
            json.enable = true;
            just.enable = true;
            lua.enable = true;
            markdown.enable = true;
            python.enable = true;
            sql.enable = true;
            css.enable = true;
            toml.enable = true;
            typescript.enable = true;
          };
        };
      };
    };
  };
}
