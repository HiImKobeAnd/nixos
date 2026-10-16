{ ... }:
{
  flake.nixosModules.headscale =
    { pkgs, ... }:
    {
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
                  value = "100.100.100.100";
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
                extraConfig = ''
                  proxy_http_version 1.1;
                  proxy_set_header Upgrade $http_upgrade;
                  proxy_set_header Connection $connection_upgrade;
                  proxy_set_header Host $host;
                  proxy_set_header True-Client-IP $remote_addr;
                  proxy_set_header X-Real-IP $remote_addr;
                  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                  proxy_set_header X-Forwarded-Proto $scheme;
                  proxy_buffering off;
                  proxy_read_timeout 36000s;
                  proxy_send_timeout 36000s;
                '';
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
      };
    };
}
