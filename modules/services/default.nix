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
    ./conduwuit.nix
    ./pufferpanel.nix
  ];
}
