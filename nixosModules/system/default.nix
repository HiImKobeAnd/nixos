{...}: {
  imports = [
    ./auto-upgrade.nix
    ./garbage-collection.nix
    ./package.nix
    ./fonts.nix
    ./locale.nix
    ./sound.nix
    ./bluetooth.nix
    ./services.nix
    ./nvidia.nix
  ];
}
