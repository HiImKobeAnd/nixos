{lib, ...}: {
  imports = [
    ./gnome.nix
    ./cosmic-de.nix
  ];

  gnome.enable = lib.mkDefault true;
  cosmic-de.enable = lib.mkDefault false;
}