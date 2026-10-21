{ inputs, ... }:
{
  flake.nixosModules.nvf = { ... }: {
    imports = [
      inputs.nvf.nixosModules.default
    ];
    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    programs.nvf = {
      enable = true;
      settings = import ../../extra/nvf.nix;
    };
  };

  perSystem =
    { pkgs, ... }:
    let
      nvfConfig = inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [
          (import ../../extra/nvf.nix)
        ];
      };
      nvfPackage = nvfConfig.neovim;
    in
    {
      packages.nvf = nvfPackage;
      apps.nvf = {
        type = "app";
        meta.description = "My neovim config";
        program = "${nvfPackage}/bin/nvim";
      };
    };
}
