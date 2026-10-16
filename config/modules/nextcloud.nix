{ ... }:
{
  flake.nixosModules.nextcloud =
    { pkgs, config, ... }:
    {
      services = {
        nextcloud = {
          enable = true;
          package = pkgs.nextcloud35;
          hostName = "cloud.hs.hiimkobeand.internal";
          autoUpdateApps.enable = true;
          config = {
            dbtype = "sqlite";
            adminpassFile = "/etc/nextcloud-admin-pass";
          };
          settings = {
            trusted_proxies = [ "127.0.0.1" ];
          };
          extraAppsEnable = true;
          extraApps = {
            inherit (pkgs.nextcloud35Packages.apps) calendar contacts;
          };
        };
        nginx.virtualHosts."localhost".listen = [
          {
            addr = "127.0.0.1";
            port = 8080;
          }
        ];
      };
    };
}
