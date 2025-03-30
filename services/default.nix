{ ... }:
{
  imports = [
    ./services.nix
    ./flatpak.nix
    ./syncthing.nix
    #./ollama.nix
    ./8bitdo.nix
    ./keyd.nix
    ./docker.nix
  ];
}
