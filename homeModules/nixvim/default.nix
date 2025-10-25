{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];
  programs.nixvim = import ./nixvim.nix { inherit pkgs lib config; };
}
