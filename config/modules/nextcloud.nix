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
        hostName = "cloud.home.hiimkobeand.net";
        autoUpdateApps.enable = true;
        config.dbtype = "sqlite";
        settings = {
          trusted_proxies = ["127.0.0.1"];
          overwriteprotocol = "https";
          maintenance_window_start = 1;
          default_phone_region = "DK";
          log_type = "systemd";
          serverid = 0;
        };
        phpOptions = {
          "opcache.interned_strings_buffer" = "32";
        };

        appstoreEnable = true;
        extraAppsEnable = true;
        extraApps = {
          inherit (pkgs.nextcloud35Packages.apps) calendar contacts tasks;
        };
      };
    };
  };
}
