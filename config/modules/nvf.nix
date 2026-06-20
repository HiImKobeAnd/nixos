{
  inputs,
  config,
  ...
}:
{
  flake.nixosModules.nvf =
    { pkgs, lib, ... }:
    {
      imports = [
        inputs.nvf.nixosModules.default
      ];
      nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      programs.nvf = {
        enable = true;
        settings = {
          vim = {
            options.tabstop = 4;

            options.shiftwidth = 4;
            searchCase = "smart";
            viAlias = false;
            vimAlias = true;

            autocomplete = {
              nvim-cmp.enable = true;
            };

            treesitter.enable = true;
            lsp = {
              enable = true;
              formatOnSave = true;
              inlayHints.enable = true;
              lightbulb.enable = true;
              lspconfig.enable = true;
            };

            languages = {
              enableExtraDiagnostics = true;
              enableFormat = true;
              enableTreesitter = true;

              nix = {
                enable = true;
                lsp.enable = true;
                treesitter.enable = true;
                format.enable = true;
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

            notes.todo-comments.enable = true;
            navigation.harpoon.enable = true;
          };
        };
      };
    };
}
