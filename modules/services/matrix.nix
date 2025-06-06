{ lib, config, ... }:
{
  config = lib.mkIf config.modules.services.matrix.enable {
    services.matrix-conduit = {
      enable = true;
      settings.global = {
        port = 8000;
        server_name = "hiimkobeand.net";
        allow_registration = true;
      };
    };
  };
}
