{...}: {
  imports = [
    ./services.nix
    ./flatpak.nix
    ./syncthing.nix
    #./ollama.nix
    ./8bitdo.nix
    ./docker.nix
  ];
}
