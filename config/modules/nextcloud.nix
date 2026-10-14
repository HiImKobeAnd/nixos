{ ... }:
{
  flake.nixosModules.nextcloud =
    { pkgs, config, ... }:
    {
      services = {
        nextcloud = {
          enable = true;
          package = pkgs.nextcloud35;
          hostName = "localhost";
          autoUpdateApps.enable = true;
          config = {
            dbtype = "sqlite";
            adminpassFile = "/etc/nextcloud-admin-pass";
          };
          extraAppsEnable = true;
          extraApps = {
            inherit (pkgs.nextcloud35Packages.apps) calendar contacts;
          };
        };
        nginx.virtualHosts."${config.services.nextcloud.hostName}".listen = [
          {
            addr = "127.0.0.1";
            port = 8080;
          }
        ];
      };
    };
}
