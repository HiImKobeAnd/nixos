{
  inputs,
  config,
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
      programs.nixvim = import ../../nixvim/nixvim.nix { inherit pkgs lib config; };
    };
}
