{ ... }:
{
  flake.nixosModules.distrobox =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        distrobox
      ];
    };
}
