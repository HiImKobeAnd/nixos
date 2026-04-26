{ ... }:
{
  flake.nixosModules.ollama =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ollama
        alpaca
      ];
      services.ollama = {
        enable = true;
        acceleration = "cuda";
      };
      nix.settings.substituters = [ "https://cache.nixos-cuda.org" ];
      nix.settings.trusted-public-keys = [
        "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      ];
    };
}
