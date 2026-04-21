{ ... }:
{
  flake.nixosModules.social-media =
    { pkgs, lib, ... }:
    {
      environment.systemPackages = with pkgs; [
        # gajim
        # element-desktop
        grayjay
      ];
    };
}
