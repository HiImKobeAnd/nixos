{lib, ...}: {
  imports = [
    ./gnome.nix
    ./cosmic-de.nix
  ];

  gnome.enable = true;
  cosmic-de.enable = false;
}
