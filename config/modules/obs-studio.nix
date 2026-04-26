{ ... }:
{
  flake.nixosModules.obs-studio =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        obs-studio
      ];
      programs.obs-studio = {
        enable = true;
        package = (
          pkgs.obs-studio.override {
            cudaSupport = true;
          }
        );
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-pipewire-audio-capture
          obs-backgroundremoval
        ];
      };
      nix.settings.substituters = [ "https://cache.nixos-cuda.org" ];
      nix.settings.trusted-public-keys = [
        "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      ];
    };
}
