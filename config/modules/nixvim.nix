{
  inputs,
  config,
  self,
  ...
}:
{
  flake.nixosModules.nixvim =
    { pkgs, lib, ... }:
    {
      imports = [
        inputs.nixvim.nixosModules.nixvim
      ];
      nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      programs.nixvim =
        (import ../../nixvim/nixvim.nix {
          inherit
            pkgs
            lib
            config
            inputs
            self
            ;
        })
        // {
          enable = true;
        };
    };

  perSystem =
    { system, pkgs, ... }:
    let
      nixvimConfig = inputs.nixvim.lib.evalNixvim {
        inherit system;
        modules = [
          (import ../../nixvim/nixvim.nix {
            inherit
              pkgs
              inputs
              self
              ;
          })
        ];
      };
    in
    {
      packages.nvim = nixvimConfig.config.build.package;
      packages.nixvim = nixvimConfig.config.build.package;
      checks.nvim = nixvimConfig.config.build.test;
    };
}
