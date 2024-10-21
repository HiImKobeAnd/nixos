{lib, ...}: {
  imports = [
    ./auto-upgrade.nix
    ./fonts.nix
    ./package.nix
    ./locale.nix
    ./sound.nix
    ./bluetooth.nix
    ./nvidia.nix
  ];
  nvidia.enable = lib.mkDefault true;
  virtualisation.libvirtd.enable = true;
}
