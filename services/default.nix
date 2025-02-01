{...}: {
  imports = [
    ./services.nix
    ./flatpak.nix
    ./syncthing.nix
    ./ollama.nix
  ];
}
