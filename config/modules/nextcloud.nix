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
        database.createLocally = true;
        config.dbtype = "pgsql";
        secretFile = config.sops.templates."nextcloud-secrets.json".path;
        settings = {
          trusted_proxies = ["127.0.0.1"];
          overwriteprotocol = "https";
          maintenance_window_start = 1;
          default_phone_region = "DK";
          log_type = "file";
          serverid = 0;
          mail_smtpmode = "smtp";
          mail_sendmailmode = "smtp";
          mail_from_address = "hiimkobeand";
          mail_domain = "gmail.com";
          mail_smtphost = "smtp.gmail.com";
          mail_smtpport = 465;
          mail_smtpsecure = "ssl";
          mail_smtpauth = true;
          mail_smtpname = "hiimkobeand@gmail.com";
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
      postgresql = {
        enable = true;
        ensureDatabases = ["nextcloud"];
        ensureUsers = [
          {
            name = "nextcloud";
            ensureDBOwnership = true;
          }
        ];
      };
    };
    sops.templates."nextcloud-secrets.json" = {
      owner = "nextcloud";
      group = "nextcloud";
      content = builtins.toJSON {
        mail_smtppassword = config.sops.placeholder."nextcloud-smtp-password";
      };
    };
    sops.secrets."nextcloud-smtp-password" = {
      owner = "nextcloud";
      group = "nextcloud";
    };
  };
}
