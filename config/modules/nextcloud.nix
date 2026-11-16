{config, ...}: {
  flake.nixosModules.nextcloud = {pkgs, ...}: {
    services = {
      nextcloud = {
        enable = true;
        package = pkgs.nextcloud35;
        hostName = "cloud.hiimkobeand.net";
        autoUpdateApps.enable = true;
        config.dbtype = "sqlite";
        https = true;
        settings = {
          trusted_proxies = ["127.0.0.1"];
          maintenance_window_start = 1;
          default_phone_region = "DK";
          log_type = "systemd";
          serverid = 0;
        };
        phpOptions = {
          "opcache.interned_strings_buffer" = "32";
        };

        extraAppsEnable = true;
        extraApps = {
          inherit (pkgs.nextcloud35Packages.apps) calendar contacts tasks;
        };
      };
      cloudflared = {
        tunnels = {
          "331184be-4ece-4987-8c72-a9651288b692" = {
            credentialsFile = config.sops.secrets."cloudflare_tunnel_key".path;
            warp-routing.enabled = true;
          };
        };
      };
    };
  };
}
