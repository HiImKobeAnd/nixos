{ ... }:
{
  flake.nixosModules.blender =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        (blender.override {
          config.cudaSupport = true;
          config.rocmSupport = false;
        })
      ];
      nix.settings.substituters = [ "https://cache.nixos-cuda.org" ];
      nix.settings.trusted-public-keys = [
        "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      ];
    };
}
