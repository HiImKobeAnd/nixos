{ ... }:
{
  flake.nixosModules.nextcloud =
    { pkgs, ... }:
    {
      services = {
        nextcloud = {
          enable = true;
          package = pkgs.nextcloud35;
          hostName = "cloud.hiimkobeand.net";
          autoUpdateApps.enable = true;
          config = {
            dbtype = "sqlite";
            adminpassFile = "/etc/nextcloud-admin-pass";
          };
          https = true;
          settings = {
            trusted_proxies = [ "127.0.0.1" ];
            maintenance_window_start = 1;
            default_phone_region = "DK";
            log_type = "systemd";
            serverid = 0;
          };

          extraAppsEnable = true;
          extraApps = {
            inherit (pkgs.nextcloud35Packages.apps) calendar contacts;
          };
        };
        nginx.virtualHosts."cloud.hiimkobeand.net" = {
          forceSSL = true;
          enableACME = true;
          extraConfig = ''
            allow 100.64.0.0/10;
            allow 127.0.0.1;
            deny all;
          '';
        };
      };
    };
}
