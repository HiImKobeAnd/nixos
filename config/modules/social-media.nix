{ ... }:
{
  flake.nixosModules.social-media =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        # gajim
        # element-desktop
        grayjay
      ];
    };
}
