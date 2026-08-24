{ ... }:
{
  flake.nixosModules.distrobox =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        distrobox
      ];
      virtualisation.podman = {
        enable = true;
        dockerCompat = true;
      };
      hardware.nvidia-container-toolkit.enable = true;
    };
}
