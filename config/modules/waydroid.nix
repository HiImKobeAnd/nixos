{ lib, ... }:
{
  flake.nixosModules.waydroid =
    { pkgs, ... }:
    {
      virtualisation.waydroid.enable = true;
      virtualisation.waydroid.package = pkgs.waydroid-nftables;

      environment.systemPackages = [ pkgs.wl-clipboard ];

      systemd.services.waydroid-container = {
        after = [ "graphical.target" ];
        wantedBy = lib.mkForce [ "graphical.target" ];
      };
    };
}
