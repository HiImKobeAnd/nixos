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

          vim.lsp = {
            enable = true;
          };

          vim = {
            viAlias = false;
            vimAlias = true;
          };
          vim.languages = {
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
          vim = {
            notes.todo-comments.enable = true;
            navigation.harpoon.enable = true;
          };
        };
      };
    };
}
