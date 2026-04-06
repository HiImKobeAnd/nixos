{ ... }:
{
  flake.nixosModules.waydroid =
    { pkgs, ... }:
    {
      virtualisation.waydroid.enable = true;
      environment.systemPackages = with pkgs; [
        waydroid
      ];
    };
}
