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
    ./cloudflared.nix
  ];
}
