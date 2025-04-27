{ ... }:
{
  imports = [
    ./misc.nix
    ./syncthing.nix
    ./ollama.nix
    ./controllers.nix
    ./keyd.nix
    ./docker.nix
    ./ssh.nix
    ./matrix.nix
    ./pufferpanel.nix
    ./readeck.nix
    ./paperless.nix
  ];
}
