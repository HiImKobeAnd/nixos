{ ... }:
{
  flake.nixosModules.distrobox =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        distrobox
      ];
      hardware.nvidia-container-toolkit.enable = true;
    };
}
