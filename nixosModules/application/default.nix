{lib, ...}: {
  imports = [
    ./development.nix
    ./games.nix
    ./socials.nix
    ./misc.nix
  ];
  games.enable = lib.mkDefault true;
  socials.enable = lib.mkDefault true;
}
