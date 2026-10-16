{ ... }:
{
  flake.nixosModules.netbird =
    { pkgs, ... }:
    {
      services.netbird.server = {
        enable = true;
        enableNginx = true;
        domain = "netbird.hiimkobeand.net";
        coturn = {
          enable = true;
          passwordFile = "/etc/coturn-pass";
        };

        management = {
          oidcConfigEndpoint = "https://example.eu.auth0.com/.well-known/openid-configuration";
          settings = {
            TURNconfig = {
              turns = [
                {
                  Proto = "udp";
                  URI = "turn:netbird.hiimkobeand.net:3478";
                  Username = "netbird";
                  Password._secret = "/etc/netbird-pass";
                }
              ];
            };
          };
        };
      };
    };
}
