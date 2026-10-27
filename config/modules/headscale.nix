{...}: {
  flake.nixosModules.headscale = {
    pkgs,
    config,
    ...
  }: {
    services = {
      headscale = {
        enable = true;
        port = 8888;
        address = "0.0.0.0";
        settings = {
          server_url = "https://hs.hiimkobeand.net";
          dns = {
            override_local_dns = true;
            base_domain = "hs.hiimkobeand.internal";
            extra_records = [
              {
                name = "cloud.hs.hiimkobeand.internal";
                type = "A";
                value = "100.64.0.2";
              }
              {
                name = "cloud.hiimkobeand.net";
                type = "A";
                value = "100.64.0.2";
              }
            ];
            nameservers.global = [
              "9.9.9.9"
              "1.1.1.1"
              "1.0.0.1"
              "8.8.8.8"
            ];
          };
        };
      };
      nginx = {
        enable = true;
        recommendedTlsSettings = true;
        recommendedProxySettings = true;
        recommendedGzipSettings = true;
        recommendedOptimisation = true;
        virtualHosts = {
          "hs.hiimkobeand.net" = {
            forceSSL = true;
            enableACME = true;
            locations."/" = {
              proxyPass = "http://127.0.0.1:8888";
              proxyWebsockets = true;
            };
          };
        };
      };
    };
    networking.firewall.allowedTCPPorts = [
      80
      443
    ];
    security.acme = {
      defaults.email = "hiimkobeand@gmail.com";
      acceptTerms = true;
      certs = {
        "hiimkobeand.net" = {
          domain = "*.hiimkobeand.net";
          group = "nginx";
          dnsProvider = "cloudflare";
          environmentFile = config.sops.secrets."cloudflare_dns_key".path;
        };
      };
    };
  };
}
