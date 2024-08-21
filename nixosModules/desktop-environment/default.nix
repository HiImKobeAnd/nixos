{lib, ...}: {
  imports = [
    ./gnome.nix
    ./cosmic-de.nix
  ];

  gnome.enable = false;
  cosmic-de.enable = true;
}
