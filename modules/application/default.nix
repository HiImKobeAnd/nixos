{ lib, ... }:
{
  imports = [
    ./development.nix
    ./terminal-utils.nix
    ./games.nix
    ./socials.nix
    ./misc.nix
    ./librewolf.nix
  ];
  games.enable = lib.mkDefault true;
  socials.enable = lib.mkDefault true;
}
