{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./gnome.nix
    ./cosmic-de.nix
  ];

  gnome.enable = lib.mkDefault true;
}
