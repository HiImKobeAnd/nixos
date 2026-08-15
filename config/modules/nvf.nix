{
  inputs,
  ...
}:
{
  flake.nixosModules.nvf = { pkgs, ... }: {
    imports = [
      inputs.nvf.nixosModules.default
    ];
    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    programs.nvf = {
      enable = true;
      settings = import ../../nvf/config/settings.nix;
    };
  };

  perSystem =
    { system, pkgs, ... }:
    let
      nvfConfig = inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [
          (import ../../nvf/config/settings.nix)
        ];
      };
      nvfPackage = nvfConfig.neovim;
    in
    {
      packages.nvf = nvfPackage;
      apps.nvf = {
        type = "app";
        program = "${nvfPackage}/bin/nvim";
      };
    };
}
