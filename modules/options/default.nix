{ ... }:
{
  imports = [
    ./desktop-environment.nix
    ./sound.nix
    ./nvidia.nix
    ./applications.nix
    ./services.nix
  ];
}
