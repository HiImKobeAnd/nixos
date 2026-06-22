{
  inputs,
  ...
}:
{
  flake.nixosModules.nvf =
    {
      ...
    }:
    {
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
            searchCase = "smart";
            undoFile.enable = true;

            lazy.enable = false;
            autopairs.nvim-autopairs.enable = true;

            keymaps = [
              {
                mode = [
                  "n"
                  "v"
                ];
                key = "<Space>";
                action = "<Nop>";
                silent = true;
              }
            ];

            binds = {
              # whichKey.enable = true;
              hardtime-nvim.enable = true;
            };

            statusline = {
              lualine.enable = true;
            };

            telescope.enable = true;

            snippets.luasnip.enable = true;
            autocomplete.nvim-cmp.enable = true;

            session.nvim-session-manager = {
              enable = true;
              setupOpts.autoload_mode = "CurrentDir";
            };

            treesitter.enable = true;
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
            navigation.harpoon.enable = true;
            treesitter.context.enable = true;

            ui = {
              borders.enable = true;
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
                #format.type = [ "nixfmt" ];
                #lsp.servers = [ "nixd" ];
              };
              rust.enable = true;
              fish.enable = true;
              # elixir.enable = true;
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
