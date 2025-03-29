{lib, ...}: {
  imports = [
    ./fonts.nix
    ./package.nix
    ./locale.nix
    ./sound.nix
    ./bluetooth.nix
    ./nvidia.nix
    ./maintenance.nix
  ];
  nvidia.enable = lib.mkDefault true;
  virtualisation.libvirtd.enable = true;
}
