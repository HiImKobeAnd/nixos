{ ... }:
{
  flake.nixosModules.music =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        pear-desktop
      ];
    };
}
