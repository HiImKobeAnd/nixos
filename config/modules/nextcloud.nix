_: {
  flake.nixosModules.nextcloud = {
    config,
    pkgs,
    ...
  }: {
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
        certificateFile = config.sops.secrets."cloudflare_tunnel_key".path;
        tunnels = {
          "f4f5023a-047b-4a4e-b6c4-c06c66e09c9f" = {
            default = "http_status:404";
            credentialsFile = config.sops.secrets."server0_tunnel_key";
            warp-routing.enabled = true;
          };
        };
      };
    };
  };
}
