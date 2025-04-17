{ lib, config, ... }:
{
  config = lib.mkIf config.modules.services.pufferpanel.enable {
    services.pufferpanel = {
      enable = true;
      environment = {
        PUFFER_WEB_HOST = ":8080";
      };
    };
  };
}
