{ lib, config, ... }:
{
  config = lib.mkIf config.modules.services.readeck.enable {
    services.readeck = {
      enable = true;
      settings = {
        server = {
          port = 8160;
        };
      };
    };
  };
}
