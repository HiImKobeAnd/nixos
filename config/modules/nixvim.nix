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
      programs.nixvim = import ../../nixvim/nixvim.nix { inherit pkgs lib config; };
    };
}
