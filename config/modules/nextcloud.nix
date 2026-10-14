{ ... }:
{
  flake.nixosModules.nextcloud =
    { pkgs, ... }:
    {
      services = {
        nextcloud = {
          enable = true;
          package = pkgs.nextcloud35;
          hostName = "localhost";
          autoUpdateApps.enable = true;
          https = true;
          config = {
            dbtype = "sqlite";
            adminpassFile = "/etc/nextcloud-admin-pass";
          };
          extraAppsEnable = true;
          extraApps = {
            inherit (pkgs.nextcloud35Packages.apps) calendar contacts;
          };
        };
      };
    };
}
